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

;WRAM
DEF wGamepadState EQU $c2b1;$c2b0 in v1.04 (v1.06 inserts a byte before $c2ad)
  ;$c2b4 selected line?
  ;$c2b6 last button state?

