IGKBHandleCode::;a = scan code
.handleSpace
  cp a, 137
  jr nz, .handlePeriod
  ld a, " "
  jp KBHandleCharacter
.handlePeriod
  cp a, 148
  jr nz, .handleApostrophe
  ld a, "."
  jp KBHandleCharacter
.handleApostrophe
  cp a, 145
  jr nz, .handleComma
  ld a, "'"
  jp KBHandleCharacter
.handleComma
  cp a, 147
  jr nz, .handleEnter
  ld a, ","
  jp KBHandleCharacter
.handleEnter
  cp a, 133
  jr nz, .handleBackspace
  jp KBHandleEnter
.handleBackspace
  cp a, 135
  jr nz, .handleZero
  jp KBHandleBackspace
.handleZero
  cp a, 132
  jr nz, .handleNumber
  ld a, "0"
  call KBHandleCharacter
.handleNumber
  cp a, 123
  jr c, .handleCharacter
  cp a, 132
  jr nc, .handleCharacter
  sub a, 74
.handleCharacter
; For all other characters, IG does the following to get the keycode:
;   ASCIICode += char((unsigned char)HIDCode + (shift ? 61 : 93));
; ASCII ends at 127, so anything above that must be readjusted
  jp nc, .handleOther
  call KBHandleCharacter
.handleOther
  ;The shift trick that IG does fucks up most special keys.
  ;assuming that shift key not pressed
  sub a, 93;HID codes >40
  ld b, 0
  ld c, a
  ld hl, IGKBJumpTable
  add hl, bc
  add hl, bc
  ld a, [hli]
  ld b, a
  ld a, [hl]
  ld h, a
  ld l, b
  jp hl

IGKBHandleEnter:
  jp KBHandleEnter

IGKBHandleCharacter:
  ret

IGKBHandleEscape:
  jp KBHandleEscape

IGKBHandleBackspace:
  jp KBHandleBackspace

IGKBHandleTab:
  jp KBHandleTab

IGKBHandleFunctionKey:
  ret

IGKBHandlePrintScreen:
  ret

IGKBHandleScrollLock:
  ret

IGKBHandleNumLock:
  ret

IGKBHandleCapsLock:
  ret

IGKBHandlePauseKey:
  ret

IGKBHandleInsertKey:
  ret

IGKBHandleHomeKey:
  ret

IGKBHandlePageUp:
  ret

IGKBHandleDelete:
  ret

IGKBHandleEndKey:
  ret

IGKBHandlePageDown:
  ret

IGKBHandleArrowKey:
  ld b, a
  ld a, USB_KEY_UP
  cp a, b
  jr z, .upPressed
  ld a, USB_KEY_LEFT
  cp a, b
  jr z, .leftPressed
  ld a, USB_KEY_DOWN
  cp a, b
  jr z, .downPressed
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

IGKBHandleError:;a = scan code
  ;TODO
  ret
