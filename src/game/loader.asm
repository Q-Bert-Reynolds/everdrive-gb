SECTION "Game loading and random game search", ROM0[$175b]

ShowLoadingScreen:
  call ClearShadowScreen
  ld a, $07
  push af
  inc sp
  call SetMenuCursor
  inc sp
  xor a
  push af
  inc sp
  call SetMenuTextMode
  inc sp
  ld de, LoadingGameText
  push de
  call RenderMenuLabel
  add sp, $02
  jp DrawToScreen0

LoadingGameText:: DB "Loading...", 0

PrepareGame:
  ; Reject ROMs larger than 8 MiB. Compare the previous game identity, handle
  ; its save/RTC, decode the selected ROM metadata, update the registry and
  ; prepare the selected game save/RTC. Does not itself switch into the game.
  add sp, -$25
  ld hl, sp+$27
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $1d
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, DIRECTORY_ENTRY_FILE_SIZE
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, sp + $19
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp + $19
  ld a, $00
  sub [hl]
  inc hl
  ld a, $00
  sbc [hl]
  inc hl
  ld a, $80
  sbc [hl]
  inc hl
  ld a, $00
  sbc [hl]
  jr nc, .prepare

  ld e, $30
  jp .done


.prepare:
  call ShowLoadingScreen
  ld bc, $c007
  ld a, [bc]
  ld hl, sp + $13
  ld [hl], a
  ld hl, sp+$00
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  push bc
  push de
  call ReadCartEEPROMSettings
  add sp, $02
  pop bc
  ld a, e
  or a
  jp nz, .done

  ld de, wPreparedGameValid
  ld a, [de]
  ld hl, sp + $19
  ld [hl], a
  ld hl, $000c
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp + $1f
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $19
  ld a, [hl]
  or a
  jp z, .readMetadata

  ld de, $c129
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp + $20
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  inc hl
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp + $19
  ld a, [hl]
  ld hl, sp + $21
  sub [hl]
  jp nz, .readMetadata
  ld hl, sp + $1a
  ld a, [hl]

  ld hl, sp+$22
  sub [hl]
  jp nz, .readMetadata
  ld hl, sp + $1b
  ld a, [hl]

  ld hl, sp+$23
  sub [hl]
  jp nz, .readMetadata
  ld hl, sp + $1c
  ld a, [hl]

  ld hl, sp+$24
  sub [hl]
  jr nz, .readMetadata
  ld hl, sp + $13
  ld a, [hl]
  or a
  jr z, .handlePreviousRTC

  push bc
  call BackupGameSaveFiles
  pop bc
  ld a, e
  or a
  jp nz, .done

  ld a, [$c008]
  or a
  jr z, .handlePreviousRTC

  ld a, [wGameRAMMask]
  sub $0f
  jr nz, .handlePreviousRTC

  push bc
  ld a, $01
  push af
  inc sp
  call CheckSaveRAMMarker
  inc sp
  pop bc

.handlePreviousRTC:
  push bc
  call BackupGameRTCFile
  pop bc
  ld a, e
  or a
  jp nz, .done

.readMetadata:
  ld de, wGameMapper
  push bc
  push de
  ld hl, sp + $21
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ReadGameMetadata
  add sp, $04
  pop bc
  ld a, e
  or a
  jp nz, .done

  ld hl, sp+$28
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  ld hl, DIRECTORY_ENTRY_SIZE
  push hl
  ld hl, wPreparedGameEntry
  push hl
  push de
  call CopyMemory
  add sp, $06
  pop bc
  ld de, $c129
  ld a, [de]
  ld hl, sp + $21
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp + $20
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl]
  ld [de], a
  inc de
  inc hl
  ld a, [hl]
  ld [de], a
  inc de
  inc hl
  ld a, [hl]
  ld [de], a
  inc de
  inc hl
  ld a, [hl]
  ld [de], a
  ld hl, $0008
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp + $21
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp + $19
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp + $19
  inc [hl]
  jr nz, .storeLaunchCount

  inc hl
  inc [hl]
  jr nz, .storeLaunchCount

  inc hl
  inc [hl]
  jr nz, .storeLaunchCount

  inc hl
  inc [hl]

.storeLaunchCount:
  ld hl, sp + $22
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $19
  ld a, [hl]
  ld [de], a
  inc de
  inc hl
  ld a, [hl]
  ld [de], a
  inc de
  inc hl
  ld a, [hl]
  ld [de], a
  inc de
  inc hl
  ld a, [hl]
  ld [de], a
  push bc
  call WriteCartEEPROMSettings
  add sp, $02
  ld a, e
  or a
  jp nz, .done

  ld hl, wPreparedGameValid
  ld [hl], $01
  call SaveRegistry
  ld a, e
  or a
  jp nz, .done
  ld hl, sp + $13
  ld a, [hl]
  or a
  jr z, .handleGameRTC

  call RestoreGameSaveFiles
  ld a, e
  or a
  jp nz, .done

.handleGameRTC:
  call RestoreGameRTCFile
  ld a, e
  or a
  jp nz, .done

  ld hl, sp+$29
  ld a, [hl]
  or a
  jr z, .success

  ld hl, sp + $14
  ld c, l
  ld b, h
.buildBankedCallback::
  ld hl, $0001
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp + $21
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $1d
  ld a, [hl]
  ld [de], a
  inc de
  inc hl
  ld a, [hl]
  ld [de], a
  ld a, $02
  ld [bc], a
  push bc
  ld a, OS_PAGE_RECENT_GAMES
  push af
  inc sp
  call OS_CallPage
  add sp, $03

.success:
  ld e, $00

.done:
  add sp, $25
  ret


LaunchPreparedGame:
  ; Require a prepared game and matching cartridge settings. Open the ROM and
  ; stream it into the cartridge, configure mapper masks and optional banked
  ; services, then call Cart_LaunchGame. A returning launch reports $33.
  add sp, -$24
  ld hl, sp + $13
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld a, [wPreparedGameValid]
  or a
  jr nz, .readCartSettings

  ld e, $32
  jp .done

.readCartSettings:
  call ShowLoadingScreen
  ld hl, sp+$00
  ld a, l
  ld d, h
  ld hl, sp + $22
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call ReadCartEEPROMSettings
  add sp, $02
  ld a, e
  or a
  jp nz, .done
  ld hl, sp + $23
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000c
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, sp + $1a
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld de, $c129
  ld a, [de]
  inc hl
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp + $1a
  ld a, [hl]
  ld hl, sp + $1e
  sub [hl]
  jr nz, .gameMismatch
  ld hl, sp + $1b
  ld a, [hl]
  ld hl, sp + $1f
  sub [hl]
  jr nz, .gameMismatch
  ld hl, sp + $1c
  ld a, [hl]
  ld hl, sp + $20
  sub [hl]
  jr nz, .gameMismatch
  ld hl, sp + $1d
  ld a, [hl]
  ld hl, sp + $21
  sub [hl]
  jr z, .openROM

.gameMismatch:
  ld e, $32
  jp .done

.openROM:
  ld de, wPreparedGameEntry
  ld hl, $0000
  push hl
  push de
  call OpenFileForSectorIO
  add sp, $04
  ld a, e
  or a
  jp nz, .done

  call DisableStreaming
  ld de, wFileSectorsRemaining
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  xor a
  cp c
  ld a, $3f
  sbc b
  jr nc, .transferROM

  ld bc, $3f00

.transferROM:
  ld hl, sp + $13
  ld e, l
  ld d, h
  xor a
  push af
  inc sp
  push bc
  push de
  call ReadFileSectors
  add sp, $05
  ld a, e
  or a
  jp nz, .done

  ld a, [$c007]
  or a
  jr nz, .initializeLaunchService

  ld hl, OSSaveBackupPending
  ld [hl], $01
  call RestoreGameSaveFiles
  ld a, e
  or a
  jp nz, .done

.initializeLaunchService:
  ld a, [$c02d]
  or a
  jr z, .configureMapperMasks

  ld hl, sp + $15
  ld e, l
  ld d, h
  ld a, $03
  ld [de], a
  ld hl, sp + $15
  ld e, l
  ld d, h
  push de
  ld a, OS_PAGE_CHEATS
  push af
  inc sp
  call OS_CallPage
  add sp, $03
  ld a, e
  or a
  jp nz, .done

.configureMapperMasks:
  xor a
  push af
  inc sp
  call Call_000_2b06
  inc sp
  ld a, [wGameROMMask]
  push af
  inc sp
  call Call_000_0481
  inc sp
  ld a, [wGameRAMMask]
  push af
  inc sp
  call Call_000_0488
  inc sp
  ld hl, sp + $23
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0012
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  or a
  jr nz, .clearROMMask

  ld a, [$c005]
  or a
  jr nz, .configureSnapshotRAM

.clearROMMask:
  xor a
  push af
  inc sp
  call Call_000_0481
  inc sp

.configureSnapshotRAM:
  ld hl, SnapshotUse32KiBCartRAM
  ld [hl], $00
  ld a, [wGameRAMMask]
  or a
  jr z, .finalizeDisplay

  ld [hl], $01

.finalizeDisplay:
  call RefreshGameRTCBeforeLaunch
  call ClearShadowScreen
  call DrawToScreen0
  call WaitVBL
  ld a, [$c030]
  or a
  jr z, .disableCartFeature

  call Call_000_05ed
  jr .restoreCPUSpeed

.disableCartFeature:
  call Call_000_05f6

.restoreCPUSpeed:
  ld a, [wOSSystemType]
  sub $03
  jr nz, .enableAudio

  call SetCPUSpeedSlowIfFast

.enableAudio:
  ld hl, rAUDENA
  ld [hl], AUDENA_ON
  ld a, [$c031]
  or a
  jr nz, @ + 10
  ld a, $03
  push af
  inc sp
  call SetRegBD20
  inc sp
  ld a, [wGameMapper]
  push af
  inc sp
  call Cart_LaunchGame
  inc sp
  ld e, $33

.done:
  add sp, $24
  ret


GetOSGlobalsPointer:
  ld de, _RAM
  ret


GetRegistryPointer:
  ld de, wRegistry
  ret


FindRandomGame:
  ; Try at most 128 randomly selected directory entries, following directory
  ; clusters and accepting the gb/gbc suffix list below. Prepare and launch
  ; a matching game; otherwise display the no-supported-games dialog.
  add sp, -$80
  add sp, -$80
  add sp, -$16
  call GetDirectoryCluster
  ld b, l
  ld c, h
  ld hl, sp + $12
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp + $0a
  ld a, l
  ld d, h
  ld hl, $0114
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], LOW(GameExtensionPaddedText)
  inc hl
  ld [hl], HIGH(GameExtensionPaddedText)
  ld hl, $0115
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, LOW(GameExtensionGBText)
  ld [bc], a
  inc bc
  ld a, HIGH(GameExtensionGBText)
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], LOW(GameExtensionGBCText)
  inc hl
  ld [hl], HIGH(GameExtensionGBCText)
  ld hl, $0115
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$00
  ld a, l
  ld d, h
  ld hl, $00fe
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], LOW(RandomGameErrorTitle)
  inc hl
  ld [hl], HIGH(RandomGameErrorTitle)
  ld hl, $00ff
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, LOW(RandomGameErrorLine1)
  ld [bc], a
  inc bc
  ld a, HIGH(RandomGameErrorLine1)
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], LOW(RandomGameErrorLine2)
  inc hl
  ld [hl], HIGH(RandomGameErrorLine2)
  ld hl, $00ff
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], LOW(RandomGameErrorLine3)
  inc hl
  ld [hl], HIGH(RandomGameErrorLine3)
  ld hl, $00ff
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $05
  inc hl
  ld [hl], $00
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
  ld de, SearchingGamesText
  push de
  call RenderMenuLabel
  add sp, $02
  call DrawToScreen0
  ld hl, $00fd
  add hl, sp
  ld [hl], $00
  ld hl, sp + $12
  ld d, h
  ld e, l
  ld hl, $0104
  add hl, sp
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, $00fb
  add hl, sp
  ld [hl], $00
  inc hl
  ld [hl], $00

.nextAttempt:
  ld a, $0a
  ld hl, $00fd
  add hl, sp
  sub [hl]
  jr nc, .readDirectory

  ld [hl], $00
  ld hl, sp + $12
  ld d, h
  ld e, l
  ld hl, $0104
  add hl, sp
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a

.readDirectory:
  ld hl, $00fd
  add hl, sp
  inc [hl]
  ld hl, $0106
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $0106
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ReadDirectoryIndex
  add sp, $04
  ld a, e
  or a
  jp nz, .done

  ld hl, wDirectoryEntryCount+$01
  ld a, [hl-]
  or [hl]
  jr nz, .pickEntry
  ld hl, sp + $12
  ld d, h
  ld e, l
  ld hl, $0104
  add hl, sp
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, $00fd
  add hl, sp
  ld [hl], $00
  jp .advanceAttempt


.pickEntry:
  call NextRandomWord
  ld hl, wDirectoryEntryCount
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call Bank1Function6D67
  add sp, $04
  ld c, e
  ld b, d
  ld hl, sp + $16
  ld a, l
  ld d, h
  ld hl, $0108
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, $010e
  add hl, sp
  ld [hl+], a
  ld [hl], e
  sla c
  rl b
  sla c
  rl b
  ld hl, wDirectoryEntryIDs
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, $010a
  add hl, sp
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $010e
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $010e
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ReadDirectoryEntry
  add sp, $06
  ld a, e
  or a
  jp nz, .done

  ld hl, $0109
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, DIRECTORY_ENTRY_IS_DIRECTORY
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld hl, $010a
  add hl, sp
  ld [hl], a
  ld a, [hl]
  or a
  jp z, .inspectEntry
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, DIRECTORY_ENTRY_ID
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, $0110
  add hl, sp
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld de, wSystemDirectoryCluster
  ld a, [de]
  ld hl, $0100
  add hl, sp
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, $0110
  add hl, sp
  ld a, [hl]
  ld hl, $0100
  add hl, sp
  sub [hl]
  jp nz, .inspectEntry

  ld hl, $0111
  add hl, sp
  ld a, [hl]
  ld hl, $0101
  add hl, sp
  sub [hl]
  jp nz, .inspectEntry
  ld hl, $0112
  add hl, sp
  ld a, [hl]
  ld hl, $0102
  add hl, sp
  sub [hl]
  jr nz, .inspectEntry
  ld hl, $0113
  add hl, sp
  ld a, [hl]
  ld hl, $0103
  add hl, sp
  sub [hl]
  jr nz, .inspectEntry
  ld hl, sp + $12
  ld d, h
  ld e, l
  ld hl, $0104
  add hl, sp
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, $00fd
  add hl, sp
  ld [hl], $00
  jp .advanceAttempt


.inspectEntry:
  ld hl, $010a
  add hl, sp
  ld a, [hl]
  or a
  jr z, .checkExtension
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, DIRECTORY_ENTRY_CLUSTER
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, $0104
  add hl, sp
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  jp .advanceAttempt


.checkExtension:
  ld hl, $0109
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0115
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  push de
  call StringMatchesSuffixList
  add sp, $04
  ld a, e
  or a
  jr z, .incrementAttempt

  ld hl, $0109
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, $01
  push af
  inc sp
  push de
  call PrepareGame
  add sp, $03
  ld a, e
  or a
  jp nz, .done

  call LaunchPreparedGame
  ld a, e
  or a
  jr nz, .returnStatus

.advanceAttempt:
.incrementAttempt:
  ld hl, $00fb
  add hl, sp
  inc [hl]
  jr nz, .checkAttemptLimit

  inc hl
  inc [hl]

.checkAttemptLimit:
  ld hl, $00fb
  add hl, sp
  ld a, [hl]
  sub $80
  inc hl
  ld a, [hl]
  sbc $00
  jp c, .nextAttempt

  ld hl, $00ff
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
  ld e, $00

.done:
.returnStatus:
  add sp, $7f
  add sp, $7f
  add sp, $18
  ret


GameExtensionPaddedText:: DB "gb ", 0
GameExtensionGBText::     DB "gb", 0
GameExtensionGBCText::    DB "gbc", 0
RandomGameErrorTitle::    DB "D'oh!", 0
RandomGameErrorLine1::    DB "Supported games", 0
RandomGameErrorLine2::    DB "not found in", 0
RandomGameErrorLine3::    DB "current folder", 0
SearchingGamesText::      DB "Search games...", 0
