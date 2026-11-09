SECTION "UI palette", ROM0[$1fa4]

; Colors are 15 bit. Each RGB component ranges from 0 to 31.
UIColors::
IF CUSTOM_COLORS
  BackgroundColor:     RGB 5,  5,  6
  UnselectedTextColor: RGB 31, 26, 11
  MenuColor:           RGB 9,  18, 23
  SelectedTextColor:   RGB 31, 31, 29
ELSE
  BackgroundColor:     RGB 0,  0,  0
  UnselectedTextColor: RGB 4,  31, 4
  MenuColor:           RGB 15, 15, 15
  SelectedTextColor:   DW $ffff ;original sets the unused bit 15)
ENDC

  nop
  nop
  nop
  nop
