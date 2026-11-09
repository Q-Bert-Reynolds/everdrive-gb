; OS page 5: runtime $a000-$bfff via $BD08.
; Linker addresses $6000-$7fff describe its location in the BIN only.
SECTION "ROM Bank 2, Section 2", ROMX[$6000], BANK[2]
; OS page 5 entry: main menu. Runtime $a000; selected by $BD08=5.
ShowMainMenu::
  add sp, -$27
  ld hl, sp + $0a
  ld a, l
  ld d, h
  ld hl, sp + $23
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $28
  inc hl
  ld [hl], $a3
  ld hl, sp + $24
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $32
  ld [bc], a
  inc bc
  ld a, $a3
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $3a
  inc hl
  ld [hl], $a3
  ld hl, sp + $24
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $4a
  inc hl
  ld [hl], $a3
  ld hl, sp + $24
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $56
  inc hl
  ld [hl], $a3
  ld hl, sp + $24
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000a
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $5d
  inc hl
  ld [hl], $a3
  ld hl, sp + $24
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000c
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $69
  inc hl
  ld [hl], $a3
  ld hl, sp + $24
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000e
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $75
  inc hl
  ld [hl], $a3
  ld hl, sp + $24
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0010
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $7f
  inc hl
  ld [hl], $a3
  ld hl, sp + $24
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0012
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp + $1e
  ld [hl], $00
  ld hl, $bc00
  ld [hl], $00
  inc hl
  ld [hl], $02
  ld de, OSAPI_GetDirectoryCluster
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  push hl
  ld hl, sp + $08
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, sp + $24
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call $b025
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $000c
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld c, e
  ld b, d
  inc bc
  inc bc
  ld a, [bc]
  or a
  jr nz, jr_002_6101

  ld a, $06
  push af
  inc sp
  call $b07d
  inc sp

jr_002_6101:
  ld hl, sp + $01
  ld a, l
  ld d, h
  ld hl, sp + $23
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  inc hl
  ld [hl+], a
  ld [hl], e
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0034
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0062
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $bc02
  ld hl, sp + $1e
  ld a, [hl]
  push af
  inc sp
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $03
  ld a, e
  ld hl, sp + $1e
  ld [hl], a
  ld a, [hl]
  push af
  inc sp
  call $b0f8
  inc sp
  ld hl, sp + $00
  ld [hl], e
  ld a, [hl]
  inc a
  jr nz, jr_002_6164

  ld e, $00
  jp $a325


jr_002_6164:
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0034
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld hl, sp + $00
  ld a, [hl]
  or a
  jr nz, jr_002_618b

  call ShowOSOptions + OS_WINDOW_FROM_6000
  ld a, e
  or a
  jp nz, $a325

jr_002_618b:
  ld hl, sp + $00
  ld a, [hl]
  dec a
  jp nz, $a1c6
  ld hl, sp + $01
  ld e, l
  ld d, h
  ld a, $01
  ld [de], a
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0012
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp + $24
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld a, $08
  push af
  inc sp
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $03
  ld a, e
  or a
  jr z, @ + 6
  ld e, a
  jp $a325
  ld hl, sp + $00
  ld a, [hl]
  sub $02
  jp nz, $a291
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0054
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  push hl
  ld hl, sp + $21
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, sp + $06
  ld a, [hl]
  ld hl, sp + $1f
  sub [hl]
  jr nz, @ + 27
  ld hl, sp + $07
  ld a, [hl]
  ld hl, sp + $20
  sub [hl]
  jr nz, @ + 19
  ld hl, sp + $08
  ld a, [hl]
  ld hl, sp + $21
  sub [hl]
  jr nz, @ + 11
  ld hl, sp + $09
  ld a, [hl]
  ld hl, sp + $22
  sub [hl]
  jp z, $a274
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0034
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0036
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0042
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp + $08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $04
  ld a, e
  or a
  jr z, @ + 6
  ld e, a
  jp $a325
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0010
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld a, e
  jp $a325
  ld hl, sp + $00
  ld a, [hl]
  sub $03
  jp nz, $a2ce
  ld hl, sp + $01
  ld e, l
  ld d, h
  ld a, $04
  ld [de], a
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0012
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp+$26
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld a, $07
  push af
  inc sp
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $03
  ld a, e
  or a
  jr z, jr_002_61c7

  ld e, a
  jp $a325


jr_002_61c7:
  ld hl, sp+$00
  ld a, [hl]
  sub $04
  jr nz, jr_002_62dc

  call ShowDeviceInfo + OS_WINDOW_FROM_6000
  jp $a10f


jr_002_62dc:
  ld hl, sp + $00
  ld a, [hl]
  sub $05
  jr nz, jr_002_630e

  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0012
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  ld hl, $0000
  push hl
  ld a, $09
  push af
  inc sp
  ld l, c
  ld h, b
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $03
  ld a, e
  or a
  jp z, $a10f

  ld e, a
  jr jr_002_6326

jr_002_630e:
  ld hl, sp + $00
  ld a, [hl]
  sub $06
  jr nz, jr_002_6318

  call ShowRTCSetup + OS_WINDOW_FROM_6000

jr_002_6318:
  ld hl, sp + $00
  ld a, [hl]
  sub $07
  jp nz, $a10f

  call ShowAboutScreen + OS_WINDOW_FROM_6000
  jp $a10f


jr_002_6326:
  add sp, $27
  ret
MainMenuTitleText::
  DB "Main Menu", $00
MainMenuOptionsText::
  DB "Options", $00
MainMenuRecentText::
  DB "Recently Played", $00
MainMenuRandomText::
  DB "Random Game", $00
MainMenuCheatsText::
  DB "Cheats", $00
MainMenuInfoText::
  DB "Device Info", $00
MainMenuDiagnosticsText::
  DB "Diagnostics", $00
MainMenuRTCText::
  DB "Setup RTC", $00
MainMenuAboutText::
  DB "About", $00
ShowAboutScreen::
; About/help screen selected by main-menu item 7.
  add sp, -$04
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $000c
  add hl, bc
  ld c, l
  ld b, h

jr_002_6395:
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de

jr_002_639a:
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld b, e
  ld c, d
  ld hl, sp+$00
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

jr_002_63af:
  ld hl, $003c
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  xor a
  push af
  inc sp
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0022

jr_002_63cf:
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, AboutTitleText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $002c
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$02
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  pop de
  push de
  ld hl, $0006
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld e, a
  ld d, $00
  ld bc, $0000
  push bc
  push de
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $04
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0022
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $a6f0
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $003c
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld a, $80
  push af
  inc sp
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0022
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, AboutDeveloperHeadingText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $003c
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  xor a
  push af
  inc sp
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0022
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, AboutDeveloperText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0022
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $a6f0
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $003c
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld a, $80
  push af
  inc sp
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0022
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, AboutSupportHeadingText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $003c
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  xor a
  push af
  inc sp
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0022
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, AboutSupportText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0022
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $a6f0
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $003c
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld a, $80
  push af
  inc sp
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0022
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, AboutControlsHeadingText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $003c
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  xor a
  push af
  inc sp
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0022
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, AboutPageControlsText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $000e
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld c, e
  ld b, d
  inc bc
  inc bc
  inc bc
  ld a, [bc]
  ld hl, sp+$02
  ld [hl], a
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0022
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp+$02
  ld a, [hl]
  or a
  jr z, jr_002_6664

  ld de, AboutBMenuText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0022
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, AboutABackText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  jr jr_002_668e

jr_002_6664:
  ld de, AboutAMenuText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0022
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, AboutBBackText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02

jr_002_668e:
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0022
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, AboutMainMenuText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0022
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, AboutLastGameText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0036
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $001e
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $04
  ret
AboutTitleText::
  DB "EverDrive-GB X", $00
  nop
AboutDeveloperHeadingText::
  DB "Developed by:       ", $00
AboutDeveloperText::
  DB "I. Golubovskiy", $00
AboutSupportHeadingText::
  DB "Support:            ", $00
AboutSupportText::
  DB "www"
jr_002_675f:
  DB ".k"
jr_002_6761:
  DB "ri"
jr_002_6763:
  DB "kz"
jr_002_6765:
  DB "z.co"
jr_002_6769:
  DB "m", $00
AboutControlsHeadingText::
  DB "Control:            ", $00
AboutPageControlsText::
  DB "LEF/RIG-switch page", $00
AboutBMenuText::
  DB "B"
jr_002_6795:
  DB "-f"
jr_002_6797:
  DB "il"
jr_002_6799:
  DB "e me"
jr_002_679d:
  DB "nu"
jr_002_679f:
  DB $00
AboutABackText::
  DB "A-back", $00
AboutAMenuText::
  DB "A-file menu", $00
AboutBBackText::
  DB "B-back", $00
AboutMainMenuText::
  DB "SELECT-main menu", $00
AboutLastGameText::
  DB "START-run last game", $00
ShowDeviceInfo::
; Device information selected by main-menu item 4.
  add sp, -$1c
  ld hl, sp+$00
  ld a, l
  ld d, h
  ld hl, sp + $16
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $ab
  inc hl
  ld [hl], $af
  ld hl, sp + $17
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $af
  ld [bc], a
  inc bc
  ld a, $af

jr_002_6800:
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de

jr_002_6809:
  ld b, l
  ld c, h
  ld [hl], $b2
  inc hl
  ld [hl], $af
  ld hl, sp + $17
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h

jr_002_681c:
  ld [hl], $b6
  inc hl
  ld [hl], $af
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $000c
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]

jr_002_6834:
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld b, e
  ld c, d
  ld hl, sp+$08
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0064
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, $0003
  push hl
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $afba
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, DeviceInfoCartText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0068
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $0e
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld e, a
  ld d, $00
  ld bc, $0000
  push bc
  push de
  ld hl, sp + $12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $04
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $afdf
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, DeviceInfoOSVersionText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0068
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $0e
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000b
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $10
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld b, $00
  ld de, $0000
  push de
  push bc
  ld hl, sp + $12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $04
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $afeb
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $006a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $0e
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  push bc
  inc sp
  ld hl, sp + $0f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $afdf
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, DeviceInfoFPGAVersionText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $006a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  push af
  inc sp
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $afdf
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, DeviceInfoSystemText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $10
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$09
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, [bc]
  ld c, a
  ld b, $00
  sla c
  rl b
  ld hl, sp + $16
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  push bc
  ld hl, sp + $12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $afdf
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, DeviceInfoDateText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $006a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $10
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000d
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $0e
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld a, b
  and $1f
  ld d, a
  ld e, $00
  push de
  inc sp
  call Bank2Function7A48 + OS_WINDOW_FROM_6000
  inc sp
  ld d, e
  push de
  inc sp
  ld hl, sp + $11
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $afeb
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $006a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $10
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  srl c
  rr b
  srl c
  rr b
  srl c
  rr b
  srl c
  rr b
  srl c
  rr b
  ld a, b
  and $0f
  ld d, a
  ld e, $00
  push de
  inc sp
  call Bank2Function7A48 + OS_WINDOW_FROM_6000
  inc sp
  ld d, e
  push de
  inc sp
  ld hl, sp + $11
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $afeb
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0068
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $10
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  srl a
  ld c, a
  ld b, $00
  ld hl, $07bc
  add hl, bc
  ld c, l
  ld b, h
  ld de, $0000
  push de
  push bc
  ld hl, sp + $14
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $04
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $afdf
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, DeviceInfoTimeText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $006a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $10
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000f
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $0e
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  ld hl, $001e
  push hl
  push bc
  call Bank2Function7B11 + OS_WINDOW_FROM_6000
  add sp, $04
  ld hl, $003c
  push hl
  push de
  call Bank2Function7B11 + OS_WINDOW_FROM_6000
  add sp, $04
  ld d, e
  push de
  inc sp
  call Bank2Function7A48 + OS_WINDOW_FROM_6000
  inc sp
  ld d, e
  push de
  inc sp
  ld hl, sp + $11
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $b015
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $006a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $10
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  ld hl, $001e
  push hl
  push bc
  call Bank2Function7B11 + OS_WINDOW_FROM_6000
  add sp, $04
  ld hl, $003c
  push hl
  push de
  call Bank2Function7B25 + OS_WINDOW_FROM_6000
  add sp, $04
  ld d, e
  push de
  inc sp
  call Bank2Function7A48 + OS_WINDOW_FROM_6000
  inc sp
  ld d, e
  push de
  inc sp
  ld hl, sp + $11
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $b015
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $006a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $10
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  ld hl, $001e
  push hl
  push bc
  call Bank2Function7B25 + OS_WINDOW_FROM_6000
  add sp, $04
  ld a, e
  add a
  push af
  inc sp
  call Bank2Function7A48 + OS_WINDOW_FROM_6000
  inc sp
  ld d, e
  push de
  inc sp
  ld hl, sp + $11
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $afdf
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, DeviceInfoPowerCounterText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0068
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $10
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $001b
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, sp + $0a
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $14
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $04
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $afdf
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $003c
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  xor a
  push af
  inc sp
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0038
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, $1010;probably not a jump address
  push hl
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0038
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, $1000
  push hl
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0022
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $b021
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0030
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$0a
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0013
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, sp + $12
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld hl, sp+$0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $002a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $b015
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $002e
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $12
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp + $09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0017
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $0a
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp + $18
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  push af
  ld hl, sp + $1a
  ld d, [hl]
  inc hl
  ld e, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld c, [hl]
  pop af
  ld a, $10
  srl c
  rr b
  rr e
  rr d
  dec a
  jr nz, @ - 9
  push de
  inc sp
  ld hl, sp + $13
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $002a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $b015
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0030
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp + $0b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp + $18
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $002a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $b015
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0030
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $18
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp + $09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $001f
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, sp + $12
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld hl, sp + $1a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0062
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  xor a
  push af
  inc sp
  ld hl, $0000
  push hl
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $03
  add sp, $1c
  ret


  ccf
  ccf
  ccf
  nop
  ld b, a
  ld b, d
  nop
  ld d, e
  ld b, a
  ld b, d
  nop
  ld b, a
  ld b, d
  ld b, e
  nop
  ld d, e
  ld a, c
  ld [hl], e
  ld [hl], h
  ld h, l
  ld l, l
  jr nz, DeviceInfoTimeText

  ld l, [hl]
  ld h, [hl]
  ld l, a
  ld [hl], d
  ld l, l
  ld h, c
  ld [hl], h
  ld l, c
  ld l, a
  ld l, [hl]
  ld a, [bc]
  nop
DeviceInfoCartText::
  DB "Cart    :ED-GB-X", $00
  ld a, [bc]
  nop
DeviceInfoOSVersionText::
  DB "OS ver  :", $00
  ld l, $00
DeviceInfoFPGAVersionText::
  DB "FPGA ve"
jr_002_7038:
  DB "r:"
jr_002_703a:
  DB $00
DeviceInfoSystemText::
  DB "Sys type:", $00
DeviceInfoDateText::
  DB "Asm date"
jr_002_704d:
  DB ":", $00
DeviceInfoTimeText::
  DB "Asm time:", $00
  ld a, [hl-]
  nop
DeviceInfoPowerCounterText::
  DB "Pwr cntr:", $00
  ld d, e
  ld c, [hl]
  ld a, [hl-]
  nop
  add sp, -$03
  ld hl, sp+$00
  ld [hl], $00
  ld hl, sp+$00
  ld c, [hl]

jr_002_72ed:
  ld b, $00
  sla c
  rl b
  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl

jr_002_7302:
  ld d, [hl]
  ld a, [de]
  dec hl
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a

jr_002_7309:
  ld hl, $bc02
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$01
  ld a, [hl+]
  or [hl]
  jr z, jr_002_7332

  ld hl, sp+$01
  ld a, [hl]
  ld [bc], a
  inc bc
  inc hl
  ld a, [hl]
  ld [bc], a
  ld de, $bc2a
  dec hl
  dec hl
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld hl, sp+$00
  ld a, [hl]
  add $ff
  ld [bc], a
  inc [hl]
  jp $b02b


jr_002_7332:
  ld a, $00
  ld [bc], a
  inc bc
  ld a, $00
  ld [bc], a
  add sp, $03
  ret


  add sp, -$04
  ld hl, sp+$06
  ld a, [hl]
  inc a
  ld hl, sp + $00
  ld [hl], a
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  ld hl, $bc02
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$02
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  or b
  jp z, $b0f5

  ld hl, sp+$06
  ld a, [hl]
  add $02
  ld hl, sp + $01
  ld [hl], a
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  ld hl, $bc02
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp+$02
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld de, $bc2a
  ld hl, sp + $00
  ld l, [hl]
  ld h, $00
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$02
  ld [hl+], a
  ld [hl], d
  ld de, $bc2a
  dec hl
  dec hl
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld b, a
  ld hl, sp+$02
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  push hl
  ld hl, sp + $02
  ld a, [hl]
  ld hl, sp+$08
  ld [hl], a
  pop hl
  jp $b07f


  add sp, $04
  ret


  ld hl, sp+$02
  ld a, [hl]
  inc a
  jr nz, jr_002_73c1

  ld hl, sp+$02
  ld e, [hl]
  ret


jr_002_73c1:
  ld hl, sp+$02
  ld a, [hl]
  sub $80
  jr c, jr_002_73dc

  ld a, [hl]
  add $80
  ld [hl], a
  ld b, [hl]
  inc b
  ld a, $2a
  add b
  ld c, a
  ld a, $bc
  adc $00
  ld b, a
  ld a, [bc]
  add $80
  ld e, a
  ret


jr_002_73dc:
  ld hl, sp+$02
  ld b, [hl]
  inc b
  ld a, $2a
  add b
  ld c, a
  ld a, $bc
  adc $00
  ld b, a
  ld a, [bc]
  ld e, a
  ret


  ld hl, sp+$02
  ld a, [hl]
  and $0f
  ld c, a
  ld a, [hl]
  and $f0
  ld b, a
  inc c
  ld a, $09
  sub c
  jr nc, jr_002_7402

  ld a, b
  add $10
  ld b, a
  ld c, $00

jr_002_7402:
  ld a, $90
  sub b
  jr nc, jr_002_7409

  ld b, $00

jr_002_7409:
  ld a, b
  or c
  ld e, a
  ret


  ld hl, sp+$02
  ld a, [hl]
  and $0f
  ld b, a
  ld a, [hl]
  and $f0
  ld c, a
  ld a, b
  or a
  jr nz, jr_002_7431

  ld a, c
  sub $01
  ld a, $00
  rla
  ld d, a
  or a
  jr z, jr_002_7429

  ld a, $90
  jr jr_002_742c

jr_002_7429:
  ld a, c
  add $f0

jr_002_742c:
  ld c, a
  ld b, $09
  jr jr_002_7432

jr_002_7431:
  dec b

jr_002_7432:
  ld a, c
  or b
  ld e, a
  ret
ShowRTCSetup::
; RTC setup selected by main-menu item 6.


  add sp, -$35
  ld hl, sp + $00
  ld a, l
  ld d, h
  ld hl, sp + $2b
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $02
  ld hl, sp + $2c
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, $05
  ld [bc], a
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $08
  ld [bc], a
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld a, $0c
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld c, l
  ld b, h
  ld a, $0f
  ld [bc], a
  ld hl, sp + $2c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld c, l
  ld b, h
  ld a, $12
  ld [bc], a
  ld hl, sp + $06
  ld a, l
  ld d, h
  ld hl, sp + $29
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $06
  ld hl, sp + $2a
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, $05
  ld [bc], a
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $04
  ld [bc], a
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld a, $02
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld c, l
  ld b, h
  ld a, $01
  ld [bc], a
  ld hl, sp + $2a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld c, l
  ld b, h
  xor a
  ld [bc], a
  ld hl, sp + $10
  ld [hl], $00
  ld hl, sp + $21
  ld [hl], $00
  inc hl
  ld [hl], $04
  ld hl, sp + $0f
  ld [hl], $00
  ld hl, sp + $11
  ld a, l
  ld d, h
  ld hl, sp + $2f
  ld [hl+], a
  ld [hl], d
  dec hl
  ld d, [hl]
  inc hl
  ld e, [hl]
  ld hl, sp + $0d
  ld [hl], d
  inc hl
  ld [hl], e
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0034
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $003c
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld a, $80
  push af
  inc sp
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $003e
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, $0c14
  push hl
  ld hl, $0300
  push hl
  ld hl, $0020
  push hl
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $06
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0038
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, $0200
  push hl
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0024
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, RTCSetupTitleText + OS_WINDOW_FROM_6000
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0024
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $b720
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, sp + $2f
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $23
  ld [hl+], a
  ld [hl], e
  ld hl, sp + $0f
  ld a, [hl]
  or a
  jr nz, jr_002_75d0

  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0078
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp + $24
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02

jr_002_75d0:
  ld hl, sp + $30
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $2d
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $99
  sub b
  jr nc, jr_002_75f1

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00

jr_002_75f1:
  ld hl, sp + $30
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $33
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  or a
  jr nz, @ + 8
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $12
  ld hl, sp + $30
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$27
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  or a
  jr nz, jr_002_760f

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $31

jr_002_760f:
  ld hl, sp+$34
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $13
  jr nz, jr_002_763e

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $01

jr_002_763e:
  ld hl, sp + $28
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $32
  jr nz, jr_002_764f

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $01

jr_002_764f:
  ld hl, sp + $30
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0002
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $31
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $24
  jr nz, jr_002_766e

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00

jr_002_766e:
  ld hl, sp + $30
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0001
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $25
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $60
  jr nz, @ + 8
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00
  ld hl, sp + $30
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $60
  jr nz, jr_002_768d

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00

jr_002_768d:
  ld hl, sp+$34
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $12
  sub b
  jr nc, jr_002_76b1

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $12

jr_002_76b1:
  ld hl, sp + $28
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $31
  sub b
  jr nc, jr_002_76c4

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $31

jr_002_76c4:
  ld hl, sp + $32
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $23
  sub b
  jr nc, jr_002_76d7

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $23

jr_002_76d7:
  ld hl, sp + $26
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $59
  sub b
  jr nc, jr_002_76ea

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $59

jr_002_76ea:
  ld hl, sp + $30
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $59
  sub b
  jr nc, jr_002_76fd

  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $59

jr_002_76fd:
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0038
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, $0900
  push hl
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld de, $b735
  push de
  call Bank2Function7A07 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, sp + $2e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  push af
  inc sp
  call Bank2Function7A28 + OS_WINDOW_FROM_6000
  inc sp
  ld de, $b738
  push de
  call Bank2Function7A07 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, sp + $34
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  push af
  inc sp
  call Bank2Function7A28 + OS_WINDOW_FROM_6000
  inc sp
  ld de, $b738
  push de
  call Bank2Function7A07 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, sp+$28
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  push af
  inc sp
  call Bank2Function7A28 + OS_WINDOW_FROM_6000
  inc sp
  ld de, $b73a
  push de
  call Bank2Function7A07 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, sp + $32
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  push af
  inc sp
  call Bank2Function7A28 + OS_WINDOW_FROM_6000
  inc sp
  ld de, $b73d
  push de
  call Bank2Function7A07 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, sp+$26
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  push af
  inc sp
  call Bank2Function7A28 + OS_WINDOW_FROM_6000
  inc sp
  ld de, $b73d
  push de
  call Bank2Function7A07 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, sp + $30
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  push af
  inc sp
  call Bank2Function7A28 + OS_WINDOW_FROM_6000
  inc sp
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0038
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $25
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp + $2c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $21
  ld l, [hl]
  ld h, $00
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $31
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $08
  push af
  inc sp
  push bc
  inc sp
  ld hl, sp + $27
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld de, $b73f
  push de
  call Bank2Function7A07 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0038
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $25
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp + $2c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $10
  ld l, [hl]
  ld h, $00
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $27
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $08
  push af
  inc sp
  push bc
  inc sp
  ld hl, sp + $27
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld de, $b742
  push de
  call Bank2Function7A07 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0038
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $25
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp + $32
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $0a
  push af
  inc sp
  push bc
  inc sp
  ld hl, sp + $27
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld de, $b73f
  push de
  call Bank2Function7A07 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0038
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $25
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, $0a
  push af
  inc sp
  push bc
  inc sp
  ld hl, sp + $27
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld de, $b745
  push de
  call Bank2Function7A07 + OS_WINDOW_FROM_6000
  add sp, $02
  push hl
  ld hl, sp + $12
  ld a, [hl]
  ld hl, sp + $23
  ld [hl], a
  pop hl
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0036
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp + $0f
  ld a, [hl]
  or a
  jr z, jr_002_78df

  ld hl, $001e
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld a, e
  ld hl, sp + $22
  ld [hl], a
  jr jr_002_7904

jr_002_78df:
  push hl
  ld hl, sp + $24
  ld a, [hl]
  ld hl, sp + $0e
  ld [hl], a
  pop hl
  ld hl, $0020
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld a, e
  ld hl, sp + $22
  ld [hl], a
  ld hl, sp + $0c
  ld a, [hl]
  or a
  jp nz, $b2e9

jr_002_7904:
  ld hl, sp + $22
  ld a, [hl]
  and $03
  jp z, $b679
  ld hl, sp + $0f
  ld a, [hl]
  or a
  jp z, $b713

  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $007a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp + $30
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  jp $b713
  ld hl, sp + $2a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $10
  ld l, [hl]
  ld h, $00
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $25
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $22
  ld a, [hl]
  sub $40
  jr nz, jr_002_7974
  ld hl, sp + $26
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld hl, sp + $0e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld l, b
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  push bc
  push af
  inc sp
  call $b12d
  inc sp
  ld a, e
  pop bc
  ld [bc], a
  ld hl, sp + $0f
  ld [hl], $01

jr_002_7974:
  ld hl, sp + $22
  ld a, [hl]
  sub $80
  jr nz, jr_002_799e
  ld hl, sp + $26
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld hl, sp + $0e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld l, b
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  push bc
  push af
  inc sp
  call $b14e
  inc sp
  ld a, e
  pop bc
  ld [bc], a
  ld hl, sp + $0f
  ld [hl], $01

jr_002_799e:
  ld hl, sp + $22
  ld a, [hl]
  sub $20
  jr nz, jr_002_79b9
  ld hl, sp + $10
  ld a, [hl]
  sub $01
  ld a, $00
  rla
  ld d, a
  or a
  jr z, jr_002_79b5

  ld b, $05
  jr @ + 6

jr_002_79b5:
  ld hl, sp + $10
  ld b, [hl]
  dec b
  ld hl, sp + $10
  ld [hl], b

jr_002_79b9:
  ld hl, sp+$22
  ld a, [hl]
  sub $10
  jp nz, $b2e9
  ld hl, sp + $10
  inc [hl]
  ld a, [hl]
  sub $06
  jp c, $b2e9

  ld [hl], $00
  jp $b2e9


  add sp, $35
  ret
RTCSetupTitleText::
  DB "RTC Setup", $00
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  dec l
  nop
  ld [hl-], a
  jr nc, jr_002_79f7

jr_002_79f7:
  cpl
  nop
  dec l
  dec l
  nop
  ld a, [hl-]
  nop
  jr nz, jr_002_7a20

  nop
  cpl
  ld e, h
  nop
  ld e, h
  cpl
  nop

Bank2Function7A07::
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $002a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  pop de
  pop hl
  push hl
  push de
  push hl

jr_002_7a20:
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ret

Bank2Function7A28::
  ld hl, $bc01
  dec hl
  ld c, [hl]

jr_002_7a2d:
  inc hl
  ld b, [hl]
  ld hl, $002e
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp+$02
  ld a, [hl]
  push af
  inc sp
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  inc sp
  ret

Bank2Function7A48::
  ld a, $63
  ld hl, sp+$02
  sub [hl]
  jr nc, .skip
  ld [hl], $63
.skip:
  ld a, $0a
  push af
  inc sp
  ld hl, sp+$03
  ld a, [hl]
  push af
  inc sp
  call Bank2Function7AF7 + OS_WINDOW_FROM_6000
  add sp, $02
  ld a, e
  swap a
  and $f0
  ld d, a
  push de
  ld a, $0a
  push af
  inc sp
  ld hl, sp+$05
  ld a, [hl]
  push af
  inc sp
  call Bank2Function7B05 + OS_WINDOW_FROM_6000
  add sp, $02
  ld a, e
  pop de
  or d
  ld e, a
  ret
ShowOSOptions::
; Options selected by main-menu item 0.
  add sp, -$19
  ld hl, sp + $0c
  ld [hl], $00
  ld hl, sp + $01
  ld [hl], $00
  ld hl, sp + $0f
  ld a, l
  ld d, h
  ld hl, sp + $15
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $fc
  inc hl
  ld [hl], $b9
  ld hl, sp + $16
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $00
  ld [bc], a
  inc bc
  ld a, $ba
  ld [bc], a
  ld hl, sp + $02
  ld a, l
  ld d, h
  ld hl, sp + $13
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $04
  inc hl
  ld [hl], $ba
  ld hl, sp + $14
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $12
  ld [bc], a
  inc bc
  ld a, $ba
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $20
  inc hl
  ld [hl], $ba
  ld hl, sp + $14
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $2e
  inc hl
  ld [hl], $ba
  ld hl, sp + $14
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $3c
  inc hl
  ld [hl], $ba
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $000e
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld c, e
  ld b, d
  inc bc
  inc bc
  ld hl, sp + $0d
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0064
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, $0002
  push hl
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $ba4a
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, sp + $00
  ld [hl], $00
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $17
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp + $00
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  ld hl, sp + $13
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  push bc
  ld hl, sp + $19
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $17
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp + $0e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $00
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld c, a
  ld b, $00
  sla c
  rl b
  ld hl, sp + $15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  push bc
  ld hl, sp + $19
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0066
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $ba53
  push de
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, sp + $00
  inc [hl]
  ld a, [hl]
  sub $05
  jp c, $b8b2
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0062
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp + $0c
  ld a, [hl]
  push af
  inc sp
  ld hl, $0000
  push hl
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  add sp, $03
  ld a, e
  ld hl, sp + $0c
  ld [hl], a
  ld a, [hl]
  inc a
  jp nz, $b9de
  ld hl, sp + $01
  ld a, [hl]
  or a
  jr nz, @ + 6
  ld e, a
  jp $b9f9
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0034
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0036
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $000a
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld l, b
  ld h, c
  call Bank2Function7A79 + OS_WINDOW_FROM_6000
  ld a, e
  jr @ + 29
  ld hl, sp + $01
  ld [hl], $01
  ld hl, sp + $0e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  dec hl
  dec hl
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  inc a
  ld [bc], a
  and $01
  ld [bc], a
  jp $b857
  add sp, $19
  ret
  ld l, a
  ld h, [hl]
  ld h, [hl]
  nop
  ld l, a
  ld l, [hl]
  jr nz, @ + 2
OptionsCheatsText::
  DB "Cheats     : ", $00
OptionsSwapABText::
  DB "Swap A/B   : ", $00
OptionsHideSystemText::
  DB "Hide GBCSYS: ", $00
OptionsSystemButtonText::
  DB "Sys Button : ", $00
OptionsPocketFixText::
  DB "Pocket fix : ", $00
  ld c, a
  ld [hl], b
  ld [hl], h
  ld l, c
  ld l, a
  ld l, [hl]
  ld [hl], e
  ld a, [bc]
  nop
  ld a, [bc]
  nop
MainMenuCallHL::
; Indirect-call trampoline: CALL here pushes a return address; JP HL enters the target.

Bank2Function7A79::
  jp hl

Bank2Function7A7A::
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld b, $00
  call $bb17
  ld e, c
  ld d, b
  ret

Bank2Function7A89::
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld b, $00
  jp $bb17

Bank2Function7A95::
  ld hl, $0003
  ld d, h
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld a, c
  rlca
  sbc a
  ld b, a
  call $bb1b
  ld e, c
  ld d, b
  ret

Bank2Function7AA7::
  ld hl, $0003
  ld d, h
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld a, c
  rlca
  sbc a
  ld b, a
  call $bb1b
  ret

Bank2Function7AB7::
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call Bank2Function7B37 + OS_WINDOW_FROM_6000
  ld e, c
  ld d, b
  ret

Bank2Function7AC5::
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call Bank2Function7B37 + OS_WINDOW_FROM_6000
  ret

Bank2Function7AD1::
  ld hl, $0005
  add hl, sp
  ld d, [hl]
  dec hl
  ld e, [hl]
  dec hl
  ld a, [hl]
  dec hl
  ld l, [hl]
  ld h, a
  ld b, h
  ld c, l
  call $bb1b
  ld e, c
  ld d, b
  ret

Bank2Function7AE5::
  ld hl, $0005
  add hl, sp
  ld d, [hl]
  dec hl
  ld e, [hl]
  dec hl
  ld a, [hl]
  dec hl
  ld l, [hl]
  ld h, a
  ld b, h
  ld c, l
  call $bb1b
  ret

Bank2Function7AF7::
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call $bb51
  ld e, c
  ld d, b
  ret

Bank2Function7B05::
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call $bb51
  ret

Bank2Function7B11::
  ld hl, $0005
  add hl, sp
  ld d, [hl]
  dec hl
  ld e, [hl]
  dec hl
  ld a, [hl]
  dec hl
  ld l, [hl]
  ld h, a
  ld b, h
  ld c, l
  call $bb54
  ld e, c
  ld d, b
  ret


Bank2Function7B25::
  ld hl, $0005
  add hl, sp
  ld d, [hl]
  dec hl
  ld e, [hl]
  dec hl
  ld a, [hl]
  dec hl
  ld l, [hl]
  ld h, a
  ld b, h
  ld c, l
  call $bb54
  ret

Bank2Function7B37::
  ld a, c
  rlca
  sbc a
  ld b, a
  ld a, e
  rlca
  sbc a
  ld d, a
  ld a, b
  push af
  xor d
  push af
  bit 7, d
  jr z, jr_002_7b4d

  sub a
  sub e
  ld e, a
  sbc a
  sub d
  ld d, a

jr_002_7b4d:
  bit 7, b
  jr z, jr_002_7b57

  sub a
  sub c
  ld c, a
  sbc a
  sub b
  ld b, a

jr_002_7b57:
  call $bb54
  jr c, jr_002_7b72

  pop af
  and $80
  jr z, jr_002_7b67

  sub a
  sub c
  ld c, a
  sbc a
  sub b
  ld b, a

jr_002_7b67:
  pop af
  and $80
  ret z

  sub a
  sub e
  ld e, a
  sbc a
  sub d
  ld d, a
  ret


jr_002_7b72:
  pop af
  pop af
  ret


  ld b, $00
  ld d, b
  ld a, e
  or d
  jr nz, jr_002_7b83

  ld bc, $0000
  ld d, b
  ld e, c
  scf
  ret


jr_002_7b83:
  ld l, c
  ld h, b
  ld bc, $0000
  or a
  ld a, $10

jr_002_7b8b:
  push af
  rl l
  rl h
  rl c
  rl b
  push bc
  ld a, c
  sbc e
  ld c, a
  ld a, b
  sbc d
  ld b, a
  ccf
  jr c, jr_002_7ba6

  pop bc
  pop af
  dec a
  or a
  jr nz, jr_002_7b8b

  jr jr_002_7baf

jr_002_7ba6:
  inc sp
  inc sp
  pop af
  dec a
  scf
  jr nz, jr_002_7b8b

  jr jr_002_7baf

jr_002_7baf:
  ld d, b
  ld e, c
  rl l
  ld c, l
  rl h
  ld b, h
  or a
  ret
