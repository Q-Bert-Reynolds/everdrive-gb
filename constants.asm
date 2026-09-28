;SRAM
  ;  lots of calls to _SRAM addresses
  ;  it's likely these are data blocks misidentified as code

  ;$bd02
  ;  incremented when copying to/from end of SRAM ($be00)
  ;  CopyDEtoBD02 called before copying to/from end of SRAM
  ;  set to %01100001 before setting CPU speed
  ;$bf4d GBC flags

; The calls to $b805 and $a309 are SDCC compiler runtime helpers placed in RAM.
; (indirect function call trampoline jp hl and math routines) 

;WRAM
DEF wGamepadState EQU $c2b0
  ;$c2b3 selected line?
  ;$c2b5 last button state?

