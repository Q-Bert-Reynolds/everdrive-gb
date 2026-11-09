# Image banks, OS pages, and cartridge RAM

Your fixed-32-KiB model matches the OS's resident CPU address range. The extra
code is also banked, but through a different window from an ordinary Game Boy
game. The `bank_001.asm` through `bank_004.asm` names originally came from
splitting the file into 16 KiB chunks; they do not describe the OS's runtime map.

This pass follows the exact stock v1.06 file: 81,920 bytes (`$14000`, 80 KiB), MD5
`f200a1c6417323274e30ddf6ce5ec263`. The customized build becomes 128 KiB after
`rgbfix` padding. File length and the header's advertised 32 KiB ROM size are
different facts.

## What the code establishes

- The first 32 KiB of the image contains resident code addressed at
  `$0000-$7fff`, including the shared function-pointer table at `$0200`.
- `OS_CallPage` saves the old `$BD08` value, writes the requested selector, calls
  `$A000`, and restores the old selector. Its argument is a descriptor pointer
  passed to the page entry, not an arbitrary function address within that page.
- Banked modules contain calls and data pointers in the `$A000-$BFFF` range.
  Their entry routines and API-table accesses agree with an 8 KiB page window.
- The main loop selects page 4. Other callers select pages 5-9 for the functions
  listed below. This is OS page switching rather than normal game MBC banking
  at `$4000-$7fff`.
- The OS writes flags and a temporary stack in the nominal ROM address range.
  Calling that range "ROM" describes its bus location, not proof of read-only
  physical storage.

The helper was previously named `OS_CallFarSRAM`. `OS_CallPage` describes the
observed operation without assuming the chip type behind the window.

## File-to-runtime map

All file offsets below are hexadecimal and inclusive.

| Original image chunk | File offsets | OS execution address | Rough contents |
| --- | --- | --- | --- |
| Bank 0 | `$00000-$03fff` | Fixed `$0000-$3fff` | Startup, snapshot/menu, display, SD/FAT core, API table |
| Bank 1 | `$04000-$07fff` | Fixed `$4000-$7fff` | Filesystem helpers, I2C/RTC, game saves, dialogs/status, compiler runtime, font |
| Bank 2, lower half | `$08000-$09fff` | Page 4 at `$A000` | File browser and game/file menus |
| Bank 2, upper half | `$0a000-$0bfff` | Page 5 at `$A000` | Main menu, options, about, device information, RTC setup |
| Bank 3, lower half | `$0c000-$0dfff` | Page 6 at `$A000` | Cartridge/service initialization, status/error display, SGB support |
| Bank 3, upper half | `$0e000-$0ffff` | Page 7 at `$A000` | Cheat service, import and editor |
| Bank 4, lower half | `$10000-$11fff` | Page 8 at `$A000` | Recently played list and persistence |
| Bank 4, upper half | `$12000-$13fff` | Page 9 at `$A000` | Diagnostics: RAM, ROM buffer, RTC, SD and copy tests |

The `$A000-$BFFF` region also contains hardware overlays: `$BDxx` registers and
the `$BE00-$BFFF` sector window. It is not uniformly ordinary paged RAM. The
modules use upper addresses such as `$BC00` for their own workspace.

The shared API is useful here: a banked module can call resident filesystem or
display code without switching out the page currently supplying its instructions.
Each page has an indirect-call trampoline consisting of `jp hl`. For example,
page 4's `BrowserCallHL` is at runtime `$B81D`: a `call` to that trampoline pushes
the caller's return address, then `jp hl` enters the function loaded from the API
table. The other pages have equivalent helpers at different addresses.

## Why labels still say $4000 or $6000

The rough pass retains the original RGBDS section layout to preserve every byte.
For banks 2-4, the linker labels are therefore **image coordinates**, not CPU
execution addresses:

```text
lower-half label $4000-$5fff + $6000 = runtime $A000-$BFFF
upper-half label $6000-$7fff + $4000 = runtime $A000-$BFFF
```

For example, `ShowMainMenu` is a label at image-bank-2 address `$6000`, stored at
file offset `$0a000`, and entered by the CPU at `$A000` with `$BD08=5`.
Selected same-page calls and string pointers now use symbolic expressions such
as `ShowOSOptions + OS_WINDOW_FROM_6000` to make this translation explicit.

Putting the banked modules into RGBDS `LOAD` sections could eventually make their
labels directly represent execution addresses. That is deferred; this pass does
not silently change the coordinate system of the remaining disassembly labels.

## PSRAM versus the memory map

PSRAM means *pseudo-static RAM*: it uses a DRAM storage core with internal refresh
and exposes a RAM interface to the outside. It is volatile memory, rather than
flash ROM. The CPU need not know which technology is behind a cartridge address.
See [Silicon Labs' PSRAM explanation](https://docs.silabs.com/wiseconnect/latest/external-memory-psram/).

In a flash cartridge, writable memory can hold a game ROM image and the FPGA can
present it through the game's ROM/MBC interface. Copying a game off SD into that
memory is what makes execution independent of continuing SD reads. The stock OS
streams the selected game through the cartridge sector window before configuring
its mapper and launching it.

Keep these roles separate when reasoning about the emulator:

1. The resident OS code and flags at `$0000-$7fff`.
2. Additional OS pages selected into `$A000` by `$BD08`.
3. The loaded game image and temporary snapshot storage accessed through the
   cartridge's buffer/mapping controls.
4. Game save RAM, selected separately by the OS.

These are logical roles, not a claim that there are four separate RAM chips.
The disassembly establishes the access paths but does not, by itself, identify
which physical chip backs the OS pages, whether any regions alias, or precisely
how the bootloader initially populates them. Saying "all the extra OS code is in
PSRAM" goes beyond what has been verified here. Gearboy's current allocation of
separate arrays is an implementation assumption, not hardware evidence.

Krikzz specifies an 8 MiB maximum game-ROM size and 128 KiB maximum save-RAM size;
those limits do not establish the OS storage layout. See the
[official EverDrive-GB X7 specifications](https://krikzz.com/our-products/cartridges/edgbx7.html).

## Source organization after the rough pass

Banks 2-4 are include indexes for `src/os/browser.asm`, `main_menu.asm`,
`services.asm`, `cheats.asm`, `recent_games.asm`, and `diagnostics.asm`.
Bank 1 now includes resident helpers from `src/sd/file_ops.asm`, `src/os/rtc.asm`,
`src/game/saves.asm`, `src/os/dialog.asm`, `src/os/status_text.asm`, and
`src/compiler_runtime.asm`. Its path-builder continuation and font stay in the
bank 1 index.

This is a navigation pass: major entries and confirmed text have names; long
`$ff` padding runs are expressed as `DS`. Many internal branches, allocator paths,
cheat details, RTC arithmetic helpers and compiler routines still need closer
analysis. Error text already named before this pass has been preserved.
