SECTION "In-Game Menu", ROM0[$0a88]

ShowInGameMenu:
  ; $0a88. SDCC stack frame ($021d bytes):
  ; +$000: title/three entries/flags (five words)
  ; +$00a: 512-byte sector buffer; +$20a: sector index; +$20c: action
  ; +$20d: no-save dialog (five words); +$217..+$21c: temporary pointers.
  ; Build {InGameMenuText, SaveStateText, LoadStateText, BackToMenuText, 0}.
  ; The split LOW/HIGH stores are why these strings formerly had no xrefs.
  ld hl, $fde3
  add hl, sp
  ld sp, hl
  ld hl, sp+$00
  ld a, l
  ld d, h
  ld hl, $021b
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], LOW(InGameMenuText)
  inc hl
  ld [hl], HIGH(InGameMenuText)
  ld hl, $021c
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, LOW(SaveStateText)
  ld [bc], a
  inc bc
  ld a, HIGH(SaveStateText)
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], LOW(LoadStateText)
  inc hl
  ld [hl], HIGH(LoadStateText)
  ld hl, $021c
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], LOW(BackToMenuText)
  inc hl
  ld [hl], HIGH(BackToMenuText)
  ld hl, $021c
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, $020d
  add hl, sp

.buildNoSaveDialog:
  ; Same title, three message lines, then flags $0005 (compact/message).
  ld a, l
  ld d, h
  ld hl, $0219
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], LOW(InGameMenuText)
  inc hl
  ld [hl], HIGH(InGameMenuText)
  ld hl, $021a
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, LOW(NoSaveDataText)
  ld [bc], a
  inc bc
  ld a, HIGH(NoSaveDataText)
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], LOW(NoSaveDataLine2Text)
  inc hl
  ld [hl], HIGH(NoSaveDataLine2Text)
  ld hl, $021a
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], LOW(NoSaveDataLine3Text)
  inc hl
  ld [hl], HIGH(NoSaveDataLine3Text)
  ld hl, $021a
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], LOW(MENU_FLAG_MESSAGE | MENU_FLAG_COMPACT)
  inc hl
  ld [hl], HIGH(MENU_FLAG_MESSAGE | MENU_FLAG_COMPACT)
  xor a
  push af
  inc sp
  call InitializeMenuDisplayState
  inc sp
  ld hl, $021c
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  xor a
  push af
  inc sp
  push de
  call ShowMenuDialog
  add sp, $03
  ld hl, $020c
  add hl, sp
  ld [hl], e

.waitForButtonRelease:
  call GetInput
  ld a, e
  or a
  jr nz, .waitForButtonRelease
  call ClearShadowScreen
  xor a
  push af
  inc sp
  call SetMenuTextMode
  inc sp
  ld hl, $0800
  push hl
  call SetMenuCursorAddress
  add sp, $02
  ld de, LoadingText
  push de
  call RenderMenuLabel
  add sp, $02
  call DrawToScreen0
  ld hl, $020c
  add hl, sp
  ld a, [hl]
  or a ; INGAME_ACTION_SAVE = 0; all other actions skip the save copy
  jp nz, .checkLoadAction

.saveState:
  ld hl, sp+$0a
  ld a, l
  ld d, h
  ld hl, $021b
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, $0217
  add hl, sp
  ld [hl+], a
  ld [hl], e
  ld hl, $020a
  add hl, sp
  ld [hl], $00
  inc hl
  ld [hl], $00

.copySnapshotToSaveSlot:
  ; Copy $3e40+i (snapshot) -> $0040+i (save RAM), for i = 0..$a3.
  call DisableStreaming
  ld hl, $020b
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, SNAPSHOT_FIRST_SECTOR
  add hl, de
  ld c, l
  ld b, h
  push bc
  call Cart_SetSectorPointerFromStack
  add sp, $02
  ld hl, $021c
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call BufferWindow_CopyToHL
  add sp, $02
  call EnableStreaming
  ld hl, $020b
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, SAVE_SLOT_FIRST_SECTOR
  add hl, de
  ld c, l
  ld b, h
  push bc
  call Cart_SetSectorPointerFromStack
  add sp, $02
  ld hl, $0218
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call BufferWindow_CopyFromHL
  add sp, $02
  ld hl, $020a
  add hl, sp
  inc [hl]
  jr nz, .checkSaveCopyDone

  inc hl
  inc [hl]

.checkSaveCopyDone:
  ld hl, $020a
  add hl, sp
  ld a, [hl]
  sub LOW(SNAPSHOT_SECTOR_COUNT)
  inc hl
  ld a, [hl]
  sbc $00
  jp c, .copySnapshotToSaveSlot

.checkLoadAction:
  ld hl, $020c
  add hl, sp
  ld a, [hl]
  dec a ; INGAME_ACTION_LOAD = 1
  jp nz, .checkExitAction
  call EnableStreaming
  ld hl, SAVE_SLOT_FIRST_SECTOR
  push hl
  call Cart_SetSectorPointerFromStack
  add sp, $02
  ld de, SaveStateSignatureText
  ld a, $04
  push af
  inc sp
  push de
  ld hl, sBufferWindow
  push hl
  call CompareBytesEqual
  add sp, $05
  ld a, e
  or a
  jr nz, .loadState
  ; No "SAVE" signature: acknowledge the message and resume the current
  ; snapshot. RestoreSnapshotState does not return here.
  call ClearShadowScreen
  ld hl, $021a
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  xor a
  push af
  inc sp
  push de
  call ShowMenuDialog
  add sp, $03
  call RestoreSnapshotState

.loadState:
  ld hl, sp + $0a
  ld a, l
  ld d, h
  ld hl, $0217
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  inc hl
  ld [hl+], a
  ld [hl], e
  ld hl, $020a
  add hl, sp
  ld [hl], $00
  inc hl
  ld [hl], $00

.copySaveSlotToSnapshot:
  ; Copy $0040+i (save RAM) -> $3e40+i (snapshot), for i = 0..$a3.
  call EnableStreaming
  ld hl, $020b
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, SAVE_SLOT_FIRST_SECTOR
  add hl, de
  ld c, l
  ld b, h
  push bc
  call Cart_SetSectorPointerFromStack
  add sp, $02
  ld hl, $0218
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call BufferWindow_CopyToHL
  add sp, $02
  call DisableStreaming
  ld hl, $020b
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, SNAPSHOT_FIRST_SECTOR
  add hl, de
  ld c, l
  ld b, h
  push bc
  call Cart_SetSectorPointerFromStack
  add sp, $02
  ld hl, $021a
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call BufferWindow_CopyFromHL
  add sp, $02
  ld hl, $020a
  add hl, sp
  inc [hl]
  jr nz, .checkLoadCopyDone
  inc hl
  inc [hl]

.checkLoadCopyDone:
  ld hl, $020a
  add hl, sp
  ld a, [hl]
  sub LOW(SNAPSHOT_SECTOR_COUNT)
  inc hl
  ld a, [hl]
  sbc $00
  jp c, .copySaveSlotToSnapshot

 .checkExitAction:
  ld hl, $020c
  add hl, sp
  ld a, [hl]
  sub INGAME_ACTION_EXIT
  jr nz, .resumeGame

  ld hl, CartSwitch
  ld [hl], $01 ; EntryPoint sees this and requests an OS reboot via $BD06=$10
  call EntryPoint

.resumeGame:
  ; Save, Load, and B/cancel all restore the snapshot before leaving.
  call RestoreSnapshotState
  ld hl, $021d
  add hl, sp
  ld sp, hl
  ret

InGameMenuText:: DB "In Game Menu", 0  
SaveStateText::  DB "Save State", 0
LoadStateText::  DB "Load State", 0
BackToMenuText:: DB "Back to menu", 0
NoSaveDataText::      DB "there is no", 0
NoSaveDataLine2Text:: DB "save data", 0
NoSaveDataLine3Text:: DB "for current game", 0
LoadingText::    DB "Loading...", 0
SaveStateSignatureText::      DB "SAVE", 0
