; Shadow screen text and rectangle rendering

SECTION "Text Loading", ROM0[$202c]
LoadText:
  add sp, -$02
  ld hl, sp+$05
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

.loadTextLoop:
    ld a, [bc]
    ld d, a
    or a
  jr z, .done

    push hl
  ld hl, wMenuTextPointer
    ld a, [hl]
    ld hl, sp+$02
    ld [hl], a
    pop hl
    push hl
  ld hl, wMenuTextPointer+1
    ld a, [hl]
    ld hl, sp+$03
    ld [hl], a
    pop hl
    ld a, d
    inc bc
  ld hl, wMenuTextMode
    or [hl]
    pop de
    push de
    ld [de], a
  ld hl, wMenuTextPointer
    inc [hl]
  jr nz, .loadTextLoop

    inc hl
    inc [hl]
  jr .loadTextLoop

.done:
  add sp, $02
  ret


RenderHexByte:
  ; Render two hexadecimal digits into the current shadow-screen text pointer.
  ld hl, sp+$02
  ld a, [hl]
  swap a
  and $0f
  and $0f
  add $30
  ld b, a
  ld a, $39
  sub b
  jr nc, RenderHexByte.writeHighNibble

  ld a, b
  add $07
  ld b, a

RenderHexByte.writeHighNibble:
  ld hl, wMenuTextPointer+1
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, b
  ld hl, wMenuTextMode
  or [hl]
  ld [de], a
  ld hl, wMenuTextPointer
  inc [hl]
  jr nz, RenderHexByte.formatLowNibble

  inc hl
  inc [hl]

RenderHexByte.formatLowNibble:
  ld hl, sp+$02
  ld a, [hl]
  and $0f
  add $30
  ld b, a
  ld a, $39
  sub b
  jr nc, RenderHexByte.writeLowNibble

  ld a, b
  add $07
  ld b, a

RenderHexByte.writeLowNibble:
  ld hl, wMenuTextPointer+1
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, b
  ld hl, wMenuTextMode
  or [hl]
  ld [de], a
  ld hl, wMenuTextPointer
  inc [hl]
  ret nz

  inc hl
  inc [hl]
  ret


RenderHexWord:
  ; Render the high byte then low byte as hexadecimal text.
  ld hl, sp+$03
  ld d, [hl]
  ld e, $00
  push de
  inc sp
  call RenderHexByte
  inc sp
  ld hl, sp+$02
  ld d, [hl]
  push de
  inc sp
  call RenderHexByte
  inc sp
  ret


RenderHexDWord:
  ; Render a 32-bit value as two hexadecimal words.
  push af
  ld hl, sp+$04
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld c, [hl]
  pop af
  ld a, $10

RenderHexDWord.shiftHighWord:
  srl c
  rr b
  rr d
  rr e
  dec a
  jr nz, RenderHexDWord.shiftHighWord

  push de
  call RenderHexWord
  add sp, $02
  pop bc
  pop de
  push de
  push bc
  push de
  call RenderHexWord
  add sp, $02
  ret


RenderDecimal32:
  ; Convert an unsigned 32-bit value to decimal on the stack, then render it.
  add sp, -$0d
  ld hl, sp+$0a
  ld c, l
  ld b, h
  xor a
  ld [bc], a
  ld hl, sp+$12
  ld a, [hl-]
  or [hl]
  dec hl
  or [hl]
  dec hl
  or [hl]
  jr nz, RenderDecimal32.storeDigitPointer

  dec bc
  ld a, $30
  ld [bc], a

RenderDecimal32.storeDigitPointer:
  ld hl, sp+$0b
  ld [hl], c
  inc hl
  ld [hl], b

RenderDecimal32.nextDigit:
  ld hl, sp+$0f
  ld a, [hl+]
  or [hl]
  inc hl
  or [hl]
  inc hl
  or [hl]
  jp z, RenderDecimal32.renderDigits

  ld hl, sp+$0c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  dec de
  dec hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, $0000
  push hl
  ld hl, $000a
  push hl
  ld hl, sp+$15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6C4D
  add sp, $08
  ld b, l
  ld c, h
  ld a, e
  add $30
  ld b, a
  ld hl, sp+$0b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, $0000
  push hl
  ld hl, $000a
  push hl
  ld hl, sp+$15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6C53
  add sp, $08
  ld b, l
  ld c, h
  ld hl, sp+$0f
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  jp RenderDecimal32.nextDigit


RenderDecimal32.renderDigits:
  ld hl, sp+$0b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call LoadText
  add sp, $02
  add sp, $0d
  ret


ClearShadowScreen:
  ld hl, wMenuCursorOffset
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld de, wMenuScreenBuffer
  ld hl, wMenuTextPointer
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, $0168
  push hl
  ld a, $20
  push af
  inc sp
  push de
  call FillMemory
  add sp, $05
  ret


LoadOSInitText:
  ld hl, wMenuCursorOffset
  ld a, [hl]
  add $14
  ld [hl+], a
  ld a, [hl]
  adc $00
  ld [hl], a
  ld a, $45
  dec hl
  add [hl]
  ld b, a
  ld a, $c1
  inc hl
  adc [hl]
  ld c, a
  ld hl, wMenuTextPointer
  ld [hl], b
  inc hl
  ld [hl], c
  pop bc
  pop hl
  push hl
  push bc
  push hl
  call LoadText
  add sp, $02
  ret


RenderMenuLabel:
  ld hl, wMenuCursorOffset
  ld a, [hl]
  add $14
  ld [hl+], a
  ld a, [hl]
  adc $00
  ld [hl], a
  ld a, $45
  dec hl
  add [hl]
  ld b, a
  ld a, $c1
  inc hl
  adc [hl]
  ld c, a
  ld hl, wMenuTextPointer
  ld [hl], b
  inc hl
  ld [hl], c
  pop bc
  pop hl
  push hl
  push bc
  push hl
  call StringLength
  add sp, $02
  ld c, e
  ld a, $12
  sub c
  jr c, RenderMenuLabel.renderText

  ld b, $00
  ld a, $14
  sub c
  ld c, a
  ld a, $00
  sbc b
  ld b, a
  sra b
  rr c
  ld hl, wMenuTextPointer
  ld a, [hl]
  add c
  ld [hl+], a
  ld a, [hl]
  adc b
  ld [hl], a

RenderMenuLabel.renderText:
  pop bc
  pop hl
  push hl
  push bc
  push hl
  call LoadText
  add sp, $02
  ret


SetMenuCursor:
  ld hl, sp+$02
  ld b, [hl]

SetMenuCursor.nextRow:
  ld c, b
  dec b
  ld a, c
  or a
  jr z, SetMenuCursor.setTextPointer

  ld hl, wMenuCursorOffset
  ld a, [hl]
  add $14
  ld [hl+], a
  ld a, [hl]
  adc $00
  ld [hl], a
  jr SetMenuCursor.nextRow

SetMenuCursor.setTextPointer:
  ld a, $45
  ld hl, wMenuCursorOffset
  add [hl]
  ld b, a
  ld a, $c1
  inc hl
  adc [hl]
  ld c, a
  ld hl, wMenuTextPointer
  ld [hl], b
  inc hl
  ld [hl], c
  ret


SetMenuCursorAddress:
  add sp, -$02
  ld hl, sp+$04
  ld a, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], $00
  ld hl, sp+$05
  ld c, [hl]
  ld b, $00
  ld l, c
  ld h, b
  add hl, hl
  add hl, hl
  add hl, bc
  add hl, hl
  add hl, hl
  ld c, l
  ld b, h
  pop hl
  push hl
  add hl, bc
  ld a, l
  ld d, h
  ld hl, wMenuCursorOffset
  ld [hl+], a
  ld [hl], d
  ld a, $45
  dec hl
  add [hl]
  ld b, a
  ld a, $c1
  inc hl
  adc [hl]
  ld c, a
  ld hl, wMenuTextPointer
  ld [hl], b
  inc hl
  ld [hl], c
  add sp, $02
  ret


GetSelectedMenuEntry:
  ld hl, $0014
  push hl
  ld hl, wMenuCursorOffset
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6D53
  add sp, $04
  ret


RenderTextAtPosition:
  ; Arguments: string pointer, x, y. Set the cursor then render the string.
  ld hl, sp+$05
  ld a, [hl]
  push af
  inc sp
  dec hl
  ld a, [hl]
  push af
  inc sp
  call SetMenuCursorAddress
  add sp, $02
  pop bc
  pop hl
  push hl
  push bc
  push hl
  call LoadText
  add sp, $02
  ret


SetMenuTextMode:
  push hl
  ld hl, sp+$04
  ld a, [hl]
  ld hl, wMenuTextMode
  ld [hl], a
  pop hl
  ret


FillMenuRectangle:
  ; Arguments: tile word, x, y, width, height. Fill shadow-screen rows using
  ; FillMemory, advancing the cursor by 20 tiles after each row.
  add sp, -$04
  ld hl, sp+$09
  ld a, [hl]
  push af
  inc sp
  dec hl
  ld a, [hl]
  push af
  inc sp
  call SetMenuCursorAddress
  add sp, $02
  ld hl, sp+$0b
  ld c, [hl]

FillMenuRectangle.nextRow:
  ld b, c
  dec c
  ld a, b
  or a
  jp z, FillMenuRectangle.done

  ld hl, sp+$0a
  ld a, [hl]
  ld hl, sp + $02
  ld [hl+], a
  ld [hl], $00
  ld hl, wMenuTextMode
  ld e, [hl]
  ld d, $00
  ld hl, sp+$06
  ld a, [hl]
  or e
  ld b, a
  inc hl
  ld a, [hl]
  or d
  ld d, a
  ld de, wMenuScreenBuffer
  ld hl, wMenuCursorOffset
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, de
  inc sp
  inc sp
  push hl
  pop de
  push de
  push bc
  ld hl, sp + $04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  inc sp
  push de
  call FillMemory
  add sp, $05
  pop bc
  ld hl, wMenuCursorOffset
  ld a, [hl]
  add $14
  ld [hl+], a
  ld a, [hl]
  adc $00
  ld [hl], a
  jp FillMenuRectangle.nextRow


FillMenuRectangle.done:
  add sp, $04
  ret
