; Snapshot workspace and game capture/restore

SECTION "Snapshot workspace", ROM0[$060d]

DS 21, $FF

edLCDC: DB $FF
edSVBK: DB $FF
edVBK:  DB $FF
edBCPS: DB $FF
edOCPS: DB $FF

SRAMtoIOMap::
  DB LOW(rAUDENA)
  DB LOW(rAUDTERM)
  DB LOW(rDIV)
  DB LOW(rTIMA)
  DB LOW(rTMA)
  DB LOW(rTAC)
  DB LOW(rAUD1SWEEP)
  DB LOW(rAUD1LEN)
  DB LOW(rAUD1ENV)
  DB LOW(rAUD2LEN)
  DB LOW(rAUD2ENV)
  DB LOW(rAUD3ENA)
  DB LOW(rAUD3LEN)
  DB LOW(rAUD3LEVEL)
  DB LOW(rAUD4LEN)
  DB LOW(rAUD4ENV)
  DB LOW(rAUD4POLY)
  DB LOW(rAUD4GO)
  DB LOW(rAUDVOL)
  DB LOW(rSTAT)
  DB LOW(rSCY)
  DB LOW(rSCX)
  DB LOW(rLY)
  DB LOW(rLYC)
  DB LOW(rBGP)
  DB LOW(rOBP0)
  DB LOW(rOBP1)
  DB LOW(rWY)
  DB LOW(rWX)
  DB LOW(_AUD3WAVERAM)
  DB LOW(_AUD3WAVERAM+$1)
  DB LOW(_AUD3WAVERAM+$2)
  DB LOW(_AUD3WAVERAM+$3)
  DB LOW(_AUD3WAVERAM+$4)
  DB LOW(_AUD3WAVERAM+$5)
  DB LOW(_AUD3WAVERAM+$6)
  DB LOW(_AUD3WAVERAM+$7)
  DB LOW(_AUD3WAVERAM+$8)
  DB LOW(_AUD3WAVERAM+$9)
  DB LOW(_AUD3WAVERAM+$A)
  DB LOW(_AUD3WAVERAM+$B)
  DB LOW(_AUD3WAVERAM+$C)
  DB LOW(_AUD3WAVERAM+$D)
  DB LOW(_AUD3WAVERAM+$E)
  DB LOW(_AUD3WAVERAM+$F)
  DB LOW(rLCDC)
  DB LOW(rVBK)
  DB LOW(rSVBK)
  DB LOW(rIE)
  DB LOW(rIF)
  DB 0

SaveText:: DB "SAVE"

SECTION "Snapshot capture and restore", ROM0[$0670]
VBLInterrupt:
  ; In-game entry at $0670 via the OS's $0040 vector. The cart must expose
  ; the OS mapping first; this handler does not poll the physical cart button.
  ; Save the game's registers before borrowing WRAM/VRAM for the menu.
  push af
  push bc
  push de
  push hl
  di
  ld a, EDGB_UNLOCK_KEY
  ld [sEDGBUnlock], a
  ld a, $04
  ld [sStreamingConfig], a
  ld [sSavedSP], sp
  ld sp, SNAPSHOT_STACK_TOP
  call StoreScreenSettings
  and $00
  ldh [rLCDC], a
  ldh [rVBK], a
  and $01
  ldh [rSVBK], a
  ld a, HIGH(SNAPSHOT_FIRST_SECTOR)
  ld [sBufferSectorHigh], a
  call SaveGameStateHeader
  call SaveDisplayState
  call SaveBankedState
  call SaveCGBState
  call RestoreDisplayState
  ld sp, OS_STACK_TOP
  call SetInterrupts
  jp ShowInGameMenu


SaveGameStateHeader:
  ; Snapshot sector $3e40: "SAVE", saved SP (word), four mapper bytes.
  ld a, SNAPSHOT_HEADER_SECTOR
  ld [sBufferSectorLow], a
  call ClearBufferWindow
  ld hl, sBufferWindow
  ld a, [SaveText];[$065a]
  ld [hl+], a
  ld a, [SaveText+1]
  ld [hl+], a
  ld a, [SaveText+2]
  ld [hl+], a
  ld a, [SaveText+3]
  ld [hl+], a
  ld a, [sSavedSP]
  ld [hl+], a
  ld a, [sSavedSP+1]
  ld [hl+], a
  ld a, [sSavedMapperRegs];_SRAM+$1d14
  ld [hl+], a
  ld a, [sSavedMapperRegs+1]
  ld [hl+], a
  ld a, [sSavedMapperRegs+2]
  ld [hl+], a
  ld a, [sSavedMapperRegs+3]
  ld [hl+], a
  ret


SaveDisplayState:
  ; $3e41-$3e50: VRAM bank 0; $3e51-$3e60: $c000-$dfff;
  ; $3e61: $fe00-$ffff (OAM, IO and HRAM).
  ld a, SNAPSHOT_DISPLAY_SECTOR
  ld [sBufferSectorLow], a
  ld de, _VRAM
  ld c, $10
  call CopyDEtoEndOfSRAM
  ld de, _RAM
  ld c, $10
  call CopyDEtoEndOfSRAM
  call RestoreScreenSettings
  ld de, _OAMRAM
  ld c, $01
  call CopyDEtoEndOfSRAM
  ld a, $00
  ldh [rLCDC], a
  ldh [rNR51], a
  ret


  ld a, e
  add $10
  ld e, a
  ld a, l
  add $10
  ld l, a
  ret


SaveBankedState:
  ; Borrow WRAM as an 8 KiB transfer buffer. Bit 1 of $BD06 selects
  ; game save RAM; clear it to write the temporary snapshot instead.
  and $01
  ldh [rSVBK], a
  call GetSnapshotCartRAMChunkCount
  ld de, $0000

.copyCartRAM:
  push bc
  call CopyDEtoBD02
  call EnableStreaming
  ld hl, _RAM
  ld c, $10
  call CopyEndOfSRAMtoHL
  ld a, [sBufferSectorLow]
  sub $10
  add $62
  ld d, $3e
  ld e, a
  call CopyDEtoBD02
  call DisableStreaming
  ld de, _RAM
  ld c, $10
  call CopyDEtoEndOfSRAM
  ld a, [sBufferSectorLow]
  sub $62
  ld d, $00
  ld e, a
  pop bc
  dec c
  jr nz, .copyCartRAM

  ret


SaveCGBState:
  ; $3ea2: palettes; $3ea3-$3eb2: VRAM bank 1;
  ; $3eb3-$3ee2: WRAM banks 2-7. DetectCGBMode skips this on DMG.
  ld a, SNAPSHOT_CGB_SECTOR
  ld [sBufferSectorLow], a
  call ClearBufferWindow
  call DetectCGBMode
  ld hl, sBufferWindow

.copyBackgroundPalettes:
  ld a, l
  ldh [rBCPS], a
  ldh a, [rBCPD]
  ld [hl+], a
  ld a, l
  and $3f
  jr nz, .copyBackgroundPalettes

.copyObjectPalettes:
  ld a, l
  and $3f
  ldh [rOCPS], a
  ldh a, [rOCPD]
  ld [hl+], a
  ld a, l
  and $3f
  jr nz, .copyObjectPalettes

  call IncrementBD02
  ld a, $01
  ldh [rVBK], a
  ld de, _VRAM
  ld c, $10
  call CopyDEtoEndOfSRAM
  ld b, $02
  ld a, b

.copyWRAMBanks:
  ldh [rSVBK], a
  ld de, _RAMBANK
  ld c, $08
  call CopyDEtoEndOfSRAM
  inc b
  ld a, b
  cp $08
  jr nz, .copyWRAMBanks

  ret


GetSnapshotCartRAMChunkCount:
  ; C counts 8 KiB chunks, not 512-byte sectors. The flag itself is only 0/1.
  ld c, $01
  ld a, [SnapshotUse32KiBCartRAM]
  cp $00
  jr z, .done
  ld c, $04
.done:
  ret


CopyDEtoBD02:
  ld a, d
  ld [sBufferSectorHigh], a
  ld a, e
  ld [sBufferSectorLow], a
  ret


DetectCGBMode:
  ld a, 1
  ldh [rVBK], a
  ldh a, [rVBK]
  and 1
  jr z, .isDMG

  ld a, $00
  ldh [rVBK], a
  ldh a, [rVBK]
  and 1
  jr nz, .isDMG

  ld a, 1
  ldh [rSVBK], a
  ld a, $00
  ldh [rVBK], a
  ret
.isDMG:
  pop hl ; discard DetectCGBMode's return address, returning from its caller
  ret


RestoreSnapshotState:
  ; Does not return to the menu: restores the game's SP and mapper, then
  ; ResumeFromSavedCartState asks the cart to switch back to the game.
  di
  ld sp, SNAPSHOT_STACK_TOP
  ld a, $04
  ld [sStreamingConfig], a
  ld a, HIGH(SNAPSHOT_FIRST_SECTOR)
  ld [sBufferSectorHigh], a
  call RestoreDisplayState
  call RestoreBankedState
  call RestoreDisplayBuffers
  call StoreScreenSettings
  call RestoreDisplayState
  call RestoreCGBState
  call RestoreScreenSettings
  call RestoreMapperState
  jp OSIdleLoop


ResumeFromSavedCartState:
  ; Pulse $BD09 bit 1, restore the interrupted registers, and hand the
  ; pending frame to the game's VBlank handler after the mapping switches.
  ld a, $02
  ld [sCartSwitch], a
  ld a, $00
  ld [sCartSwitch], a
  pop hl
  pop de
  pop bc
  ldh a, [rIF]
  and $fe;clear VBL flag
  ldh [rIF], a
.waitVBL:
    ldh a, [rIF]
    and $01;is VBL flag set
  jr z, .waitVBL
  pop af
  jp VBlankVector

RestoreMapperState:
  ld a, SNAPSHOT_HEADER_SECTOR
  ld [sBufferSectorLow], a
  ld a, $00
  ld [sStreamingConfig], a
  ld a, [sSnapshotSavedSP+1]
  ld h, a
  ld a, [sSnapshotSavedSP]
  ld l, a
  ld sp, hl
  ld hl, sSnapshotMapperRegs
  ld a, [hl+]
  ld [rRAMG], a
  ld a, [hl+]
  ld [rRTCLATCH], a
  srl a
  ld [rROMB1], a
  ld a, [hl+]
  ld [rRAMB], a
  ld a, [hl+]
  ld [$2100], a
  ld [rROMB0], a
  jr ResumeFromSavedCartState

RestoreDisplayBuffers:
  ld a, SNAPSHOT_DISPLAY_SECTOR
  ld [sBufferSectorLow], a
  ld hl, _VRAM
  ld c, $10
  call CopyEndOfSRAMtoHL
  ld hl, _RAM
  ld c, $10
  call CopyEndOfSRAMtoHL
  ld hl, _OAMRAM
  ld de, sBufferWindow
  ld hl, _HRAM
  ld de, sSnapshotHRAM
  call Copy256FromDEtoHL
  call CopySRAMtoIO
  ret


RestoreBankedState:
  and $01
  ldh [rSVBK], a
  call GetSnapshotCartRAMChunkCount
  ld de, sSavedScreenState

.copyCartRAM:
  push bc
  call CopyDEtoBD02
  call DisableStreaming
  ld hl, _RAM
  ld c, $10
  call CopyEndOfSRAMtoHL
  ld a, [sBufferSectorLow]
  sub $72
  ld d, $00
  ld e, a
  call CopyDEtoBD02
  call EnableStreaming
  ld de, _RAM
  ld c, $10
  call CopyDEtoEndOfSRAM
  ld a, [sBufferSectorLow]
  add $62
  ld d, $3e
  ld e, a
  pop bc
  dec c
  jr nz, .copyCartRAM

  ld a, HIGH(SNAPSHOT_FIRST_SECTOR)
  ld [sBufferSectorHigh], a
  call DisableStreaming
  ret


RestoreInterruptState:
  ldh a, [rIE]
  ld b, a
  ld a, $61
  ld [sBufferSectorLow], a
  ld a, [sGBCFlags]
  and $80
  jr nz, .isDMG

  call SetCPUSpeedSlowIfFast
  jr .restoreInterrupts

.isDMG:
  call SetCPUSpeedSlowIfSlow

.restoreInterrupts:
  ld a, b
  ldh [rIE], a
  ret


RestoreCGBState:
  call DetectCGBMode
  call RestoreInterruptState
  ld a, SNAPSHOT_CGB_SECTOR
  ld [sBufferSectorLow], a
  ld hl, sBufferWindow

.copyBackgroundPalettes:
  ld a, l
  ldh [rBCPS], a
  ld a, [hl+]
  ldh [rBCPD], a
  ld a, l
  and $3f
  jr nz, .copyBackgroundPalettes

.copyObjectPalettes:
  ld a, l
  and $3f
  ldh [rOCPS], a
  ld a, [hl+]
  ldh [rOCPD], a
  ld a, l
  and $3f
  jr nz, .copyObjectPalettes

  call IncrementBD02
  ld a, $01
  ldh [rVBK], a
  ld hl, _VRAM
  ld c, $10
  call CopyEndOfSRAMtoHL
  ld b, $02
  ld a, b

.copyWRAMBanks:
  ldh [rSVBK], a
  ld hl, _RAMBANK
  ld c, $08
  call CopyEndOfSRAMtoHL
  inc b
  ld a, b
  cp $08
  jr nz, .copyWRAMBanks
  ret


StoreScreenSettings:
  ldh a, [rLCDC]
  ld [edLCDC], a
  ldh a, [rVBK]
  ld [edVBK], a
  ldh a, [rSVBK]
  ld [edSVBK], a
  ldh a, [rBCPS]
  ld [edBCPS], a
  ldh a, [rOCPS]
  ld [edOCPS], a
  ret


RestoreScreenSettings:
  ld a, [edLCDC]
  ldh [rLCDC], a
  ld a, [edVBK]
  ldh [rVBK], a
  ld a, [edSVBK]
  ldh [rSVBK], a
  ld a, [edBCPS]
  ldh [rBCPS], a
  ld a, [edOCPS]
  ldh [rOCPS], a
  ret


RestoreDisplayState:
  ld a, $00
  ldh [rLCDC], a
  ldh [rVBK], a
  ld a, $01
  ldh [rSVBK], a
  ret

SnapshotFallback:
  ld a, $00
  ld [sCartMapperMode], a
  ld a, $04
  ld [sCartSwitch], a
  ld a, $00
  ld [sCartSwitch], a
  jp OSIdleLoop


SECTION "Wait for a cartridge mapping transition", ROM0[$09be]

OSIdleLoop:
  jr OSIdleLoop
