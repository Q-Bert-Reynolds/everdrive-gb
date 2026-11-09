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
  ld hl, wInputRandomState
  inc [hl]
  jr nz, .checkDPad

  inc hl
  inc [hl]

.checkDPad:
  ld hl, wInputRepeatCounter
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

  ld hl, wInputRepeatCounter
  inc [hl]
  jr GetInput.checkRepeatLimit

.noButtonsPressed:
  ld hl, wInputRepeatCounter
  ld [hl], $00

GetInput.checkRepeatLimit:
  ld a, $18
  ld hl, wInputRepeatCounter
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

; Writable A/B swap flag

SECTION "Writable A/B swap flag", ROM0[$09c0]

SwapABFlag:: DB 0;nonzero swaps the A and B buttons, see GetInput


; Raw joypad sampling

SECTION "Raw joypad sampling", ROM0[$0a16]

UpdateInput::;puts button state in e
  ld a, P1F_GET_DPAD
  ldh [rP1], a
REPT 4;multiple reads to avoid button bounce
  ldh a, [rP1];load dPad
ENDR
  and $0f
  ld e, a
  ld a, P1F_GET_BTN
  ldh [rP1], a
REPT 4
  sla e
ENDR
REPT 4
  ldh a, [rP1];load buttons
ENDR
  and $0f
  or e
  cpl
  ld e, a
  ld a, P1F_GET_NONE
  ldh [rP1], a
  ret
