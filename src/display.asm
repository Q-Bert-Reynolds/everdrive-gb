; VBlank wait and background upload

SECTION "VBlank wait and background upload", ROM0[$09c1]

WaitVBL:
  ld a, $00;clear interrupt flags
  ldh [rIF], a
.waitVBL:
    ldh a, [rIF]
    and $01
  jr z, .waitVBL
  ret


DrawToScreen0:; copies the WRAM shadow screen to _SCRN0
  ld bc, _SCRN0
  ld hl, wMenuScreenBuffer
  ld d, 20;screen width in tiles

.copyLoop:
    ldh a, [rSTAT]
    and STATF_BUSY
  jr nz, .copyLoop

    ld a, [hl+]
    ld [bc], a
    inc c
    dec d
  jr nz, .copyLoop

    ld d, 20
    ld a, c
    add $0c
    ld c, a
  jr nz, .copyLoop

    inc b
    ld a, b
    cp $9b
  jr nz, .copyLoop
  ret



; Display initialization (continues in colors.asm)

SECTION "Display initialization (continues in colors.asm)", ROM0[$1e30]

InitializeMenuDisplayState:
  add sp, -$0f

InitializeMenuDisplayState.initializeVRAMPointers:
  ld hl, sp + $0d
  ld [hl], $00
  inc hl
  ld [hl], $82
  ld hl, sp + $0b
  ld [hl], $00
  inc hl
  ld [hl], $8a
  ld hl, rLCDC
  ld [hl], $00

InitializeMenuDisplayState.initializeTextMode:
  ld hl, wMenuTextMode
  ld [hl], $00
  ld hl, wDisplaySystemType

InitializeMenuDisplayState.detectCGB:
  ld [hl], $01
  ld hl, rVBK
  ld [hl], $00
  ld de, rVBK
  ld a, [de]
  rrca
  jr c, InitializeMenuDisplayState.configureAudio

  ld hl, rVBK
  ld [hl], $01
  ld de, rVBK
  ld a, [de]
  and $01
  dec a
  jr nz, InitializeMenuDisplayState.selectVRAMBankZero

  ld hl, wDisplaySystemType
  ld [hl], $03

InitializeMenuDisplayState.selectVRAMBankZero:
  ld hl, rVBK
  ld [hl], $00

InitializeMenuDisplayState.configureAudio:
  ld hl, sp+$11
  ld a, [hl]
  or a
  jr z, InitializeMenuDisplayState.muteAudio

  ld hl, rAUDENA
  ld [hl], $00;disable audio
  jr InitializeMenuDisplayState.configureLCD

InitializeMenuDisplayState.muteAudio:
  ld hl, rAUDTERM
  ld [hl], $00;no sound output

InitializeMenuDisplayState.configureLCD:
  ld hl, rSTAT
  ld [hl], $00
  ld l, (rSCY & $FF)
  ld [hl], $00
  ld l, (rSCX & $FF)
  ld [hl], $00
  ld l, (rBGP & $FF)
  ld [hl], $dc
  ld l, (rOBP0 & $FF)
  ld [hl], $00
  ld l, (rOBP1 & $FF)
  ld [hl], $00
  ld l, (rWY & $FF)
  ld [hl], $00
  ld l, (rWX & $FF)
  ld [hl], $00
  ld hl, wDisplaySystemType
  ld a, [hl]
  sub $03
  jp nz, InitializeMenuDisplayState.loadFont

  ld hl, rVBK
  ld [hl], $01
  ld hl, $2000
  push hl
  xor a
  push af
  inc sp
  ld h, $80
  push hl
  call FillMemory
  add sp, $05
  ld hl, rVBK
  ld [hl], $00
  ld l, $68
  ld [hl], $80
  ld hl, sp+$02
  ld [hl], $00
  inc hl
  ld [hl], $00



; The palette/font portion continues from the first initialization fragment.
SECTION "Display initialization continuation", ROM0[$1ed3]

InitializeMenuDisplayState.loadNextPaletteColor::
  ld hl, sp+$02
  ld a, [hl]
  and $03
  ld c, a
  ld b, $00
  sla c
  rl b
  ld hl, UIColors
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $09
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  ld d, [hl]
  ld e, $00
  ld a, d
  ld de, rBCPD
  ld [de], a
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld d, $00
  ld hl, rBCPD
  ld [hl], c
  ld hl, sp+$02
  inc [hl]
  jr nz, InitializeMenuDisplayState.checkPaletteCount

  inc hl
  inc [hl]

InitializeMenuDisplayState.checkPaletteCount:
  ld hl, sp+$02
  ld a, [hl]
  sub $20
  inc hl
  ld a, [hl]
  sbc $00
  jp c, InitializeMenuDisplayState.loadNextPaletteColor

InitializeMenuDisplayState.loadFont:
  ld hl, sp+$00
  ld [hl], $00
  inc hl
  ld [hl], $7d
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00

InitializeMenuDisplayState.nextFontByte:
  pop de
  push de
  ld a, [de]
  ld b, a
  ld hl, sp + $0d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp + $0e
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  xor a
  ld [bc], a
  inc bc
  dec hl
  ld [hl], c
  inc hl
  ld [hl], b
  pop de
  push de
  ld a, [de]
  ld b, a
  ld hl, sp+$00
  inc [hl]
  jr nz, InitializeMenuDisplayState.writeInvertedFontByte

  inc hl
  inc [hl]

InitializeMenuDisplayState.writeInvertedFontByte:
  ld hl, sp+$0b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp+$0c
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, $ff
  ld [bc], a
  inc bc
  dec hl
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$02
  inc [hl]
  jr nz, InitializeMenuDisplayState.checkFontCount

  inc hl
  inc [hl]

InitializeMenuDisplayState.checkFontCount:
  ld hl, sp+$02
  ld a, [hl]
  sub $00
  inc hl
  ld a, [hl]
  sbc $03
  jp c, InitializeMenuDisplayState.nextFontByte

  call ClearShadowScreen
  call Bank1Function6AF2
  call DrawToScreen0
  ld hl, rLCDC
  ld [hl], $91
  ld hl, wDisplaySystemType
  ld a, [hl]
  dec a
  jr nz, InitializeMenuDisplayState.done

  ld hl, sp+$04
  ld e, l
  ld d, h
  ld a, $03
  ld [de], a
  ld hl, sp+$04
  ld e, l
  ld d, h
  push de
  ld a, $06
  push af
  inc sp
  call OS_CallFarSRAM
  add sp, $03
  ld a, e
  or a
  jr z, InitializeMenuDisplayState.done

  ld hl, wDisplaySystemType
  ld [hl], $02

InitializeMenuDisplayState.done:
  add sp, $0f
  ret

;Colors are 15 bit.
;Values range from 0 to 31.

SECTION "Display system type", ROM0[$1fb0]

GetDisplaySystemType:
  ld hl, wDisplaySystemType
  ld e, [hl]
  ret
