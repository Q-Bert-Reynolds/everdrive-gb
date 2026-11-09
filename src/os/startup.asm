; OS startup loop

SECTION "OS startup loop", ROM0[$0a43]

InitializeOS::;$0a43
  ld a, $01
  push af
  inc sp
  call InitializeMenuDisplayState
  inc sp
  ld de, OSInitText
  push de
  call LoadOSInitText
  add sp, $02
  call DrawToScreen0
  call InitializeStorageAndSettings
  ld a, e
  or a
  jr z, .mainLoop

  push af
  inc sp
  call InvokeBankedOSRoutine
  inc sp
.sinkhole:
  jr .sinkhole

.mainLoop:
    ld hl, $0000
    push hl
    ld a, $04
    push af
    inc sp
    call OS_CallFarSRAM
    add sp, $03
    ld d, e
    push de
    inc sp
    call InvokeBankedOSRoutine
    inc sp
  jr .mainLoop
  ret

OSInitText::
    db "OS init...", 0


; Storage and settings initialization

SECTION "Storage initialization", ROM0[$0d46]
InitializeStorageAndSettings:
  ; Initialize the card and mount FAT32 before loading the registry and banked
  ; services. E carries an error/status code through the shared return path.
  add sp, -$07
  call I2C_ResetBus
  call I2C_ResetBus
  call Call_000_05f6
  ld de, _RAM
  ld hl, $002b
  push hl
  xor a
  push af
  inc sp
  push de
  call FillMemory
  add sp, $05
  call GetDisplaySystemType
  ld a, e
  ld de, wOSSystemType
  ld [de], a
  ld bc, wOSFirstInitialization
  ld hl, OSInitializationPending
  ld a, [hl]
  ld [bc], a
  ld [hl], $00
  ld a, [wOSSystemType]
  sub $03
  jr nz, .initializeSD

  call SetCPUSpeedSlowIfSlow

.initializeSD:
  call SD_Init
  ld a, e
  or a
  jp nz, .done

.mountVolume:
  call MountFAT32Volume
  ld a, e
  or a
  jp nz, .done

.initializeDirectories:
  call EnsureSystemDirectories
  ld a, e
  or a
  jp nz, .done

  call LoadRegistry
  ld a, e

.checkRegistryStatus:
  cp $35
  jr z, .resetInvalidRegistry

  sub $f0
  jr nz, .checkRegistryError

.resetInvalidRegistry:
  call ResetRegistryDefaults
  ld a, e
  or a
  jp nz, .done

  ld a, $35
  push af
  inc sp
  call InvokeBankedOSRoutine
  inc sp
  jr .initializeBankedServices

.checkRegistryError:
  ld a, e
  or a
  jp nz, .done

.initializeBankedServices:
  call Call_000_05e8
  ld a, e
  ld de, _RAM
  ld [de], a
  ld hl, sp+$00
  ld e, l
  ld d, h
  ld a, $01
  ld [de], a
  ld hl, sp+$00
  ld e, l
  ld d, h
  push de
  ld a, $06
  push af
  inc sp
  call OS_CallFarSRAM
  add sp, $03
  ld b, $00
  ld a, [$c007]
  or a
  jr nz, @ + 4
  ld b, $01
  ld a, [$c002]
  or a
  jr z, @ + 6
  ld a, b
  set 1, a
  ld b, a
  ld a, [$c003]
  or a
  jr z, @ + 6
  ld a, b
  set 2, a
  ld b, a
  push bc
  inc sp

  call Call_000_05ff
  inc sp

.checkRTC:
  ld b, $00
  ld de, $c002
  ld a, [de]
  ld c, a
  or a
  jr z, .checkSaveRAM

  call Bank1Function5A35
  ld b, e
  jr .handleSaveError

.checkSaveRAM:
  ld a, [$c008]
  or a
  jr z, .handleSaveError

  xor a
  push af
  inc sp
  call CheckSaveRAMMarker
  inc sp
  ld b, e

.handleSaveError:
  ld a, b
  or a
  jr z, .backupPendingSave

  push bc
  ld hl, $0100
  push hl
  call Call_000_04f3
  add sp, $02
  pop bc
  push bc
  inc sp
  call InvokeBankedOSRoutine
  inc sp
  ld a, [$c008]
  or a
  jr z, .backupPendingSave

  ld a, $01
  push af
  inc sp
  call CheckSaveRAMMarker
  inc sp

.backupPendingSave:
  ld hl, OSSaveBackupPending
  ld a, [hl]
  or a
  jr z, .checkSystemWordLimit

  ld [hl], $00
  call Bank1Function6334
  ld a, e
  or a
  jr nz, .returnStatus

.checkSystemWordLimit:
  ld de, $c00b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld de, $c011
  ld a, [de]
  ld hl, sp+$05
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  ld a, b
  sub [hl]
  inc hl
  ld a, c
  sbc [hl]
  jr nc, .success

  ld e, $52
  jr .returnStatus

.success:
  ld e, $00

.done:
.returnStatus:
  add sp, $07
  ret


SECTION "System directory setup", ROM0[$0ee1]

EnsureSystemDirectories:
  ; Ensure SAVE, CHEATS and SNAP exist under GBCSYS, accepting already-exists
  ; status $f1. Resolve the system directory cluster into wSystemDirectoryCluster.
  add sp, -$80
  add sp, -$69
  ld hl, sp+$00
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  push bc
  ld hl, GBCSysSaveText
  push hl
  push de
  call Bank1Function55CB
  add sp, $04
  pop bc
  ld a, e
  or a
  jr z, .ensureCheats

  ld a, e
  sub $f1
  jp nz, .done

.ensureCheats:
  ld e, c
  ld d, b
  push bc
  ld hl, GBSysCheatsText
  push hl
  push de
  call Bank1Function55CB
  add sp, $04
  pop bc
  ld a, e
  or a
  jr z, .ensureSnapshots

  ld a, e
  sub $f1
  jp nz, .done

.ensureSnapshots:
  ld e, c
  ld d, b
  push bc
  ld hl, GBSysSnapText
  push hl
  push de
  call Bank1Function55CB
  add sp, $04
  pop bc
  ld a, e
  or a
  jr z, .locateSystemDirectory

  ld a, e
  sub $f1
  jp nz, .done

.locateSystemDirectory:
  ld e, c
  ld d, b
  push bc
  ld a, $01
  push af
  inc sp
  ld hl, wSystemDirectoryCluster
  push hl
  push de
  ld hl, GBSysText
  push hl
  call Bank1Function4106
  add sp, $07
  pop bc
  ld a, e
  or a
  jp nz, .done

  ld hl, $00d4
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, $00e5
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
  ld hl, $00e5
  add hl, sp
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
  ld e, $00

.done:
  add sp, $7f
  add sp, $6a
  ret

GBCSysSaveText::  DB "/GBCSYS/SAVE", 0
GBSysCheatsText:: DB "/GBCSYS/CHEATS", 0
GBSysSnapText::   DB "/GBCSYS/SNAP", 0
GBSysText::       DB "/GBCSYS     ", 0


; Banked status callback

SECTION "Banked status callback", ROM0[$1dfc]

InvokeBankedOSRoutine:
  ; Build a command-2 descriptor with a pointer to the supplied status byte,
  ; then invoke the dispatcher in OS SRAM bank 6.
  add sp, -$07
  ld hl, sp+$00
  ld e, l
  ld d, h
  ld a, $02
  ld [de], a
  ld hl, sp+$00
  ld a, l
  ld d, h
  ld hl, sp+$05
  ld [hl+], a
  ld [hl], d
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld hl, sp+$09
  ld d, l
  ld e, h
  ld a, d
  ld [bc], a
  inc bc
  ld a, e
  ld [bc], a
  ld hl, sp+$06
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld a, $06
  push af
  inc sp
  call OS_CallFarSRAM
  add sp, $03
  add sp, $07
  ret
