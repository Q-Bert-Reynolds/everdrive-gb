; Until all of WRAM has been mapped, we'll use constants instead of labels.
; SECTION "Gloval Vars", WRAM0

wGamepadState EQU $c2b0

;unsure abou these
;$c2b3 selected line
;$c2b5 last button state
;$0627 SRAM to IO table
;$bd02:
;  incremented when copying to/from end of SRAM ($be00)
;  CopyDEtoBD02 called before copying to/from end of SRAM