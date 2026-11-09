
SECTION "Game Launcher", ROM0[$0453]

; Launch game by configuring mapper in $BD07 and switching to bank 1
Cart_LaunchGame::
  pop de
  pop de
  ld a, [sStreamingConfig]
  and $20;keep bit 5 (Sys Button setting?)
  or $08
  ld [sStreamingConfig], a
  ld a, $00
  ld [sCartSwitch], a
  ld a, $00
  ld [rRAMG], a
  ld [rROMB1], a
  ld [rRAMB], a
  ld [rRTCLATCH], a
  ld a, $01
  ld [$2100], a
  ld [rROMB0], a
  ld a, e
  ld [sCartMapperMode], a        ; Configure target mapper mode (MBC1, MBC3, MBC5, etc.)

Jump_000_047e:
  jp Jump_000_047e


Call_000_0481:
  ld hl, sp+$02
  ld a, [hl]
  ld [sGameROMMask], a
  ret


Call_000_0488:
  ld hl, sp+$02
  ld a, [hl]
  ld [sGameRAMMask], a
  ret


; Call an 8 KiB OS page through $A000-$BFFF, selected by $BD08.
; This proves the address mapping, not the physical RAM technology.
; Stack arguments: page selector (byte), descriptor pointer (word).
; The descriptor is passed to the selected page entry at $A000.
OS_CallPage::
  ld hl, sp+$02
  ld a, [sCurrentBank]        ; Current OS page
  push af              ; Save current bank
  ld a, [hl]           ; Target bank
  ld [sCurrentBank], a        ; Switch to target page
  ld hl, sp+$05
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call _SRAM           ; Call the selected page entry ($A000)
  pop af
  pop af
  ld [sCurrentBank], a        ; Restore previous OS page
  ret


DisableStreaming:
  ld a, [sStreamingConfig]
  and $fd
  ld [sStreamingConfig], a
  ret


EnableStreaming:
  ld a, [sStreamingConfig]
  or $02
  ld [sStreamingConfig], a
  ret


; Set 512-byte sector buffer window pointer ($BD02/$BD03) from stack argument
Cart_SetSectorPointerFromStack::
  ld hl, sp+$02
  ld a, [hl+]
  ld [sBufferSectorLow], a
  ld a, [hl]
  ld [sBufferSectorHigh], a
  ret


Call_000_04c5:
  pop hl
  pop de
  push de
  push hl
  ld a, $00
  ld [sBufferSectorLow], a
  ld [sBufferSectorHigh], a

jr_000_04d1:
  ld a, $ff
  ld hl, sBufferWindow

jr_000_04d6:
  cp [hl]
  jr nz, jr_000_04f0

  inc l
  jr nz, jr_000_04d6

  inc h

jr_000_04dd:
  cp [hl]
  jr nz, jr_000_04f0

  inc l
  jr nz, jr_000_04dd

  ld a, [sBufferSectorLow]
  inc a
  ld [sBufferSectorLow], a
  dec e
  jr nz, jr_000_04d1

  ld e, $01
  ret


jr_000_04f0:
  ld e, $00
  ret


Call_000_04f3:
  pop hl
  pop de
  push de
  push hl
  ld a, $00
  ld [sBufferSectorLow], a
  ld [sBufferSectorHigh], a

jr_000_04ff:
  ld a, $ff
  ld hl, sBufferWindow

jr_000_0504:
  ld [hl], a
  inc l
  jr nz, jr_000_0504

  inc h

jr_000_0509:
  ld [hl], a
  inc l
  jr nz, jr_000_0509

  ld a, [sBufferSectorLow]
  inc a
  ld [sBufferSectorLow], a
  dec e
  jr nz, jr_000_04ff

  ret


; Copy 512 bytes from buffer window ($BE00) to RAM buffer [HL]
BufferWindow_CopyToHL::
  pop de
  pop hl
  push hl
  push de
  ld de, sBufferWindow

jr_000_051f:
  ld a, [de]
  ld [hl+], a
  inc e
  jr nz, jr_000_051f

  inc d

jr_000_0525:
  ld a, [de]
  ld [hl+], a
  inc e
  jr nz, jr_000_0525

  ret


; Copy 512 bytes from RAM buffer [HL] to buffer window ($BE00)
BufferWindow_CopyFromHL::
  pop de
  pop hl
  push hl
  push de
  ld de, sBufferWindow

jr_000_0532:
  ld a, [hl+]
  ld [de], a
  inc e
  jr nz, jr_000_0532

  inc d

jr_000_0538:
  ld a, [hl+]
  ld [de], a
  inc e
  jr nz, jr_000_0538

  ret


SetCPUSpeedSlowIfSlow::;this seems unnecessary
  ldh a, [rKEY1]
  sla a
  jr nc, SetCPUSpeedSlow

  ret

SetCPUSpeedSlowIfFast:
  ldh a, [rKEY1]
  sla a
  jr c, SetCPUSpeedSlow

  ret


SetCPUSpeedSlow:
  ld a, $00
  ldh [rIE], a;disable interrupts
  ld a, P1F_GET_NONE
  ldh [rP1], a
  ld a, KEY1F_PREPARE
  ldh [rKEY1], a
  stop
  ret


SECTION "Pocket fix maybe???", ROM0[$0606]
SetRegBD20:;new in v1.06, called before launching a game (Pocket fix?)
  ld hl, sp + $02
  ld a, [hl]
  ld [sRegBD20], a
  ret