; Disassembly of "GBCOS.bin"
; This file was created with:
; mgbdis v1.5 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

INCLUDE "src/options.inc"
INCLUDE "src/hardware.inc"
INCLUDE "src/macros.inc"
INCLUDE "src/constants.asm"

; Bank 0 modules. Each fragment keeps its original ROM0 address.
; See BANK_0.md for the module map and remaining disassembly boundaries.
INCLUDE "src/main.asm"

INCLUDE "src/input.asm"
INCLUDE "src/display.asm"
INCLUDE "src/memory.asm"
INCLUDE "src/strings.asm"
INCLUDE "src/paths.asm"
INCLUDE "src/random.asm"

INCLUDE "src/snapshot.asm"
INCLUDE "src/cartridge_buffer.asm"
INCLUDE "src/os_startup.asm"
INCLUDE "src/registry.asm"
INCLUDE "src/menu_text.asm"
INCLUDE "src/in_game_menu.asm"

INCLUDE "src/game/metadata.asm"
INCLUDE "src/game/loader.asm"
INCLUDE "src/game/launcher.asm"

INCLUDE "src/sd/file_io.asm"
INCLUDE "src/sd/fat_volume.asm"
INCLUDE "src/sd/fat_directory.asm"
INCLUDE "src/sd/fat_cluster.asm"
INCLUDE "src/sd/spi.asm"

INCLUDE "src/writable.asm"
INCLUDE "src/i2c.asm"
INCLUDE "src/colors.asm"

INCLUDE "src/bank_001.asm"
INCLUDE "src/bank_002.asm"
INCLUDE "src/bank_003.asm"
INCLUDE "src/bank_004.asm"