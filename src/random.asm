; Memory-mixing pseudo-random generator

SECTION "Memory-mixing pseudo-random generator", ROM0[$2300]

NextRandomWord:
  ; Mix the input timing state with words sampled from WRAM and OS memory,
  ; then xor a sequence counter. Returns the generated word in DE.
  ld hl, wInputRandomState
  inc [hl]
  jr nz, NextRandomWord.mixMemory

  inc hl
  inc [hl]

NextRandomWord.mixMemory:
  ld hl, wInputRandomState
  ld c, [hl]
  inc hl
  ld a, [hl]
  and $3f
  ld b, a
  sla c
  rl b
  ld hl, _RAM
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
  srl c
  rr b
  srl c
  rr b
  srl c
  rr b
  ld hl, wInputRandomState
  ld a, [hl]
  add b
  ld [hl+], a
  ld a, [hl]
  adc c
  ld [hl-], a
  ld c, [hl]
  inc hl
  ld a, [hl]
  and $1f
  ld b, a
  sla c
  rl b
  ld hl, $0500
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
  srl c
  rr b
  ld hl, wInputRandomState
  ld a, [hl]
  add b
  ld [hl+], a
  ld a, [hl]
  adc c
  ld [hl-], a
  ld c, [hl]
  inc hl
  ld a, [hl]
  and $3f
  ld b, a
  sla c
  rl b
  ld hl, _RAM
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
  ld hl, wInputRandomState
  ld a, [hl]
  xor b
  ld [hl+], a
  ld a, [hl]
  xor c
  ld [hl-], a
  ld a, [hl]
  ld hl, wRandomSequence
  xor [hl]
  ld hl, wInputRandomState
  ld [hl+], a
  ld a, [hl]
  ld hl, wRandomSequence+$01
  xor [hl]
  ld hl, wInputRandomState+$01
  ld [hl], a
  ld hl, wRandomSequence
  inc [hl]
  jr nz, NextRandomWord.done

  inc hl
  inc [hl]

NextRandomWord.done:
  ld hl, wInputRandomState+$01
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ret
