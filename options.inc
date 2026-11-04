; Build options
; Each option defaults to 1 (enabled). Override on the command line, e.g.
;   rgbasm -D KEYBOARD=0 ...
; or via make:
;   make KEYBOARD=0
; `make original` turns all of them off, which reproduces GBC-OS-v1.04.bin
; byte for byte.

; CUSTOM_COLORS: use the palette in colors.asm instead of the stock
; black/green/grey/white UI colors.
IF !DEF(CUSTOM_COLORS)
  DEF CUSTOM_COLORS EQU 1
ENDC

; CUSTOM_FONT: use gfx/font.png instead of gfx/font_original.png.
IF !DEF(CUSTOM_FONT)
  DEF CUSTOM_FONT EQU 1
ENDC

; KEYBOARD: PS/2 and insideGadgets USB keyboard support.
IF !DEF(KEYBOARD)
  DEF KEYBOARD EQU 1
ENDC
