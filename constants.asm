DEF EDGB_UNLOCK_KEY   EQU $a5 

;SRAM
DEF sSPIData           EQU $bd00 ; SPI byte transfer register
DEF sSPIControl        EQU $bd01 ; SPI control/CS clock mode register
DEF sBufferSectorLow   EQU $bd02 ; 512-byte sector pointer low byte
DEF sBufferSectorHigh  EQU $bd03 ; 512-byte sector pointer high byte

; Launch/game configuration registers
DEF sGameROMMask       EQU $bd04 ; ROM bank mask for the launched game
DEF sGameRAMMask       EQU $bd05 ; RAM bank mask for the launched game
DEF sStreamingConfig   EQU $bd06 ; streaming and OS-mode config bits
DEF sCartMapperMode    EQU $bd07 ; cartridge mapper mode for the target game
DEF sCurrentBank       EQU $bd08 ; current SRAM bank in the windowed OS map
DEF sCartSwitch        EQU $bd09 ; cart-switch / resume-reboot latch bits
DEF sEDGBUnlock        EQU $bd0a ; EverDrive unlock key register
DEF sExtraControl      EQU $bd0b ; spare control register / reserved slot

; I2C / RTC expansion registers
DEF sI2CInterfaceC    EQU $bd0c ; I2C bus control/status
DEF sI2CInterfaceD    EQU $bd0d ; I2C bus data register
DEF sI2CInterfaceE    EQU $bd0e ; I2C bus status / scratch register
DEF sI2CInterfaceF    EQU $bd0f ; I2C bus scratch register

DEF sRegBD20          EQU $bd20;new in v1.06
DEF sBufferWindow     EQU $be00;$be00 - $bfff ; 512-byte SRAM window used by the OS snapshot routines
DEF sIO               EQU $bf00;$bf00 - $bf32... overlaps with buffer window ; shadowed IO register window
DEF sGBCFlags         EQU $bf4d ; GBC detection / speed flags

; The code sometimes calls into the OS runtime helper area in RAM, not a ROM routine.
; These are SDCC-generated stubs / helper entry points and their exact addresses drift as
; the OS is rebuilt, so the current build exposes them at $a13b, $a306, $a309, $b81d, and $b8b5.
; The old "$b805" note is stale and does not match the current disassembly.
DEF sSDCCRuntimeBranch  EQU $a13b ; helper branch target in the RAM runtime area
DEF sSDCCRuntimeCall    EQU $a306 ; indirect-call / trampoline helper in RAM
DEF sSDCCRuntimeHelper  EQU $a309 ; SDCC runtime helper entry used by generated code
DEF sSDCCSharedHelperA  EQU $b81d ; common SDCC helper in the RAM runtime window
DEF sSDCCSharedHelperB  EQU $b8b5 ; second common SDCC helper in the RAM runtime window

;VBlank save/restore snapshot addresses
DEF sSavedSP             EQU $0620 ; stack pointer saved before the OS snapshot
DEF sSavedMapperRegs     EQU $bd14 ; cart mapper registers saved in SRAM during a pause
DEF sSaveStateWindow     EQU $3e40 ; save sector window used for resumed game state
DEF sSavedScreenState    EQU $3e62 ; first block copied back during restore

; Snapshot sector numbers, selected through sBufferSectorLow/High, not CPU addresses.
; $BD06 bit 1 selects game save RAM; clear selects the snapshot/PSRAM buffer.
DEF SNAPSHOT_FIRST_SECTOR EQU $3e40
DEF SAVE_SLOT_FIRST_SECTOR EQU $0040
DEF SNAPSHOT_SECTOR_COUNT EQU $00a4 ; 82 KiB, copied through a 512-byte stack buffer
DEF SNAPSHOT_HEADER_SECTOR EQU $40 ; low byte; high byte stays $3e during capture
DEF SNAPSHOT_DISPLAY_SECTOR EQU $41
DEF SNAPSHOT_CART_RAM_SECTOR EQU $62
DEF SNAPSHOT_CGB_SECTOR EQU $a2
DEF SNAPSHOT_STACK_TOP EQU $066e ; temporary stack in writable OS memory
DEF OS_STACK_TOP EQU $dfff

; Fields visible at $BE00 when the snapshot header sector is selected.
DEF sSnapshotSavedSP EQU sBufferWindow + 4
DEF sSnapshotMapperRegs EQU sBufferWindow + 6 ; RAMG, mode, RAM bank, ROM bank
DEF sSnapshotHRAM EQU $bf80 ; HRAM shadow in the OAM/IO snapshot sector

; Stack-local menu descriptors end in a word <= $000f instead of a string pointer.
DEF MENU_FLAG_MESSAGE EQU $0001 ; dismiss on any button; return initial selection
DEF MENU_FLAG_COMPACT EQU $0004 ; single-spaced rows
DEF INGAME_ACTION_SAVE EQU 0
DEF INGAME_ACTION_LOAD EQU 1
DEF INGAME_ACTION_EXIT EQU 2
DEF MENU_ACTION_CANCEL EQU $ff

;WRAM
DEF wMenuScreenBuffer EQU $c145 ; 20 x 18 tile shadow screen
DEF wMenuTextPointer EQU $c2ad ; word: next destination in the shadow screen
DEF wMenuCursorOffset EQU $c2af ; word: x + 20*y in the shadow screen
DEF wMenuTextMode EQU $c2b2 ; ORed into character tiles ($80 for unselected text)
DEF wMenuRowOverride EQU $d7d6 ; $ff = center dialog vertically
DEF wGamepadState EQU $c2b1;$c2b0 in v1.04 (v1.06 inserts a byte before $c2ad)
  ;$c2b4 selected line?
  ;$c2b6 last button state?

