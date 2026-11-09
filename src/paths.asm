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
  ; Stack arguments: directory, name, extension, destination (four pointers).
  ; Join the path, then replace its extension. Exactly 11 name bytes select the
  ; raw FAT 8+3 form: replace the last three bytes, without inserting a dot.
  ; Other lengths select dotted names; see notes/PATHS.md for edge cases.
  ;
  ; Nine-byte stack frame (offsets below apply with no temporary pushes):
  ; +0    saw a dot anywhere in the joined path
  ; +1..2 original extension pointer
  ; +3..4 destination pointer
  ; +5..6 extension read cursor / destination cut position
  ; +7..8 saved destination pointer
  ; Arguments are then at +$0b, +$0d, +$0f, +$11.
  ; Execution falls through the fixed ROM boundary into bank 1 at $4000.
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
  sub $0b ; raw FAT short names occupy eight base bytes plus three extension bytes
  jp nz, BuildPathReplaceDottedExtension
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
  sub '.'
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
  add $fd ; subtract three from the joined path length (16-bit BC)
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
  ; Falls through to BuildPathWriteShortExtension in the fixed upper ROM region

SECTION "Path extension continuation", ROMX[$4000], BANK[1]
; Same routine and stack frame as BuildPathWithExtension, across $3fff/$4000.
BuildPathWriteShortExtension::
  ld [hl+], a
  ld [hl], e

.nextExtensionCharacter:
  ld hl, sp+$06
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  or a
  jr z, .terminateShortName

  dec hl
  inc [hl]
  jr nz, .writeUppercaseCharacter

  inc hl
  inc [hl]

.writeUppercaseCharacter:
  and $df ; clear bit 5 unconditionally; intended for alphabetic extensions
  ld [bc], a
  inc bc
  jr .nextExtensionCharacter

.terminateShortName:
  xor a
  ld [bc], a
  jp BuildPathExtensionReturn

BuildPathReplaceDottedExtension::
  ld hl, sp+$04
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

.scanPathForDot:
  ld a, [bc]
  or a
  jr z, .storePathEnd

  sub '.'
  jr nz, .advancePathCursor

  ld hl, sp+$00
  ld [hl], $01

.advancePathCursor:
  inc bc
  jr .scanPathForDot

.storePathEnd:
  ld hl, sp+$05
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$00
  ld a, [hl]
  or a
  jr z, .checkExtensionPrefix

.findLastDot:
  ld a, [bc]
  sub '.'
  jr z, .storeLastDot

  dec bc
  jr .findLastDot

.storeLastDot:
  ld hl, sp+$05
  ld [hl], c
  inc hl
  ld [hl], b

.checkExtensionPrefix:
  ld hl, sp+$02
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub '.'
  jr z, .truncateOldExtension

  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], '.'
  ld hl, sp+$05
  inc [hl]
  jr nz, .truncateOldExtension

  inc hl
  inc [hl]

.truncateOldExtension:
  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00
  ld hl, sp+$01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$09 ; saved destination at +7, adjusted for the push
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call AppendString
  add sp, $04

BuildPathExtensionReturn::
  add sp, $09
  ret
