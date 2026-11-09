; Resident menu dialogs. CPU addresses $4000-$7fff remain fixed in OS mode.
SECTION "Resident menu dialogs", ROMX[$67f9], BANK[1]

ShowMenuDialog:
  ; $67f9. Stack arguments: descriptor pointer (word), initial selection (byte).
  ; Descriptor: title pointer, entry pointers, then a flags word <= $000f.
  ; Measures the strings, draws a frame, highlights the selected entry and
  ; polls GetButtonDown. E = zero-based selection, or $ff for B/cancel.
  ; Flags: bit 0 = message, bit 1 = left aligned, bit 2 = compact rows,
  ; bit 3 = return on other input (selection + $80).
  add sp, -$13
  ld hl, sp+$12
  ld [hl], $00
  ld hl, sp + $01
  ld [hl], $02
  ld hl, sp+$16
  ld a, [hl-]
  or [hl]
  jr nz, .scanDescriptor

  ld [hl], $ab
  inc hl
  ld [hl], $d7

.scanDescriptor:
  ld hl, sp + $06
  ld [hl], $00

.nextString:
  ld hl, sp + $06
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  ld hl, sp+$15
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
  ld hl, sp + $0e
  ld [hl], c
  inc hl
  ld [hl], b
  dec hl
  ld a, $0f
  sub [hl]
  inc hl
  ld a, $00
  sbc [hl]
  jr nc, .readFlags

  push bc
  call StringLength
  add sp, $02
  ld c, e
  ld hl, sp+$12
  ld a, [hl]
  sub c
  jr nc, .advanceString

  ld [hl], c

.advanceString:
  ld hl, sp + $06
  inc [hl]
  jp .nextString


.readFlags:
  ; The first word <= $000f terminates the pointer list; it is not a NULL
  ; string. Subtract one from the string count to exclude the title.
  ld hl, sp + $06
  ld c, [hl]
  ld a, [hl]
  add $ff
  dec hl
  ld [hl], a
  ld hl, sp+$12
  ld a, [hl]
  add $02
  ld hl, sp+$04
  ld [hl], a
  ld a, $14
  sub [hl]
  jr nc, .readLayout

  ld [hl], $14

.readLayout:
  ld b, $00
  sla c
  rl b
  ld hl, sp+$15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
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
  bit 2, b
  jr z, .computeHeight

  ld hl, sp + $01
  ld [hl], $01

.computeHeight:
  ld hl, sp + $01
  ld a, [hl]
  dec a
  jr nz, .doubleSpacedHeight
  ld hl, sp + $05
  ld a, [hl]
  inc a
  jr .drawFrame

.doubleSpacedHeight:
  ld hl, sp + $05
  ld a, [hl]
  add a

.drawFrame:
  ld hl, sp + $02
  ld [hl], a
  ld hl, sp+$15
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $0e
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp + $0c
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  push bc
  ld hl, sp + $04
  ld a, [hl]
  push af
  inc sp
  inc hl
  inc hl
  ld a, [hl]
  push af
  inc sp
  ld hl, sp + $10
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call DrawMenuDialogFrame
  add sp, $04
  pop bc
  push bc
  push de
  call GetSelectedMenuEntry
  ld a, e
  pop de
  pop bc
  ld hl, sp + $00
  ld [hl], a
  ld hl, wMenuRowOverride
  ld [hl], $ff
  ld a, e
  inc a
  ld hl, sp + $0c
  ld [hl], a
  ld a, b
  and $01
  ld hl, sp + $07
  ld [hl+], a
  ld [hl], $00
  ld hl, sp + $01
  ld a, [hl]
  sub $02
  jr nz, .singleSpaced

  ld a, $01
  jr .storeSpacing

.singleSpaced:
  xor a

.storeSpacing:
  ld hl, sp+$12
  ld [hl], a
  ld hl, sp + $05
  ld a, [hl]
  add $ff
  ld hl, sp+$09
  ld [hl], a
  ld a, b
  and $08
  ld hl, sp + $10
  ld [hl+], a
  ld [hl], $00
  ld a, b
  and $02
  ld hl, sp+$0a
  ld [hl+], a
  ld [hl], $00

.redraw:
  ld hl, sp+$0b
  ld a, [hl-]
  or [hl]
  jr nz, .positionLeftAligned

  ld hl, sp + $00
  ld a, [hl]
  push af
  inc sp
  xor a
  push af
  inc sp
  call SetMenuCursorAddress
  add sp, $02
  jr .beginEntries

.positionLeftAligned:
  ld hl, sp + $00
  ld a, [hl]
  push af
  inc sp
  ld hl, sp + $0d
  ld a, [hl]
  push af
  inc sp
  call SetMenuCursorAddress
  add sp, $02

.beginEntries:
  ld hl, sp + $06
  ld [hl], $00

.nextEntry:
  ld hl, sp + $06
  ld a, [hl-]
  sub [hl]
  jp nc, .present

  ld hl, sp+$17
  ld a, [hl]
  ld hl, sp + $06
  sub [hl]
  jr nz, .unselectedEntry
  ld hl, sp + $08
  ld a, [hl-]
  or [hl]
  jr nz, .unselectedEntry

  xor a
  push af
  inc sp
  call SetMenuTextMode
  inc sp
  jr .renderEntry

.unselectedEntry:
  ld a, $80
  push af
  inc sp
  call SetMenuTextMode
  inc sp

.renderEntry:
  ld hl, sp + $06
  ld c, [hl]
  ld b, $00
  inc bc
  sla c
  rl b
  ld hl, sp + $0e
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
  ld hl, sp+$0b
  ld a, [hl-]
  or [hl]
  jr nz, .renderLeftAligned

  push bc
  call RenderMenuLabel
  add sp, $02
  jr .advanceRow

.renderLeftAligned:
  push bc
  call LoadOSInitText
  add sp, $02

.advanceRow:
  ld hl, sp+$12
  ld a, [hl]
  or a
  jr z, .advanceEntry

  ld a, $01
  push af
  inc sp
  call SetMenuCursor
  inc sp

.advanceEntry:
  ld hl, sp + $06
  inc [hl]
  jp .nextEntry


.present:
  call DrawToScreen0
  call GetButtonDown
  ld hl, sp + $03
  ld [hl], e
  ld hl, sp + $08
  ld a, [hl-]
  or [hl]
  jr z, .handleUp

  ; Message flag: dismiss on any button, retaining the initial selection.
  ld hl, sp+$17
  ld e, [hl]
  jp .done


.handleUp:
  ld hl, sp + $03
  bit PADB_UP, [hl]
  jr z, .handleDown

  ld hl, sp+$17
  ld a, [hl]
  sub $01
  ld a, $00
  rla
  ld d, a
  or a
  jr z, .moveUp

  ld hl, sp+$09
  ld b, [hl]
  jr .storeUpSelection

.moveUp:
  ld hl, sp+$17
  ld b, [hl]
  dec b

.storeUpSelection:
  ld hl, sp+$17
  ld [hl], b

.handleDown:
  ld hl, sp + $03
  bit PADB_DOWN, [hl]
  jr z, .handleConfirm
  ld hl, sp + $05
  ld c, [hl]
  ld b, $00
  dec bc
  ld hl, sp+$17
  ld d, [hl]
  ld e, $00
  ld a, c
  sub d
  jr nz, .moveDown

  ld a, b
  sub e
  jr z, .storeDownSelection

.moveDown:
  ld hl, sp+$17
  ld a, [hl]
  inc a

.storeDownSelection:
  ld hl, sp+$17
  ld [hl], a

.handleConfirm:
  ld hl, sp + $03
  bit PADB_A, [hl]
  jr z, .handleCancel

  ld hl, sp+$17
  ld e, [hl]
  jr .returnResult

.handleCancel:
  ld hl, sp + $03
  bit PADB_B, [hl]
  jr z, .checkReturnOnOtherInput

  ld e, MENU_ACTION_CANCEL
  jr .returnResult

.checkReturnOnOtherInput:
  ld hl, sp + $11
  ld a, [hl-]
  or [hl]
  jp z, .redraw

  ld hl, sp+$17
  ld a, [hl]
  add $80
  ld e, a

.done:
.returnResult:
  add sp, $13
  ret


DrawMenuDialogFrame:
  ; Centers the dialog horizontally. wMenuRowOverride=$ff centers vertically;
  ; otherwise the byte supplies the top row. Draws the title and border.
  add sp, -$03
  ld hl, sp+$07
  ld c, [hl]
  ld b, $00
  ld a, $14
  sub c
  ld c, a
  ld a, $00
  sbc b
  ld b, a
  ld hl, sp+$01
  ld [hl], c
  inc hl
  ld [hl], b
  ld a, $00
  ld e, a
  ld a, b
  ld d, a
  bit 7, b
  jr z, .halveHorizontalMargin

  inc bc
  dec hl
  ld [hl], c
  inc hl
  ld [hl], b

.halveHorizontalMargin:
  ld hl, sp+$01
  ld d, [hl]
  inc hl
  ld e, [hl]
  sra e
  rr d
  dec hl
  dec hl
  ld [hl], d
  ld hl, sp+$08
  ld c, [hl]
  ld b, $00
  inc bc
  inc bc
  ld a, $12
  sub c
  ld c, a
  ld a, $00
  sbc b
  ld b, a
  ld hl, sp+$01
  ld [hl], c
  inc hl
  ld [hl], b
  ld a, $00
  ld e, a
  ld a, b
  ld d, a
  bit 7, b
  jr z, .halveVerticalMargin

  inc bc
  dec hl
  ld [hl], c
  inc hl
  ld [hl], b

.halveVerticalMargin:
  ld hl, sp+$01
  ld c, [hl]
  inc hl
  ld d, [hl]
  sra d
  rr c
  ld hl, wMenuRowOverride
  ld a, [hl]
  inc a
  jr z, .drawBorder

  ld hl, wMenuRowOverride
  ld c, [hl]

.drawBorder:
  push bc
  ld a, $80
  push af
  inc sp
  call SetMenuTextMode
  inc sp
  pop bc
  push bc
  ld a, $01
  push af
  inc sp
  ld hl, sp+$0a
  ld a, [hl]
  push af
  inc sp
  ld a, c
  push af
  inc sp
  ld hl, sp+$05
  ld a, [hl]
  push af
  inc sp
  ld hl, $0020
  push hl
  call FillMenuRectangle
  add sp, $06
  pop bc
  ld b, c
  dec b
  push bc
  push bc
  inc sp
  xor a
  push af
  inc sp
  call SetMenuCursorAddress
  add sp, $02
  pop bc
  push bc
  ld hl, sp+$07
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call RenderMenuLabel
  add sp, $02
  pop bc
  ld b, c
  inc b
  push bc
  ld a, $01
  push af
  inc sp
  ld hl, sp+$0a
  ld a, [hl]
  push af
  inc sp
  push bc
  inc sp
  ld hl, sp+$05
  ld a, [hl]
  push af
  inc sp
  ld hl, $002d
  push hl
  call FillMenuRectangle
  add sp, $06
  pop bc
  ld d, c
  inc d
  inc d
  push bc
  ld hl, sp+$0a
  ld a, [hl]
  push af
  inc sp
  dec hl
  ld a, [hl]
  push af
  inc sp
  push de
  inc sp
  ld hl, sp+$05
  ld a, [hl]
  push af
  inc sp
  ld hl, $0020
  push hl
  call FillMenuRectangle
  add sp, $06
  pop bc
  push bc
  inc sp
  ld hl, sp+$01
  ld a, [hl]
  push af
  inc sp
  call SetMenuCursorAddress
  add sp, $02
  ld hl, sp+$00
  ld e, [hl]
  add sp, $03
  ret
SetDialogRow::

  push hl
  ld hl, sp+$04
  ld a, [hl]
  ld hl, wMenuRowOverride
  ld [hl], a
  pop hl
  ret
