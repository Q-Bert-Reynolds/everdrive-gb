; Disassembly of "GBCOS.bin"
; This file was created with:
; mgbdis v1.5 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "src/options.inc"
INCLUDE "src/hardware.inc"
INCLUDE "src/macros.inc"
INCLUDE "src/constants.asm"

; Bank 0 modules. Each fragment keeps its original ROM0 address.
; See notes/BANK_0.md for the module map and remaining disassembly boundaries.
INCLUDE "src/main.asm"

INCLUDE "src/input.asm"
INCLUDE "src/display.asm"
INCLUDE "src/memory.asm"
INCLUDE "src/strings.asm"
INCLUDE "src/paths.asm";spills over into bank 1
INCLUDE "src/random.asm"
INCLUDE "src/i2c.asm"

INCLUDE "src/snapshot.asm"
INCLUDE "src/registry.asm"
INCLUDE "src/cartridge_buffer.asm"
INCLUDE "src/menu_text.asm"
INCLUDE "src/in_game_menu.asm"
INCLUDE "src/colors.asm"

INCLUDE "src/game/metadata.asm"
INCLUDE "src/game/loader.asm"
INCLUDE "src/game/launcher.asm"

INCLUDE "src/sd/file_io.asm"
INCLUDE "src/sd/fat_volume.asm"
INCLUDE "src/sd/fat_directory.asm"
INCLUDE "src/sd/fat_cluster.asm"
INCLUDE "src/sd/spi.asm"

INCLUDE "src/os/startup.asm"
INCLUDE "src/os/state.asm"
INCLUDE "src/os/api.asm"


; Image bank 1 is the upper half of the fixed 32 KiB OS region.
; It is not a switchable $4000 ROM bank while the OS is running.
INCLUDE "src/sd/file_ops.asm"
INCLUDE "src/os/rtc.asm"
INCLUDE "src/game/saves.asm"
INCLUDE "src/os/dialog.asm"
INCLUDE "src/os/status_text.asm"
INCLUDE "src/compiler_runtime.asm"
INCLUDE "src/font.asm"


; Image bank 2: two independent 8 KiB OS pages (4 and 5).
; See notes/MEMORY_LAYOUT.md; both pages execute through $a000-$bfff.
INCLUDE "src/os/browser.asm"
INCLUDE "src/os/main_menu.asm"


; Image bank 3: two independent 8 KiB OS pages (6 and 7).
; See notes/MEMORY_LAYOUT.md; both pages execute through $a000-$bfff.
INCLUDE "src/os/services.asm"
INCLUDE "src/os/cheats.asm"


; Image bank 4: two independent 8 KiB OS pages (8 and 9).
; See notes/MEMORY_LAYOUT.md; both pages execute through $a000-$bfff.
INCLUDE "src/os/recent_games.asm"
INCLUDE "src/os/diagnostics.asm"
