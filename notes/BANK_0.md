# Bank 0 source map

`src/GBCOS.asm` includes the modules directly, with game code under `src/game/`
and storage code under `src/sd/`. Each extracted fragment has a fixed `SECTION`
at its original address, so file order does not change the ROM layout. Local
branches use `.label`; entry points shared across sections have global names.

These names describe the stock v1.06 instructions and their callers. They do not
validate Gearboy's interpretation of the cartridge hardware. The refactor is
checked against both pre-refactor binaries, including the stock MD5
`f200a1c6417323274e30ddf6ce5ec263`.

| File | Responsibilities |
| --- | --- |
| `os/state.asm` | Four resident OS flags and reserved bytes at `$01f0-$01ff` |
| `os/api.asm` | 64 function-pointer slots at `$0200-$027f`; see [OS_INTERFACE.md](OS_INTERFACE.md) |
| `snapshot.asm` | Writable snapshot workspace, VBlank capture, RAM/display/CGB restoration, handoff back to the game |
| `cartridge_buffer.asm` | 512-byte cartridge-window copies, sector-pointer increment, IO shadow restoration, window clearing |
| `display.asm` | VBlank wait, shadow-screen upload, DMG/CGB/SGB display initialization, palette/font upload |
| `colors.asm` | Customizable UI palette data |
| `input.asm` | Button polling, A/B swap flag, repeat handling, raw joypad sampling |
| `memory.asm` | General memory copy/fill and seeded 16-bit additive checksum |
| `os/startup.asm` | Main OS loop, storage initialization, system directories, banked status callback |
| `registry.asm` | Registry defaults/load/save/checksum, cartridge EEPROM settings, save-RAM marker, FAT timestamp getters |
| `game/metadata.asm` | ROM header, mapper, battery/RTC, ROM/RAM masks and sizes, LSDJ special case |
| `game/loader.asm` | Loading screen, save/RTC preparation, ROM loading, launch, random-game search |
| `menu_text.asm` | Text, hex/decimal formatting, cursor placement, shadow-screen rectangle fills |
| `random.asm` | Pseudo-random word generation from timing state, memory samples and a counter |
| `strings.asm` | Equality/suffix matching, copy/append, hex/decimal string formatting |
| `sd/fat_volume.asm` | FAT32 mounting, directory/FAT sector caches, boot-record detection, little-endian word reader |
| `sd/fat_cluster.asm` | Cluster/sector conversion and FAT-chain traversal |
| `sd/fat_directory.asm` | Directory indexing, encoded entry IDs, short-name and long-name entry decoding |
| `sd/file_io.asm` | File opening, sector skipping, reads to RAM or cartridge windows, byte-count reads |
| `paths.asm` | Path joining and extension construction |

The shared WRAM map and expanded directory-entry offsets are in `constants.asm`.
The Makefile tracks `.asm` and `.inc` files recursively under `src/` so editing any extracted
module rebuilds the ROM.

## Useful entry points

- `InitializeStorageAndSettings`: initialize SD, mount FAT32, ensure system
  directories, load/validate the registry, then initialize banked services.
- `ReadGameMetadata`: read the selected file's ROM header and derive cartridge
  metadata. The battery-type list and LSDJ title prefix are visible in this file.
- `PrepareGame`: handle the previous save/RTC, decode metadata, update the
  registry and prepare the selected game's save/RTC.
- `LaunchPreparedGame`: stream the selected ROM into the cartridge, configure
  mapper masks and launch it.
- `FindRandomGame`: try up to 128 random entries, following directories and
  matching the `gb`/`gbc` suffix list. The search/error strings are now explicit
  data instead of apparent instructions.
- `ReadDirectoryIndex`: build an array of up to 1000 directory entry IDs.
- `ReadDirectoryEntry`: expand an ID into a `$e5`-byte record. IDs encode the
  absolute sector shifted left four bits, with the entry number in the low nibble.
- `OpenFileForSectorIO`, `SkipFileSectors`, `ReadFileSectors`: operate on one
  shared file cursor. The read mode selects ordinary RAM or cartridge windows;
  it does **not** select SD reads versus writes.

## Boundaries and implementation details

The mount routine recognizes FAT16 but rejects it. Its FAT32 layout arithmetic
assumes two FATs and root cluster 2. Long-filename decoding uses the low byte of
each UTF-16 character. These are observed properties of the stock code, not
general FAT requirements.

Some work still runs through bank 1 helpers and SRAM-bank dispatchers. Their
existing names remain where their internals have not been analyzed in this pass.
For example, `InitializeStorageAndSettings` compares two system words before
returning status `$52`; their precise hardware meaning remains unresolved.

`BuildPathWithExtension` crosses `$3fff` into bank 1. Its continuation bytes remain
encoded data at the start of `bank_001.asm`, now labeled at `$4000` and `$401d`.
The old reference to `jr_003_401d` was a disassembler artifact: the instruction
contains CPU address `$401d`, and the continuation is in the bank 1 byte stream.
Renaming that reference preserves its target bytes.

For the in-game menu and snapshot flow, see [IN_GAME_MENU.md](IN_GAME_MENU.md).
