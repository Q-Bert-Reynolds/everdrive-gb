;SRAM
;$a309, $b805, $ba79 
;  called a lot in bank 2
;  it's likely these are data blocks misidentified as code

;$bd02
;  incremented when copying to/from end of SRAM ($be00)
;  CopyDEtoBD02 called before copying to/from end of SRAM
;  set to %01100001 before setting CPU speed
;$bf4d GBC flags


;WRAM
wGamepadState EQU $c2b0
;$c2b3 selected line
;$c2b5 last button state


;Writable ROM space
edLCDC         EQU $0622
edSVBK         EQU $0623
edVBK          EQU $0624
edBCPS         EQU $0625
edOCPS         EQU $0626
