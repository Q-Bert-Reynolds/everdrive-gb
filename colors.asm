;Colors are 15 bit.
;Values range from 0 to 31.
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