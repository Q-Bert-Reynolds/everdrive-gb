;KBHandleCharacter
;KBHandleArrowKey
;KBHandleTab
;KBHandleEnter
;KBHandleBackspace
;KBHandleDelete
;KBHandleFunctionKey
;KBHandleEscape

KBHandleCharacter::;a = character in ASCII
  ld b, a
  ld a, [kb_mode]
  cp a, KB_MODE_TYPING
  ret nz

  ret

KBHandleArrowKey::;a = DPad key
  ld b, a
  ld a, [wGamepadState]
  or a, b
  ld [wGamepadState], a
  ret

KBHandleTab::
  ld b, a
  ld a, [kb_mode]
  cp a, KB_MODE_BUTTONS
  ret nz
  ld a, [wGamepadState]
  or a, PADF_SELECT
  ld [wGamepadState], a
  ret

KBHandleEnter::
  ld a, [wGamepadState]
  or a, PADF_START
  ld [wGamepadState], a
  ret

KBHandleBackspace::
  ld b, a
  ld a, [kb_mode]
  cp a, KB_MODE_TYPING
  ret nz
  ld a, [wGamepadState]
  or a, PADF_B
  ld [wGamepadState], a
  ret

KBHandleDelete::
  ld b, a
  ld a, [kb_mode]
  cp a, KB_MODE_TYPING
  ret nz

  ret

KBHandleFunctionKey::;a = function key
  ;TODO: jump between scenes
  ret

KBHandleEscape::
  ld b, a
  ld a, [kb_mode]
  cp a, KB_MODE_BUTTONS
  ret nz
  ld a, [wGamepadState]
  or a, PADF_B
  ld [wGamepadState], a
  ret