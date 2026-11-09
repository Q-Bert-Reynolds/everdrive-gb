; Directory enumeration

SECTION "Directory enumeration", ROM0[$321f]

ReadDirectoryIndex:
  ; Argument: directory cluster (dword); zero selects the root.
  ; Build at most 1000 encoded entry IDs at wDirectoryEntryIDs. Skip deleted,
  ; dot, hidden and volume-label entries; retain a leading LFN ID when present.
  add sp, -$1a
  ld hl, sp + $02
  ld [hl], $00
  ld hl, sp+$19
  ld [hl], $00
  ld hl, wDirectoryEntryCount
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$1c
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, wDirectoryCluster
  ld [hl], c
  inc hl
  ld [hl], b
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld a, d
  or e
  or b
  or c
  jr nz, .resolveCluster

  ld hl, wRootDirectorySector
  ld d, h
  ld e, l
  ld hl, sp + $03
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
  ld hl, sp+$1c
  ld [hl], $02
  xor a
  inc hl
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  xor a
  ld hl, wParentDirectoryCluster
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  jp .beginCluster


.resolveCluster:
  push de
  push bc
  call ClusterToSector
  add sp, $04
  ld b, l
  ld c, h
  ld hl, sp + $03
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ReadCachedDirectorySector
  add sp, $04
  ld a, e
  or a
  jp nz, .done

  ld de, wDirectorySectorBuffer+$34
  push de
  call ReadLittleEndianWord
  add sp, $02
  ld hl, wParentDirectoryCluster
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00
  push af
  pop af
  ld a, $10

.shiftParentClusterHigh:
  ld hl, wParentDirectoryCluster
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, .shiftParentClusterHigh

  ld de, wDirectorySectorBuffer+$3a
  push de
  call ReadLittleEndianWord
  add sp, $02
  ld b, $00
  ld c, $00
  ld hl, wParentDirectoryCluster
  ld a, [hl]
  or e
  ld [hl+], a
  ld a, [hl]
  or d
  ld [hl+], a
  ld a, [hl]
  or b
  ld [hl+], a
  ld a, [hl]
  or c
  ld [hl], a

.beginCluster:
  ld hl, sp + $03
  ld a, [hl]
  ld hl, wRootDirectorySector
  sub [hl]
  jr nz, .notRoot
.compareRootSectorHigh:
  ld hl, sp+$04
  ld a, [hl]
  ld hl, wRootDirectorySector+$01
  sub [hl]
  jr nz, .notRoot

  ld hl, sp+$05
  ld a, [hl]
  ld hl, wRootDirectorySector+$02
  sub [hl]
  jr nz, .notRoot

  ld hl, sp+$06
  ld a, [hl]
  ld hl, wRootDirectorySector+$03
  sub [hl]
  jr nz, .notRoot

  ld a, $01
  jr .storeRootFlag

.notRoot:
  ld a, $00

.storeRootFlag:
  ld hl, wDirectoryIsRoot
  ld [hl], a

.initializeSectorLoop:
  ld hl, sp + $03
  ld d, h
  ld e, l
  ld hl, sp + $0b
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
  ld hl, sp + $01
  ld [hl], $00

.nextSector:
  ld hl, sp + $01
  ld a, [hl]
  ld hl, wSectorsPerCluster
  sub [hl]
  jp nc, .nextCluster

  push af
  ld hl, sp + $0d
  ld a, [hl]
  ld hl, sp + $09
  ld [hl], a
  ld hl, sp + $0e
  ld a, [hl]
  ld hl, sp + $0a
  ld [hl], a
  ld hl, sp + $0f
  ld a, [hl]
  ld hl, sp + $0b
  ld [hl], a
  ld hl, sp + $10
  ld a, [hl]
  ld hl, sp + $0c
  ld [hl], a
  pop af
  ld a, $04

.encodeEntryID:
  ld hl, sp + $07
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, .encodeEntryID

  ld hl, sp + $0d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $0d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ReadCachedDirectorySector
  add sp, $04
  ld a, e
  or a
  jp nz, .done
  ld hl, sp + $17
  ld [hl], $f3
  inc hl
  ld [hl], $c2
  ld hl, sp + $00
  ld [hl], $00

.nextEntry:
  ld hl, sp + $18
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  dec hl
  dec hl
  ld [hl], a
  ld a, [hl]
  or a
  jr nz, .checkDeletedEntry

  ld e, a
  jp .done


.checkDeletedEntry:
  ld hl, sp + $16
  ld a, [hl]
  sub $e5
  jr z, .discardLFN
  ld hl, sp + $16
  ld a, [hl]
  sub $2e
  jr nz, .inspectAttributes

.discardLFN:
  ld hl, sp + $02
  ld [hl], $00
  jp .advanceEntry


.inspectAttributes:
  ld hl, sp + $18
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000b
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld hl, sp + $11
  ld [hl], a
  ld hl, wDirectoryEntryCount+$01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  sla c
  rl b
  sla c
  rl b
  ld hl, sp + $00
  ld a, [hl]
  ld hl, sp + $12
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, wDirectoryEntryIDs
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp + $12
  ld a, [hl]
  ld hl, sp + $07
  or [hl]
  ld hl, sp + $12
  ld [hl+], a
  ld a, [hl]
  ld hl, sp + $08
  or [hl]
  ld hl, sp + $13
  ld [hl+], a
  ld a, [hl]
  ld hl, sp + $09
  or [hl]
  ld hl, sp + $14
  ld [hl+], a
  ld a, [hl]
  ld hl, sp + $0a
  or [hl]
  ld hl, sp+$15
  ld [hl], a
  ld hl, sp + $11
  ld a, [hl]
  sub $0f
  jp nz, .shortEntry
  ld hl, sp + $18
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0001
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $0f
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$19
  ld [hl], a
  ld hl, sp + $16
  ld a, [hl]
  and $f0
  sub $40
  jp nz, .advanceEntry
  ld hl, sp + $02
  ld [hl], $01
  ld hl, sp + $12
  ld a, [hl]
  ld [bc], a
  inc bc
  inc hl
  ld a, [hl]
  ld [bc], a
  inc bc
  inc hl
  ld a, [hl]
  ld [bc], a
  inc bc
  inc hl
  ld a, [hl]
  ld [bc], a
  jp .advanceEntry


.shortEntry:
  ld hl, sp+$19
  ld a, [hl]
  sub $2e
  jr nz, .checkHiddenOrVolume

  ld hl, sp + $02
  ld a, [hl]
  or a
  jr nz, .discardEntry

.checkHiddenOrVolume:
  ld hl, sp + $11
  ld a, [hl]
  and $0a
  jr z, .storeEntryID

.discardEntry:
  ld hl, sp + $02
  ld [hl], $00
  jp .advanceEntry


.storeEntryID:
  ld hl, sp + $02
  ld a, [hl]
  or a
  jr nz, .incrementEntryCount
  ld hl, sp + $12
  ld a, [hl]

.copyEntryID:
  ld [bc], a
  inc bc
  inc hl
  ld a, [hl]
  ld [bc], a
  inc bc
  inc hl
  ld a, [hl]
  ld [bc], a
  inc bc
  inc hl
  ld a, [hl]
  ld [bc], a

.incrementEntryCount:
  ld hl, wDirectoryEntryCount
  inc [hl]
  jr nz, .checkEntryLimit

  inc hl
  inc [hl]

.checkEntryLimit:
  ld hl, sp + $02
  ld [hl], $00
  ld hl, wDirectoryEntryCount
  ld a, [hl]
  sub $e8
  jr nz, .skipEntry

  inc hl
  ld a, [hl]
  sub $03
  jr nz, .skipEntry

  ld e, a
  jp .done


.advanceEntry:
.skipEntry:
  ld hl, sp + $00
  inc [hl]
  ld hl, sp + $18
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0020
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $17
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $00
  ld a, [hl]
  sub $10
  jp c, .nextEntry
  ld hl, sp + $0b
  inc [hl]
  jr nz, .advanceSector

  inc hl
  inc [hl]
  jr nz, .advanceSector

  inc hl
  inc [hl]
  jr nz, .advanceSector

  inc hl
  inc [hl]

.advanceSector:
  ld hl, sp + $01
  inc [hl]
  jp .nextSector


.nextCluster:
  ld hl, sp+$1c
  ld e, l
  ld d, h
  push de
  call AdvanceFATCluster
  add sp, $02
  ld a, e
  or a
  jr nz, .returnStatus

  ld hl, sp+$1e
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$1e
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ClusterToSector
  add sp, $04
  ld b, l
  ld c, h
  ld hl, sp + $03
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  jp .initializeSectorLoop


.done:
.returnStatus:
  add sp, $1a
  ret



; Directory entry and long filename decoding

SECTION "Directory entry and long filename decoding", ROM0[$36a4]

ReadDirectoryEntry:
  ; Arguments: encoded entry ID (dword), destination pointer. Decode an
  ; expanded $e5-byte directory entry. LFN decoding copies the low byte of
  ; each UTF-16 character, using LFNCharacterOffsets; it is not full Unicode.
  ; ID format: (absolute sector << 4) | 32-byte entry index within sector.
  add sp, -$23
  ld hl, sp+$29
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $1c
  ld [hl+], a
  ld [hl], e
  dec hl
  ld d, [hl]
  inc hl
  ld e, [hl]
  ld hl, sp + $05
  ld [hl], d
  inc hl
  ld [hl], e
  ld hl, sp+$25
  ld a, [hl]
  and $0f
  ld d, a
  ld e, $00
  ld b, $00
  ld c, $00
  ld hl, sp + $19
  ld [hl], d
  push af
  ld hl, sp+$27
  ld a, [hl]
  ld hl, sp + $03
  ld [hl], a
  ld hl, sp+$28
  ld a, [hl]
  ld hl, sp + $04
  ld [hl], a
  ld hl, sp+$29
  ld a, [hl]
  ld hl, sp + $05
  ld [hl], a
  ld hl, sp+$2a
  ld a, [hl]
  ld hl, sp + $06
  ld [hl], a
  pop af
  ld a, $04

.decodeSectorID:
  ld hl, sp + $04
  srl [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec a
  jr nz, .decodeSectorID

  inc hl
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $03
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call SectorToCluster
  add sp, $04
  ld b, l
  ld c, h
  ld hl, sp + $08
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp + $03
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $03
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call SectorOffsetInCluster
  add sp, $04
  ld hl, sp + $00
  ld [hl], e
  ld hl, sp + $19
  ld c, [hl]
  ld b, $00
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  sla c
  rl b
  ld hl, wDirectorySectorBuffer
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp + $1f
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp + $05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00
  ld hl, sp + $06
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00d0
  add hl, de
  ld c, l
  ld b, h
  xor a
  ld [bc], a
  ld hl, sp + $1d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00d4
  add hl, de
  ld c, l
  ld b, h
  ld hl, sp+$25
  ld a, [hl]
  ld [bc], a
  inc bc
  inc hl
  ld a, [hl]
  ld [bc], a
  inc bc
  inc hl
  ld a, [hl]
  ld [bc], a
  inc bc
  inc hl
  ld a, [hl]
  ld [bc], a

.readSector:
  ld hl, sp + $03
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $03
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ReadCachedDirectorySector
  add sp, $04
  ld a, e
  or a
  jr z, .prepareEntries

  ld e, a
  jp .done


.prepareEntries:
  ld hl, sp + $1f
  ld a, [hl+]
  ld e, [hl]
  inc hl
  ld [hl+], a
  ld [hl], e
  push hl
  ld hl, sp + $1b
  ld a, [hl]
  ld hl, sp + $20
  ld [hl], a
  pop hl

.nextLFNEntry:
  ld hl, sp + $1e
  ld a, [hl]
  sub $10
  jp nc, .locateShortEntry
  ld hl, sp + $22
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000b
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  sub $0f
  jp nz, .locateShortEntry
  ld hl, sp + $22
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp + $0e
  ld [hl], a
  ld c, [hl]
  ld b, $00
  dec bc
  ld a, c
  and $0f
  ld c, a
  ld b, $00
  ld l, c
  ld h, b
  add hl, hl
  add hl, bc
  add hl, hl
  add hl, hl
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp + $05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp + $0c
  ld [hl], c
  inc hl
  ld [hl], b
  inc hl
  ld a, [hl]
  and $40
  sub $40
  jr nz, .prepareLFNCharacters
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000d
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $17
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00

.prepareLFNCharacters:
  ld hl, sp + $17
  ld [hl], LOW(LFNCharacterOffsets)
  inc hl
  ld [hl], HIGH(LFNCharacterOffsets)
  ld hl, sp + $0d
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp + $07
  ld [hl], $00

.nextLFNCharacter:
  ld hl, sp + $18
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp + $0e
  ld [hl], a
  ld hl, sp + $17
  inc [hl]
  jr nz, .copyLFNCharacter

  inc hl
  inc [hl]

.copyLFNCharacter:
  ld hl, sp + $22
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $0e
  ld l, [hl]
  ld h, $00
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $1a
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld [bc], a
  inc bc
  ld hl, sp + $07
  inc [hl]
  ld a, [hl]
  sub $0d
  jp c, .nextLFNCharacter
  ld hl, sp + $22
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0020
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $21
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $1e
  inc [hl]
  jp .nextLFNEntry


.locateShortEntry:
  ld hl, sp + $21
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $1a
  ld [hl+], a
  ld [hl], e
  push hl
  ld hl, sp + $20
  ld a, [hl]
  ld hl, sp + $1b
  ld [hl], a
  pop hl
  ld hl, sp + $1e
  ld a, [hl]
  sub $10
  jp nz, .decodeShortEntry
  ld hl, sp + $19
  ld [hl], $00
  ld hl, sp + $1f
  ld [hl], $f3
  inc hl
  ld [hl], $c2
  ld hl, sp + $00
  inc [hl]
  inc hl
  inc [hl]
  jr nz, .checkClusterBoundary

  inc hl
  inc [hl]
  jr nz, .checkClusterBoundary

  inc hl
  inc [hl]
  jr nz, .checkClusterBoundary

  inc hl
  inc [hl]

.checkClusterBoundary:
  ld hl, sp + $00
  ld a, [hl]
  ld hl, wSectorsPerCluster
  sub [hl]
  jp nz, .readSector
  ld hl, sp + $08
  ld e, l
  ld d, h
  push de
  call AdvanceFATCluster
  add sp, $02
  ld a, e
  or a
  jp nz, .done
  ld hl, sp + $0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ClusterToSector
  add sp, $04
  ld b, l
  ld c, h
  ld hl, sp + $01
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp + $00
  ld [hl], $00
  jp .readSector


.decodeShortEntry:
  ld hl, sp + $06
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  or a
  jp nz, .decodeAttributes
  inc hl
  ld [hl], $00

.copyShortName:
  ld hl, sp + $06
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld l, [hl]
  ld h, $00
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $17
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $1b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $07
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld b, a
  ld hl, sp + $17
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp + $07
  inc [hl]
  ld a, [hl]
  sub $0b
  jp c, .copyShortName
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  xor a
  ld [bc], a

.decodeAttributes:
  ld hl, sp + $1d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00d8
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $17
  ld [hl+], a
  ld [hl], d
  push af
  ld hl, sp + $03
  ld a, [hl]
  ld hl, sp + $11
  ld [hl], a
  ld hl, sp + $04
  ld a, [hl]
  ld hl, sp + $12
  ld [hl], a
  ld hl, sp + $05
  ld a, [hl]
  ld hl, sp + $13
  ld [hl], a
  ld hl, sp+$06
  ld a, [hl]
  ld hl, sp + $14
  ld [hl], a
  pop af
  ld a, $04

.encodeShortEntryID:
  ld hl, sp + $0f
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, .encodeShortEntryID

  ld hl, sp + $19
  ld d, [hl]
  ld e, $00
  ld bc, $0000
  ld hl, sp + $0f
  ld a, [hl]
  or d
  ld [hl+], a
  ld a, [hl]
  or e
  ld [hl+], a
  ld a, [hl]
  or c
  ld [hl+], a
  ld a, [hl]
  or b
  ld [hl], a
  ld hl, sp + $18
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $0f
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
  ld hl, sp + $1d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00e4
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $0f
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $1b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000b
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  and $10
  ld b, a
  ld hl, sp + $0f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp + $1d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00dc
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $0f
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $1b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0014
  add hl, de
  ld c, l
  ld b, h
  push bc
  call ReadLittleEndianWord
  add sp, $02
  ld hl, sp + $13
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp + $10
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $13
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
  push af
  pop af
  ld a, $10

.shiftClusterHigh:
  ld hl, sp + $13
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, .shiftClusterHigh

  ld hl, sp + $10
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $13
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
  ld hl, sp + $1b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $001a
  add hl, de
  ld c, l
  ld b, h
  push bc
  call ReadLittleEndianWord
  add sp, $02
  ld b, $00
  ld c, $00
  ld hl, sp + $13
  ld a, [hl]
  or e
  ld [hl+], a
  ld a, [hl]
  or d
  ld [hl+], a
  ld a, [hl]
  or b
  ld [hl+], a
  ld a, [hl]
  or c
  ld [hl], a
  ld hl, sp + $10
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $13
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
  ld hl, sp + $1d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00e0
  add hl, de
  ld c, l
  ld b, h
  ld hl, sp + $1b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $001c
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $13
  ld [hl+], a
  ld [hl], d
  push bc
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ReadLittleEndianDWord
  add sp, $04
  ld e, $00

.done:
  add sp, $23
  ret
