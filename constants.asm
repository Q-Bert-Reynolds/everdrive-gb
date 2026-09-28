DEF EDGB_UNLOCK_KEY   EQU $a5 

;SRAM
DEF sSPIData          EQU $bd00
DEF sSPIControl       EQU $bd01
DEF sBufferSectorLow  EQU $bd02
DEF sBufferSectorHigh EQU $bd03
DEF sRegBD04          EQU $bd04
DEF sRegBD05          EQU $bd05
DEF sStreamingConfig  EQU $bd06
DEF sCartMapperMode   EQU $bd07
DEF sCurrentBank      EQU $bd08
DEF sRegBD09          EQU $bd09
DEF sEDGBUnlock       EQU $bd0a
DEF sRegBD0B          EQU $bd0b
DEF sI2CInterfaceC    EQU $bd0c
DEF sI2CInterfaceD    EQU $bd0d
DEF sI2CInterfaceE    EQU $bd0e
DEF sI2CInterfaceF    EQU $bd0f
DEF sBufferWindow     EQU $be00;$be00 - $bfff
DEF sIO               EQU $bf00;$bf00 - $bf32... overlaps with buffer window
DEF sGBCFlags         EQU $bf4d
; The calls to $b805 and $a309 are SDCC compiler runtime helpers placed in RAM.
; (indirect function call trampoline jp hl and math routines) 

;WRAM
DEF wGamepadState EQU $c2b0
  ;$c2b3 selected line?
  ;$c2b5 last button state?

