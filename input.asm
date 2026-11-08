SECTION "Gamepad Input", ROM0[$1fb5]

GetButtonDown::;returns buttons pressed in e
.waitForRelease:
  call GetInput
  ld a, e
  or a
  jr nz, GetButtonDown

.waitForPress:
  call GetInput
  ld a, e
  or a
  jr z, .waitForPress

  ld hl, $c2b1
  ld e, [hl]
  ret


GetInput::;returns buttons in e
  ld hl, $c2b4
  inc [hl]
  jr nz, .checkDPad

  inc hl
  inc [hl]

.checkDPad:
  ld hl, $c2b6
  ld a, [hl]
  sub $16;is DPad pressed?
  jr nc, .updateGamepad

  call WaitVBL

.updateGamepad:
  call UpdateInput
  ld hl, $c2b1
  ld [hl], e;store button state
  ld hl, SwapABFlag
  ld a, [hl]
  or a
  jr z, .checkButtons

.swapAB
  ld hl, $c2b1
  ld a, [hl]
  and PADF_A | PADF_B
  ld d, a;store A and B buttons in d
  ld a, [hl]
  and ~(PADF_A | PADF_B)
  ld [hl], a;remove A and B buttons from wGamepadState
  ld a, d;A and B buttons
  srl a;B in bit 0, toss A
  or [hl];DPad, start, and select
  ld [hl], a;store in wGamepadState
  ld a, d;A and B buttons
  and $01;toss B
  add a;put A button in bit 2
  or [hl];DPad, start, select, B
  ld [hl], a;store in wGamepadState with A and B swapped

.checkButtons:
  ld hl, $c2b1
  ld a, [hl]
  or a;is anything pressed
  jr z, .noButtonsPressed

  ld a, [hl]
  and $f0;is it just the dPad
  jr z, .noButtonsPressed

  ld hl, $c2b6
  inc [hl]
  jr jr_000_1fe9

.noButtonsPressed:
  ld hl, $c2b6
  ld [hl], $00

jr_000_1fe9:
  ld a, $18
  ld hl, $c2b6
  sub [hl]
  jr nc, .returnInput

  ld a, [hl]
  add $fa
  ld [hl], a
  ld hl, $c2b1
  ld [hl], $00

.returnInput:
  ld hl, $c2b1
  ld e, [hl]
  ret
