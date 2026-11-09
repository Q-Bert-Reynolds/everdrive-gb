SECTION "Font Tiles", ROMX[$7d00], BANK[1]
FontTiles::
IF CUSTOM_FONT
  INCBIN "gfx/font.1bpp"
ELSE
  INCBIN "gfx/font_original.1bpp"
ENDC
