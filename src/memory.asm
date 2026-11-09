; SDCC memory copy/fill helpers

SECTION "SDCC memory copy/fill helpers", ROM0[$09ef]

CopyMemory:
  ; Stack arguments: source (word), destination (word), byte count (word).
  pop hl
  pop hl
  pop bc
  pop de
  add sp, -$08

.nextByte:
  ld a, [hl+]
  ld [bc], a
  inc bc
  dec de
  ld a, $00
  cp e
  jr nz, .nextByte

  cp d
  jr nz, .nextByte

  ret


FillMemory::
  ; Stack arguments: destination (word), fill byte, byte count (word).
  ; This is a general memset helper, not a fixed WRAM clearing routine.
  pop hl
  pop hl
  pop bc
  add sp, -$01
  pop de
  add sp, -$07
.loop:
    ld a, c
    ld [hl+], a
    dec de
    ld a, $00
    cp e
  jr nz, .loop
    cp d
  jr nz, .loop
  ret


; 16-bit additive checksum

SECTION "16-bit additive checksum", ROM0[$1269]

SumBytes16:
  ; Stack arguments: source, byte count, initial 16-bit sum. Returns sum in DE.
  ; Used by the registry checksum; additions wrap at 16 bits.
  add sp, -$04
  ld hl, sp+$06
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $00
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$09
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

.nextByte:
  ld hl, sp + $02
  ld [hl], c
  inc hl
  ld [hl], b
  dec bc
  ld a, [hl-]
  or [hl]
  jr z, .done
  pop de
  push de
  ld a, [de]
  dec hl
  dec hl
  inc [hl]
  jr nz, .addByte

  inc hl
  inc [hl]

.addByte:
  ld d, a
  ld e, $00
  ld hl, sp + $02
  ld [hl], d
  inc hl
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$0a
  ld [hl+], a
  ld [hl], d
  jp .nextByte


.done:
  ld hl, sp+$0b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  add sp, $04
  ret
