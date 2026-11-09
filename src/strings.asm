; String comparisons, copy, append and number formatting

SECTION "String utilities", ROM0[$2b85]
CompareBytesEqual:
  ; Stack arguments: two byte pointers, count (byte). E = 1 if equal, 0 otherwise.
  add sp, -$05
  ld hl, sp+$08
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $02
  ld [hl+], a
  ld [hl], e
  push hl
  ld hl, sp+$0d
  ld a, [hl]
  ld hl, sp + $03
  ld [hl], a
  pop hl

.nextByte:
  push hl
  ld hl, sp + $03
  ld a, [hl]
  ld hl, sp + $06
  ld [hl], a
  pop hl
  ld hl, sp + $01
  dec [hl]
  ld hl, sp + $04
  ld a, [hl]
  or a
  jr z, .equal

  ld a, [bc]
  ld [hl], a
  inc bc
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$00
  ld [hl+], a
  inc hl
  inc [hl]
  jr nz, .compareByte

  inc hl
  inc [hl]

.compareByte:
  ld hl, sp + $04
  ld a, [hl]
  ld hl, sp + $00
  sub [hl]
  jp z, .nextByte

  ld e, $00
  jr .done

.equal:
  ld e, $01

.done:
  add sp, $05
  ret


StringLength:
  ; Return an 8-bit NUL-terminated string length in E (wraps at 256).
  dec sp
  ld hl, sp+$00
  ld [hl], $00
  ld hl, sp+$04
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

.nextCharacter:
  ld a, [bc]
  inc bc
  or a
  jr z, .done

  ld hl, sp+$00
  inc [hl]
  jr .nextCharacter

.done:
  ld hl, sp+$00
  ld e, [hl]
  inc sp
  ret


StringEndsWithIgnoreCase:
  ; Match a suffix, allowing a leading dot on the suffix argument.
  add sp, -$02
  ld hl, sp+$05
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld a, [bc]
  sub $2e
  jr nz, .compareLengths

  inc bc
  dec hl
  ld [hl], c
  inc hl
  ld [hl], b

.compareLengths:
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call StringLength
  add sp, $02
  ld b, e
  push bc
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call StringLength
  add sp, $02
  pop bc
  ld c, e
  ld a, b
  sub c
  jr nc, .compareSuffix

  ld e, $00
  jr .done

.compareSuffix:
  ld hl, sp+$00
  ld [hl], b
  inc hl
  ld [hl], $00
  ld b, $00
  pop de
  push de
  ld a, e
  sub c
  ld e, a
  ld a, d
  sbc b
  ld b, a
  ld c, e
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  push bc
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call StringEqualsIgnoreCase
  add sp, $04

.done:
  add sp, $02
  ret


StringMatchesSuffixList:
  ; Test a NUL-pointer-terminated list of suffix strings; E=1 on a match.
  add sp, -$02
  ld hl, sp+$05
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

.nextSuffix:
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$00
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld a, [hl-]
  or [hl]
  jr z, .noMatch

  push bc
  ld hl, sp+$08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call StringEndsWithIgnoreCase
  add sp, $04
  ld a, e
  pop bc
  or a
  jr z, .advanceSuffix

  ld e, $01
  jr .done

.advanceSuffix:
  inc bc
  inc bc
  jp .nextSuffix

.noMatch:
  ld e, $00

.done:
  add sp, $02
  ret


StringEqualsIgnoreCase:
  ; ASCII case-insensitive equality; E=1 for equal, E=0 otherwise.
  add sp, -$04
  ld hl, sp+$06
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $02
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$08
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e
.nextCharacter:
  ld hl, sp + $03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  pop de
  push de
  ld a, [de]
  ld c, a
  ld a, b
  or a
  jr nz, .advanceFirstPointer

  ld a, c
  or a
  jr nz, .advanceFirstPointer

  ld e, $01
  jp .done

.advanceFirstPointer:
  ld hl, sp+$02
  inc [hl]
  jr nz, .advanceSecondPointer

  inc hl
  inc [hl]

.advanceSecondPointer:
  ld hl, sp+$00
  inc [hl]
  jr nz, .foldFirstCharacter

  inc hl
  inc [hl]

.foldFirstCharacter:
  ld a, b
  sub $41
  jr c, .foldSecondCharacter

  ld a, $5a
  sub b
  jr c, .foldSecondCharacter

  ld a, b
  set 5, a
  ld b, a

.foldSecondCharacter:
  ld a, c
  sub $41
  jr c, .compareCharacters

  ld a, $5a
  sub c
  jr c, .compareCharacters

  ld a, c
  set 5, a
  ld c, a

.compareCharacters:
  ld a, b
  sub c
  jp z, .nextCharacter
  ld e, $00
.done:
  add sp, $04
  ret


StringEqualsIgnoreCaseN:
  ; ASCII case-insensitive equality of at most the supplied byte count.
  ; Matching NUL terminators also end the comparison successfully.
  add sp, -$05
  ld hl, sp + $07
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $03
  ld [hl+], a
  ld [hl], e
  ld hl, sp + $09
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $01
  ld [hl+], a
  ld [hl], e
  push hl
  ld hl, sp + $0d
  ld a, [hl]
  ld hl, sp + $02
  ld [hl], a
  pop hl
.nextCharacter:
  ld hl, sp + $00
  ld b, [hl]
  dec [hl]
  ld a, b
  or a
  jp z, .equal
  ld hl, sp + $04
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  dec hl
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld c, a
  ld a, b
  or a
  jr nz, @ + 11
  ld a, c
  or a
  jr nz, @ + 7
  ld e, $01
  jp .returnResult
  ld hl, sp + $03
  inc [hl]
  jr nz, @ + 4
  inc hl
  inc [hl]
  ld hl, sp + $01
  inc [hl]
  jr nz, @ + 4
  inc hl
  inc [hl]
  ld a, b
  sub $41
  jr c, @ + 11
  ld a, $5a
  sub b
  jr c, @ + 6
  ld a, b
  set 5, a
  ld b, a
  ld a, c
  sub $41
  jr c, @ + 11
  ld a, $5a
  sub c
  jr c, @ + 6
  ld a, c
  set 5, a
  ld c, a
  ld a, b
  sub c
  jp z, .nextCharacter

  ld e, $00
  jr .returnResult

.equal:
  ld e, $01

.returnResult:
  add sp, $05
  ret


CopyString:
  ; Copy through the terminating NUL. Stack arguments: source, destination.
  add sp, -$02
  ld hl, sp+$04
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$07
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

.nextCharacter:
  pop de
  push de
  ld a, [de]
  or a
  jr z, .terminate

  ld hl, sp+$00
  inc [hl]
  jr nz, .copyCharacter

  inc hl
  inc [hl]

.copyCharacter:
  ld [bc], a
  inc bc
  jr .nextCharacter

.terminate:
  xor a
  ld [bc], a
  add sp, $02
  ret


AppendString:
  ; Find the destination terminator, then append the source including NUL.
  ; Stack arguments: destination, source.
  add sp, -$02
  ld hl, sp+$05
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

.findTerminator:
  ld a, [bc]
  or a
  jr z, .append

  inc bc
  jr .findTerminator

.append:
  ld hl, sp+$06
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e

.nextCharacter:
  pop de
  push de
  ld a, [de]
  or a
  jr z, .terminate

  ld hl, sp+$00
  inc [hl]
  jr nz, .copyCharacter

  inc hl
  inc [hl]

.copyCharacter:
  ld [bc], a
  inc bc
  jr .nextCharacter

.terminate:
  xor a
  ld [bc], a
  add sp, $02
  ret


AppendDecimal32:
  ; Append an unsigned 32-bit decimal value to the supplied string.
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
  jr nz, .storeDigitPointer

  dec bc
  ld a, $30
  ld [bc], a

.storeDigitPointer:
  ld hl, sp+$0b
  ld [hl], c
  inc hl
  ld [hl], b

.nextDigit:
  ld hl, sp+$0f
  ld a, [hl+]
  or [hl]
  inc hl
  or [hl]
  inc hl
  or [hl]
  jp z, .appendDigits

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
  jp .nextDigit

.appendDigits:
  ld hl, sp+$0b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call AppendString
  add sp, $04
  add sp, $0d
  ret


AppendHexByte:
  ; Append two hexadecimal digits and a NUL terminator.
  add sp, -$02
  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call StringLength
  add sp, $02
  ld b, e
  ld hl, sp+$06
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld l, b
  ld h, $00
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$05
  ld [hl+], a
  ld [hl], d
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  xor a
  ld [bc], a
  dec hl
  dec hl
  ld a, [hl]
  swap a
  and $0f
  ld hl, sp+$01
  ld [hl], a
  ld a, $09
  sub [hl]
  jr nc, .writeHighNibble

  ld a, [hl]
  add $07
  ld [hl], a

.writeHighNibble:
  ld hl, sp+$06
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$01
  ld a, [hl]
  add $30
  ld [bc], a
  ld hl, sp+$04
  ld a, [hl]
  and $0f
  ld hl, sp+$00
  ld [hl], a
  ld a, $09
  sub [hl]
  jr nc, .writeLowNibble

  ld a, [hl]
  add $07
  ld [hl], a

.writeLowNibble:
  inc bc
  ld hl, sp+$00
  ld a, [hl]
  add $30
  ld [bc], a
  add sp, $02
  ret


AppendHexWord:
  ; Append high byte then low byte in hexadecimal.
  ld hl, sp+$03
  ld d, [hl]
  ld e, $00
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  inc sp
  call AppendHexByte
  add sp, $03
  ld hl, sp+$02
  ld d, [hl]
  ld e, $00
  inc hl
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  inc sp
  call AppendHexByte
  add sp, $03
  ret


AppendHexDWord:
  ; Append high word then low word in hexadecimal.
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

.shiftHighWord:
  srl c
  rr b
  rr d
  rr e
  dec a
  jr nz, .shiftHighWord

  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call AppendHexWord
  add sp, $04
  ld hl, sp+$02
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld b, $00
  ld c, $00
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call AppendHexWord
  add sp, $04
  ret
