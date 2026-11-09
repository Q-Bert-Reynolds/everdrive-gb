; FAT32 mount, caches and little-endian helpers

SECTION "FAT32 mount, caches and little-endian helpers", ROM0[$2efa]

MountFAT32Volume:
  ; Try sector 0 as a FAT boot record, otherwise follow the first MBR partition.
  ; FAT16 is recognized but rejected with $fb. This implementation computes
  ; data start using two FATs and uses cluster 2 as the root directory.
  add sp, -$08
  ld de, wDirectorySectorBuffer
  ld hl, $0001
  push hl
  push de
  ld hl, $0000
  push hl
  ld hl, $0001
  push hl
  call SD_ReadBlocksToRAM
  add sp, $08
  ld hl, wDirectoryCluster
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  ld hl, wDirectoryCacheSector
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  ld hl, wFATCacheSector
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  xor a
  ld hl, wPartitionStartSector
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  ld hl, $0000
  push hl
  ld hl, $0000
  push hl
  call ReadCachedDirectorySector
  add sp, $04
  ld a, e
  or a
  jp nz, .done

  call DetectFATBootRecord
  ld hl, wVolumeFATType
  ld [hl], e
  ld a, [hl]
  or a
  jr nz, .checkFATType

  ld de, wDirectorySectorBuffer+$1c6
  ld hl, wPartitionStartSector
  push hl
  push de
  call Bank1Function4323
  add sp, $04
  ld hl, wPartitionStartSector+$02
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, wPartitionStartSector
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ReadCachedDirectorySector
  add sp, $04
  ld a, e
  or a
  jp nz, .done

  call DetectFATBootRecord
  ld hl, wVolumeFATType
  ld [hl], e
  ld a, [hl]
  or a
  jr nz, .checkFATType

  ld e, $f6
  jp .done


.checkFATType:
  ld hl, wVolumeFATType
  ld a, [hl]
  dec a
  jr nz, .decodeBPB

  ld e, $fb
  jp .done


.decodeBPB:
  ld de, wDirectorySectorBuffer+$24
  ld hl, wFATSectorCount
  push hl
  push de
  call Bank1Function4323
  add sp, $04
  push af
  ld hl, wFATSectorCount
  ld a, [hl]
  ld hl, wFATEntryCapacity
  ld [hl], a
  ld hl, wFATSectorCount+$01
  ld a, [hl]
  ld hl, wFATEntryCapacity+$01
  ld [hl], a
  ld hl, wFATSectorCount+$02
  ld a, [hl]
  ld hl, wFATEntryCapacity+$02
  ld [hl], a
  ld hl, wFATSectorCount+$03
  ld a, [hl]
  ld hl, wFATEntryCapacity+$03
  ld [hl], a
  pop af
  ld a, $07

.computeFATEntryCapacity:
  ld hl, wFATEntryCapacity
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, .computeFATEntryCapacity

  ld de, wDirectorySectorBuffer+$0e
  push de
  call ReadLittleEndianWord
  add sp, $02
  ld hl, wReservedSectorCount
  ld [hl], e
  inc hl
  ld [hl], d
  ld bc, wDirectorySectorBuffer+$0d
  ld a, [bc]
  ld hl, wSectorsPerCluster
  ld [hl], a
  push af
  ld hl, wFATSectorCount
  ld a, [hl]
  ld hl, sp+$02
  ld [hl], a
  ld hl, wFATSectorCount+$01
  ld a, [hl]
  ld hl, sp+$03
  ld [hl], a
  ld hl, wFATSectorCount+$02
  ld a, [hl]
  ld hl, sp+$04
  ld [hl], a
  ld hl, wFATSectorCount+$03
  ld a, [hl]
  ld hl, sp+$05
  ld [hl], a
  pop af
  ld a, $01
  ld hl, sp+$00
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  pop de
  push de
  ld a, e
  ld hl, wPartitionStartSector
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld hl, sp+$03
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, wPartitionStartSector+$02
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld hl, sp+$03
  ld [hl-], a
  ld [hl], e
  ld hl, wReservedSectorCount
  ld a, [hl]
  ld hl, sp+$04
  ld [hl], a
  ld hl, wReservedSectorCount+$01
  ld a, [hl]
  ld hl, sp+$05
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  pop de
  push de
  ld a, e
  ld hl, sp+$04
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld hl, wRootDirectorySector+$01
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$08
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld hl, wRootDirectorySector+$03
  ld [hl-], a
  ld [hl], e
  ld hl, wPartitionStartSector+$01
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp+$04
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld hl, wFATStartSector+$01
  ld [hl-], a
  ld [hl], e
  ld hl, wPartitionStartSector+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$08
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld hl, wFATStartSector+$03
  ld [hl-], a
  ld [hl], e
  ld hl, wRootDirectorySector
  ld d, h
  ld e, l
  ld hl, wDataStartSector
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
  ld hl, wSectorsPerCluster
  ld b, [hl]
  ld hl, wClusterSectorShift
  ld [hl], $00

.countClusterShift:
  ld a, $01
  sub b
  jr nc, .initializeAllocationCursor

  srl b
  ld hl, wClusterSectorShift
  inc [hl]
  jr .countClusterShift

.initializeAllocationCursor:
  ld hl, wAllocationCursor
  ld [hl], $02
  xor a
  inc hl
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  ld e, $00

.done:
  add sp, $08
  ret


LFNCharacterOffsets::
  DB $01, $03, $05, $07, $09, $0e, $10, $12, $14, $16, $18, $1c, $1e

ReadCachedDirectorySector:
  ; Argument: absolute sector LBA (dword). Cache one sector at
  ; wDirectorySectorBuffer, keyed by wDirectoryCacheSector.
  ld hl, sp+$02
  ld a, [hl]
  ld hl, wDirectoryCacheSector
  sub [hl]
  jr nz, .cacheMiss

  ld hl, sp+$03
  ld a, [hl]
  ld hl, wDirectoryCacheSector+$01
  sub [hl]
  jr nz, .cacheMiss

  ld hl, sp+$04
  ld a, [hl]
  ld hl, wDirectoryCacheSector+$02
  sub [hl]
  jr nz, .cacheMiss

  ld hl, sp+$05
  ld a, [hl]
  ld hl, wDirectoryCacheSector+$03
  sub [hl]
  jr nz, .cacheMiss

  ld e, a
  ret

.cacheMiss:
  ld hl, sp+$02
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, wDirectoryCacheSector
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, $0001
  push hl
  ld hl, wDirectorySectorBuffer
  push hl
  push bc
  push de
  call SD_ReadBlocksToRAM
  add sp, $08
  ret


ReadCachedFATSector:
  ; Argument: FAT-relative sector (dword). Add wFATStartSector, then cache
  ; one sector at wFATSectorBuffer.
  add sp, -$04
  ld hl, sp+$06
  ld a, [hl]
  ld hl, wFATCacheSector
  sub [hl]
  jr nz, .cacheMiss

  ld hl, sp+$07
  ld a, [hl]
  ld hl, wFATCacheSector+$01
  sub [hl]
  jr nz, .cacheMiss

  ld hl, sp+$08
  ld a, [hl]
  ld hl, wFATCacheSector+$02
  sub [hl]
  jr nz, .cacheMiss

  ld hl, sp+$09
  ld a, [hl]
  ld hl, wFATCacheSector+$03
  sub [hl]
  jr nz, .cacheMiss

  ld e, a
  jp .done

.cacheMiss:
  ld hl, sp+$06
  ld d, h
  ld e, l
  ld hl, wFATCacheSector
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
  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, wFATStartSector
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld hl, sp+$03
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$0b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, wFATStartSector+$02
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld hl, sp+$03
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
  ld d, h
  ld e, l
  ld hl, sp+$06
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
  ld de, wFATSectorBuffer
  ld hl, $0001
  push hl
  push de
  ld hl, sp+$0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call SD_ReadBlocksToRAM
  add sp, $08

.done:
  add sp, $04
  ret


DetectFATBootRecord:
  ; Compare the three-byte FAT signature at BPB offsets $36 (FAT16) and $52
  ; (FAT32). Returns 0, 1 or 2; this is not a full BPB validity check.
  ld de, wDirectorySectorBuffer+$36
  ld a, $03
  push af
  inc sp
  ld hl, FATSignatureText
  push hl
  push de
  call CompareBytesEqual
  add sp, $05
  ld a, e
  or a
  jr z, .checkFAT32

  ld e, $01
  ret

.checkFAT32:
  ld bc, FATSignatureText
  ld de, wDirectorySectorBuffer+$52
  ld a, $03
  push af
  inc sp
  push bc
  push de
  call CompareBytesEqual
  add sp, $05
  ld a, e
  or a
  jr z, .notFAT

  ld e, $02
  ret

.notFAT:
  ld e, $00
  ret

FATSignatureText:: DB "FAT", 0

ReadLittleEndianWord:
  ; Argument: byte pointer. Returns its little-endian word in DE.
  dec sp
  ld hl, sp+$04
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld a, [bc]
  ld hl, sp+$00
  ld [hl], a
  inc bc
  ld a, [bc]
  ld b, a
  ld d, $00
  ld d, $00
  ld e, [hl]
  ld c, $00
  ld a, e
  or d
  ld e, a
  ld a, c
  or b
  ld d, a
  inc sp
  ret
