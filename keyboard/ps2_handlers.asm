PS2HandleKeycode::;a = scan code
  cp a, PS2_EXTENDED_KEY_PREFIX;$E0
  jp z, PS2HandleExtendedKey

  cp a, PS2_RELEASED_KEY_PREFIX;$F0
  jp z, PS2HandleReleaseKey

  cp a, PS2_ACK;$FA
  jp z, PS2HandleAcknowledge

  cp a, PS2_ERROR;$FF
  jp z, PS2HandleError

  cp a, $84;size of the jump table
  jp nc, PS2HandleError;if code isn't one of 4 above and is over $83, error

  ld b, 0
  ld c, a;scan code
  ld hl, PS2JumpTable
 
  call PS2CheckExtendedFlag
  jr z, .lookupAddress;if not extended, lookup

.extendedKeys;otherwise check a few special cases
  ld a, c;scan code
  cp a, PS2_KEY_SUPER_LEFT; $1F
  jp z, PS2HandleSuper
  cp a, PS2_KEY_ALT_RIGHT            ;$11
  jp z, PS2HandleAlt
  cp a, PS2_KEY_CTRL_RIGHT           ;$14
  jp z, PS2HandleCtrl
  cp a, PS2_KEY_PRINT_SCREEN_INIT    ;$12
  jp z, PS2HandlePrintScreen
  cp a, PS2_KEY_SUPER_RIGHT          ;$27
  jp z, PS2HandleSuper
  cp a, PS2_KEY_MENUS                ;$2F
  jp z, PS2HandleMenus
  cp a, PS2_KEY_KEYPAD_SLASH         ;$4A ;same as non-extended
  jr z, .lookupAddress
  cp a, PS2_KEY_KEYPAD_ENTER         ;$5A ;same as non-extended 
  jr z, .lookupAddress
  cp a, $7E;size of extended jump table
  jp nc, PS2HandleError
  cp a, $69;lowest index in jump table
  jp c, PS2HandleError
  ld hl, PS2ExtendedJumpTable-$69*2
.lookupAddress
  add hl, bc
  add hl, bc;addresses are 2 bytes, add index twice
  ld a, [hli]
  ld b, a;lower byte of jump address
  ld a, [hl]
  ld h, a;upper byte of jump address
  ld l, b;hl = keycode jump address
  ld a, c;scan code
  jp hl

PS2HandleReleaseKey:
  ld a, [kb_flags]
  or a, KB_FLAG_RELEASE
  ld [kb_flags], a
  ret

PS2HandleExtendedKey:
  ld a, [kb_flags]
  or a, KB_FLAG_EXTENDED
  ld [kb_flags], a
  ret

PS2HandleAcknowledge:
  ;shouldn't be getting ACK since GB can't send commands
  xor a;ACK shouldn't have flags
  ld [kb_flags], a
  ret

PS2HandleError:;a = scan code  
  cp a, PS2_NULL
  jr z, .keyboardError
  cp a, PS2_ERROR
  jr z, .keyboardError
.unknownScanCode
  ld a, [kb_error]
  or a, PS2_ERROR_UNKNOWN_CODE
  ld [kb_error], a
  jr .clearFlags
.keyboardError
  ld a, [kb_error]
  or a, PS2_ERROR_KEYBOARD
  ld [kb_error], a
.clearFlags
  xor a
  ld [kb_flags], a
  ret 

PS2HandleFunctionKey:
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
  ;TODO convert scan code to function key number
  jp KBHandleFunctionKey

PS2HandleTab:
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
  jp KBHandleTab

PS2HandleShift:
  call PS2CheckReleaseFlag
  ld a, [kb_modifiers]
  jr nz, .releaseShift
.pressShift
  or a, KB_MOD_SHIFT
  jr .finish
.releaseShift
  and a, ~KB_MOD_SHIFT
.finish
  ld [kb_modifiers], a
  ret

PS2HandleAlt:
  call PS2CheckReleaseFlag
  ld a, [kb_modifiers]
  jr nz, .releaseAlt
.pressAlt
  or a, KB_MOD_ALT
  jr .finish
.releaseAlt
  and a, ~KB_MOD_ALT
.finish
  ld [kb_modifiers], a
  ret

PS2HandleSuper:
  call PS2CheckReleaseFlag
  ld a, [kb_modifiers]
  jr nz, .releaseSuper
.pressSuper
  or a, KB_MOD_SUPER
  jr .finish
.releaseSuper
  and a, ~KB_MOD_SUPER
.finish
  ld [kb_modifiers], a
  ret

PS2HandleCtrl:
  call PS2CheckReleaseFlag
  ld a, [kb_modifiers]
  jr nz, .releaseCtrl
.pressCtrl
  or a, KB_MOD_CTRL
  jr .finish
.releaseCtrl
  and a, ~KB_MOD_CTRL
.finish
  ld [kb_modifiers], a
  ret
  
PS2HandleCharacter:;a = scan code
  ld b, 0
  ld c, a;scan code
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
.lookupASCII
  ld hl, PS2toASCIIKeymap
  ld a, [kb_modifiers]
  and a, KB_MOD_SHIFT
  jr z, .unshifted
.shifted
  ld hl, PS2toASCIIShiftedKeymap
.unshifted
  add hl, bc
  ld a, [hl];ASCII value
  jp KBHandleCharacter

;TODO these should toggle lock bits in kb_modifiers
;     should also disable and enable keyboard lights
PS2HandleCapsLock:
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
  ;if previous keycode is not caps lock, toggle caps lock in kb_modifiers
  ret

PS2HandleScrollLock:
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
  ;if previous keycode is not scroll lock, toggle caps lock in kb_modifiers
  ret

PS2HandleNumLock:
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
  ;if previous keycode is not num lock, toggle caps lock in kb_modifiers
  ret 

PS2HandleBackspace:
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
  jp KBHandleBackspace

PS2HandleEscape:
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
  jp KBHandleEscape 

PS2HandleEnter:
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
  jp KBHandleEnter

PS2HandleEndKey:
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
  ret

PS2HandleHomeKey:
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
  ret

PS2HandleInsertKey:
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
  ret

PS2HandleDeleteKey:
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
  ret

PS2HandleArrowKey:;scan code in a
  ld b, a
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
  ld a, PS2_KEY_UP_ARROW
  cp a, b
  jr z, .upPressed
  ld a, PS2_KEY_LEFT_ARROW
  cp a, b
  jr z, .leftPressed
  ld a, PS2_KEY_DOWN_ARROW
  cp a, b
  jr z, .downPressed
  ; ld a, PS2_KEY_RIGHT_ARROW
  ; cp a, b
.rightPressed
  ld a, PADF_RIGHT
  jp KBHandleArrowKey
.leftPressed
  ld a, PADF_LEFT
  jp KBHandleArrowKey
.upPressed
  ld a, PADF_UP
  jp KBHandleArrowKey
.downPressed
  ld a, PADF_DOWN
  jp KBHandleArrowKey

PS2HandlePageDown:
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
  ret

PS2HandlePageUp:
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
  ret

PS2HandlePrintScreen:
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
  ret

PS2HandleMenus:
  call PS2CheckReleaseFlag
  ret nz;if release flag set, return early
  ret

;sets z if release flag was already zero
;otherwise, sets release flag to 0
;only affects af
PS2CheckReleaseFlag:
  ld a, [kb_flags]
  and a, KB_FLAG_RELEASE
  push af;flags to return
  ld a, [kb_flags]
  and a, ~KB_FLAG_RELEASE
  ld [kb_flags], a
  pop af
  ret

;sets z if extended flag was already zero
;otherwise, sets extended flag to 0
;only affects af
PS2CheckExtendedFlag:
  ld a, [kb_flags]
  and a, KB_FLAG_EXTENDED
  push af;flags to return
  ld a, [kb_flags]
  and a, ~KB_FLAG_EXTENDED
  ld [kb_flags], a
  pop af
  ret