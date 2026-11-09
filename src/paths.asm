; Path and extension construction

SECTION "Path and extension construction", ROM0[$3f36]

JoinPath:
  ; Arguments: destination, directory, name. Append a slash unless the directory
  ; has length one (root), then append the name.
  pop de
  pop bc
  push bc
  push de
  xor a
  ld [bc], a
  push bc
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  call AppendString
  add sp, $04
  pop bc
  push bc
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call StringLength
  add sp, $02
  pop bc
  dec e
  jr z, .appendName

  ld de, PathSeparatorText
  push bc
  push de
  push bc
  call AppendString
  add sp, $04
  pop bc

.appendName:
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  call AppendString
  add sp, $04
  ret


PathSeparatorText:: DB "/", 0

BuildPathWithExtension:
  ; Construct a path with the supplied extension. This routine continues past
  ; $3fff into the encoded bank 1 fragment; the conditional $401d target is
  ; explicitly labeled there rather than borrowing a bank 3 disassembly label.
  add sp, -$09
  ld hl, sp+$00
  ld [hl], $00
  ld hl, sp+$11
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $03
  ld [hl+], a
  ld [hl], e
  dec hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $07
  ld [hl+], a
  ld [hl], e
  ld hl, sp + $03
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00
  ld hl, sp+$0d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call StringLength
  add sp, $02
  ld b, e
  push bc
  ld hl, sp+$0f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$0f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call JoinPath
  add sp, $06
  pop bc
  ld hl, sp+$0f
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], e
  ld a, b
  sub $0b
  jp nz, BuildPathKeepOriginalName
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call StringLength
  add sp, $02
  ld c, e
  ld hl, sp+$02
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $2e
  jr nz, .locateExtension

  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0001
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$0f
  ld [hl+], a
  ld [hl], d

.locateExtension:
  ld b, $00
  ld a, c
  add $fd
  ld c, a
  ld a, b
  adc $ff
  ld b, a
  ld hl, sp + $03
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$0f
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $05
  ; Falls through to BuildPathWithExtensionContinuation in bank_001.asm.
