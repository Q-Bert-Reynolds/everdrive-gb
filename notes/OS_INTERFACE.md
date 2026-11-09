# OS state and function interface

The former `writable.asm` combined two different structures. They are now in
`src/os_state.asm` and `src/os_api.asm`. The names and annotations preserve the
stock v1.06 bytes.

## Runtime state: $01f0-$01ff

These bytes live in the cartridge's writable OS image. They are neither Game Boy
WRAM nor the cartridge registers at `$BD00` onward. The code writes them as the
OS and launched game exchange control.

| Address | Label / initial value | Observed use |
| --- | --- | --- |
| `$01f0` | `OSSaveBackupPending` / 0 | Set by `LaunchPreparedGame` before initializing the selected game's save RAM when `$c007` is zero. On OS entry, storage initialization clears it and calls the save backup routine (`Bank1Function6334`). That routine writes save RAM and any valid snapshot to their files. |
| `$01f1` | `OSInitializationPending` / 1 | Copied into WRAM `$c004` and cleared by `InitializeStorageAndSettings`. It distinguishes the first storage initialization of the resident OS image from later ones. The meaning of its banked consumers is not fully traced yet. |
| `$01f2` | `OSReturnToMenuRequested` / 0 | Set by the in-game Back to menu action. `EntryPoint` consumes it and writes `$10` to `$BD06` to request the cartridge's OS reboot. |
| `$01f3` | `SnapshotUse32KiBCartRAM` / 0 | A boolean derived from `wGameRAMMask`, not a page count. `GetSnapshotCartRAMChunkCount` returns C=1 or C=4, selecting an 8 KiB or 32 KiB save-RAM portion of the snapshot. |
| `$01f4-$01ff` | `OSStateReserved` / all `$ff` | No actual accesses identified. Keep as reserved/padding; no hardware meaning is established. |

The flags persist while that OS image remains resident; this does not establish
that they survive power loss.

### Why `Writable01f5` looked referenced

In `Call_001_6402`, the apparent reference was:

```asm
ld hl, Writable01f5  ; numeric value $01f5
add hl, sp
```

This calculates `SP + $01f5`. It does not read address `$01f5`. The disassembler
substituted a label solely because the immediate value matched a data address.
The same problem affected three nearby uses of `Writable01f1` and
`SaveStatePageCount`. Those four operands are now numeric stack offsets with
comments, so they no longer imply state accesses.

## Function table: $0200-$027f

The remaining 128 bytes are 64 little-endian function pointers. For example:

```asm
OSAPI_PrepareGame:          DW PrepareGame             ; $0200 -> $1784
OSAPI_ClearShadowScreen:    DW ClearShadowScreen       ; $0234 -> $217a
OSAPI_GetDirectoryEntryIDs: DW Bank1Function58B6        ; $0256 -> $58c4
```

These are addresses, not executable jump stubs. Banked OS modules load a pointer
from a slot and call through it. At the beginning of bank 2, for example, the code
loads the word from `$0256` into HL before calling an indirect-call helper. It
therefore requests the directory-entry ID array without embedding the getter's
implementation address. Several modules also store `$0200` as their table base
and access slots by offset.

| Slot addresses | Services |
| --- | --- |
| `$0200-$0210` | Game preparation/launch/metadata, cartridge-buffer file transfers, registry access, random game search |
| `$0212-$021c` | Far calls, cartridge buffer selection, memory copy/fill |
| `$021e-$0240` | Input, text formatting, menu cursor/display operations, VBlank wait |
| `$0242-$0258` | Directory indexing, file open/read/write, path construction, directory state |
| `$025a-$0260` | String length, suffix comparisons, byte comparison |
| `$0262-$026e` | Dialogs, status-text buffer operations, dialog row override |
| `$0270-$027e` | I2C byte transfers and additional bank 1 helpers awaiting detailed analysis |

`src/os_api.asm` now names every slot and uses `DW` with an existing function
label where one is available. A few unnamed bank 1 targets remain numeric, and
the last six slots retain address-based names rather than guessed semantics.
Those are explicitly deferred to the bank 1 pass. The table ends exactly at
`$0280`, where `EntryPoint` begins; assembly assertions check its size.

The API also explains why code at `$4000-$7fff` appears in these pointers: those
addresses are part of the resident OS code image. This table is separate from
the `$BDxx` FPGA register interface and the filesystem's on-card data.
