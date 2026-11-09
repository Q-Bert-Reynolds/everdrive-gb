SECTION "Read a byte count through a sector buffer", ROM0[$10ca]

ReadFileBytes:
  ; Arguments: path pointer, destination pointer, byte count. Open the file
  ; using the bank 1 path helper; read sectors through a 512-byte stack buffer
  ; and copy only the requested bytes from the final sector.
  ld hl, $fd17
  add hl, sp
  ld sp, hl
  ld hl, $02ee
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0202
  add hl, sp
  ld e, l
  ld d, h
  push bc
  ld hl, $0000
  push hl
  push de
  ld hl, $02f1
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call OpenFileByPath
  add sp, $06
  pop bc
  ld a, e
  or a
  jp nz, .done

  ld hl, $02e7
  add hl, sp
  ld [hl], c
  inc hl
  ld [hl], b

.nextSector:
  ld hl, $02f0
  add hl, sp
  ld a, [hl-]
  or [hl]
  jp z, .success

  ld hl, $0200
  add hl, sp
  ld [hl], $00
  inc hl
  ld [hl], $02
  ld hl, $02ef
  add hl, sp
  ld a, [hl]
  sub $00
  inc hl
  ld a, [hl]
  sbc $02
  jr nc, .copyChunk

  ld hl, $02ef
  add hl, sp
  ld a, [hl+]
  ld e, [hl]
  ld hl, $0200
  add hl, sp
  ld [hl+], a
  ld [hl], e

.copyChunk:
  ld hl, $02f0
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0200
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld a, e
  sub l
  ld e, a
  ld a, d
  sbc h
  ld hl, $02f0
  add hl, sp
  ld [hl-], a
  ld [hl], e
  ld hl, sp + $00
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  push bc
  ld a, $01
  push af
  inc sp
  ld hl, $0001
  push hl
  push de
  call ReadFileSectors
  add sp, $05
  pop bc
  ld a, e
  or a
  jp nz, .done

  ld hl, $02e8
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0200
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  push bc
  call CopyMemory
  add sp, $06
  ld hl, $02e8
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0200
  add hl, de
  ld a, l
  ld d, h
  ld hl, $02e7
  add hl, sp
  ld [hl+], a
  ld [hl], d
  jp .nextSector

.success:
  ld e, $00

.done:
  ld c, l
  ld b, h
  ld hl, $02e9
  add hl, sp
  ld sp, hl
  ld l, c
  ld h, b
  ret


SECTION "Open, seek and transfer file sectors", ROM0[$3a77]

OpenFileForSectorIO:
  ; Arguments: expanded file entry pointer, minimum sector count. Directories
  ; return $f5. Initialize the single file cursor, rounding byte size up to
  ; sectors; a nonzero minimum invokes the bank 1 extension helper as needed
  ; and sets the write-mode flag, which ReadFileSectors rejects.
  add sp, -$08
  ld hl, sp+$0a
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $00
  ld [hl+], a
  ld [hl], e
  pop de
  push de
  ld hl, DIRECTORY_ENTRY_IS_DIRECTORY
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld c, a
  or a
  jr z, .readFileSize

  ld e, $f5
  jp .done


.readFileSize:
  pop de
  push de
  ld hl, DIRECTORY_ENTRY_FILE_SIZE
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $06
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp + $02
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
  ld de, wFileByteSize
  ld hl, sp + $02
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
  ld hl, sp + $04
  ld b, [hl]
  inc hl
  ld c, [hl]
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  pop af
  ld a, $09

.countWholeSectors:
  srl d
  rr e
  rr c
  rr b
  dec a
  jr nz, .countWholeSectors

  ld hl, wFileSectorsRemaining
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp + $02
  ld a, [hl]
  or a
  jr nz, .roundUpSectors

  inc hl
  bit 0, [hl]
  jr z, .checkMinimumSize

.roundUpSectors:
  ld de, wFileSectorsRemaining
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  inc bc
  ld hl, wFileSectorsRemaining
  ld [hl], c
  inc hl
  ld [hl], b

.checkMinimumSize:
  ld de, wFileSectorsRemaining
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp+$0c
  ld a, b
  sub [hl]
  inc hl
  ld a, c
  sbc [hl]
  jp nc, .initializeFileCursor

  ld hl, sp+$0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  pop bc
  pop hl
  push hl
  push bc
  push hl
  call ExtendFileAllocation
  add sp, $04
  ld a, e
  or a
  jp nz, .done
  pop de
  push de
  ld hl, DIRECTORY_ENTRY_ID
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, sp + $02
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
  pop hl
  push hl
  push hl
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ReadDirectoryEntry
  add sp, $06
  ld a, e
  or a
  jp nz, .done

.initializeFileCursor:
  pop de
  push de
  ld hl, DIRECTORY_ENTRY_CLUSTER
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, sp + $02
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
  ld de, wFileCluster
  ld hl, sp + $02
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
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ClusterToSector
  add sp, $04
  push hl
  ld hl, sp + $04
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld de, wFileSector
  ld hl, sp + $02
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
  ld bc, wFileSectorInCluster
  xor a
  ld [bc], a
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp + $02
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
  ld de, wFileByteSize
  ld hl, sp + $02
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
  ld bc, wFileWriteMode
  ld hl, sp+$0d
  ld a, [hl-]
  or [hl]
  jr z, .readOnly

  ld a, $01
  jr .storeAccessMode

.readOnly:
  ld a, $00

.storeAccessMode:
  ld [bc], a
  ld de, wFileByteSize
  ld a, [de]
  ld hl, sp + $02
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
  push af
  ld hl, sp + $04
  ld b, [hl]
  inc hl
  ld c, [hl]
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  pop af
  ld a, $09

.countTransferSectors:
  srl d
  rr e
  rr c
  rr b
  dec a
  jr nz, .countTransferSectors

  ld hl, wFileSectorsRemaining
  ld [hl], b
  inc hl
  ld [hl], c
  ld de, wFileByteSize
  ld a, [de]
  ld hl, sp + $02
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
  ld hl, sp + $02
  ld a, [hl]
  or a
  jr nz, .roundUpTransferSectors

  inc hl
  bit 0, [hl]
  jr z, .success

.roundUpTransferSectors:
  ld de, wFileSectorsRemaining
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  inc bc
  ld hl, wFileSectorsRemaining
  ld [hl], c
  inc hl
  ld [hl], b

.success:
  ld e, $00

.done:
  add sp, $08
  ret


SkipFileSectors:
  ; Argument: sector count (word). Advance the active cursor, walking FAT
  ; chains at cluster boundaries; $f3 means the request exceeds the remainder.
  add sp, -$04
  ld de, wFileSectorsRemaining
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  ld hl, sp+$06
  ld a, c
  sub [hl]
  inc hl
  ld a, b
  sbc [hl]
  jr nc, .updateRemaining

  ld e, $f3
  jp .done

.updateRemaining:
  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, c
  sub e
  ld e, a
  ld a, b
  sbc d
  ld b, a
  ld c, e
  ld hl, wFileSectorsRemaining
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$07
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

.nextSector:
  ld a, b
  or c
  jp z, .success

  ld de, wFileSector
  ld a, [de]
  ld hl, sp+$00
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
  ld hl, sp+$00
  inc [hl]
  jr nz, .storeSector

  inc hl
  inc [hl]
  jr nz, .storeSector

  inc hl
  inc [hl]
  jr nz, .storeSector

  inc hl
  inc [hl]

.storeSector:
  ld de, wFileSector
  ld hl, sp+$00
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
  ld a, [wFileSectorInCluster]
  inc a
  ld hl, sp+$00
  ld [hl], a
  ld de, wFileSectorInCluster
  ld a, [hl]
  ld [de], a
  dec bc
  ld hl, wSectorsPerCluster
  ld a, [hl]
  ld hl, sp+$00
  sub [hl]
  jp nz, .nextSector

  ld hl, wFileSectorInCluster
  ld [hl], $00
  ld de, wFileCluster
  push bc
  push de
  call AdvanceFATCluster
  add sp, $02
  pop bc
  ld a, e
  or a
  jp nz, .done

  ld de, wFileCluster
  ld a, [de]
  ld hl, sp+$00
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
  push bc
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ClusterToSector
  add sp, $04
  push hl
  ld hl, sp+$04
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  pop bc
  ld de, wFileSector
  ld hl, sp+$00
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
  jp .nextSector

.success:
  ld e, $00

.done:
  add sp, $04
  ret


ReadFileSectors:
  ; Arguments: destination pointer, sector count (word), destination mode (byte).
  ; Mode 1 reads into ordinary RAM. Mode 0 reads into cartridge buffer windows;
  ; destination then points to a sector index, advanced after each chunk.
  ; Split reads at cluster boundaries. E=$f7 for a file opened in write mode,
  ; $f3 for a request beyond the remaining sectors. This routine never writes SD.
  add sp, -$12
  ld bc, wFileWriteMode
  ld a, [bc]
  ld hl, sp + $09
  ld [hl], a
  ld a, [hl]
  or a
  jr z, .checkRemaining

  ld e, $f7
  jp .done


.checkRemaining:
  ld de, wFileSectorsRemaining
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp+$16
  ld a, b
  sub [hl]
  inc hl
  ld a, c
  sbc [hl]
  jr nc, .subtractRemaining

  ld e, $f3
  jp .done

.subtractRemaining:
  ld e, b
  ld d, c
  ld hl, sp+$16
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld a, e
  sub l
  ld e, a
  ld a, d
  sbc h
  ld c, a
  ld b, e
  ld hl, wFileSectorsRemaining
  ld [hl], b
  inc hl
  ld [hl], c

.nextChunk:
  ld hl, sp+$17
  ld a, [hl-]
  or [hl]
  jp z, .success

  ld de, wFileSectorInCluster
  ld a, [de]
  ld c, a
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $10
  ld [hl+], a
  ld [hl], e
  ld a, c
  or a
  jr nz, .partialCluster

  ld hl, wSectorsPerCluster
  ld b, [hl]
  ld c, $00
  ld hl, sp+$16
  ld a, b
  sub [hl]
  inc hl
  ld a, c
  sbc [hl]
  jr c, .storeChunkSize

  ld hl, sp + $10
  ld b, [hl]
  inc hl
  ld c, [hl]

.storeChunkSize:
  ld hl, sp + $00
  ld [hl], b
  inc hl
  ld [hl], c
  jp .transferChunk

.partialCluster:
  ld hl, wSectorsPerCluster
  ld a, [hl]
  ld hl, sp + $0a
  ld [hl+], a
  ld [hl], $00
  ld b, $00
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  sub c
  ld e, a
  ld a, d
  sbc b
  ld b, a
  ld c, e
  inc sp
  inc sp
  push bc
  ld hl, sp+$16
  ld d, h
  ld e, l
  ld hl, sp + $00
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jr nc, .transferChunk

  ld hl, sp + $10
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $00
  ld [hl+], a
  ld [hl], e

.transferChunk:
  ld hl, sp+$14
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $0a
  ld [hl+], a
  ld [hl], e
  ld de, wFileSector
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
  ld hl, sp+$18
  ld a, [hl]
  or a
  jp nz, .readToRAM
  pop hl
  push hl
  push hl
  ld hl, sp + $0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call SD_ReadBlocksToCartridge
  add sp, $08
  ld hl, sp + $10
  ld [hl], e
  ld hl, sp+$14
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $07
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  pop hl
  push hl
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp + $07
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], c
  inc hl
  ld [hl], b
  jp .checkTransferStatus

.readToRAM:
  pop hl
  push hl
  push hl
  ld hl, sp + $0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call SD_ReadBlocksToRAM
  add sp, $08
  ld hl, sp + $10
  ld [hl], e
  ld hl, sp + $00
  ld b, [hl]
  ld a, [hl]
  add a
  ld b, a
  ld c, $00
  ld hl, sp+$14
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$14
  ld [hl+], a
  ld [hl], d

.checkTransferStatus:
  ld hl, sp + $10
  ld a, [hl]
  or a
  jr z, .advanceCursor

  ld e, [hl]
  jp .done

.advanceCursor:
  ld de, wFileSectorInCluster
  ld a, [de]
  ld b, a
  ld hl, sp + $00
  ld d, [hl]
  ld a, b
  add d
.storeClusterOffset::;probably not a jump
  ld b, a
  ld hl, wFileSectorInCluster
  ld [hl], b
  ld hl, sp+$17
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  pop hl
  push hl
  ld a, e
  sub l
  ld e, a
  ld a, d
  sbc h
  ld hl, sp+$17
  ld [hl-], a
  ld [hl], e
  ld hl, wSectorsPerCluster
  ld a, [hl]
  sub b
  jp nz, .advanceSector

  ld hl, wFileSectorInCluster
  ld [hl], $00
  ld de, wFileCluster
  push de
  call AdvanceFATCluster
  add sp, $02
  ld hl, sp + $02
  ld [hl], e
  ld a, [hl]
  or a
  jr z, .resolveNextCluster

  ld e, [hl]
  jp .done

.resolveNextCluster:
  ld de, wFileCluster
  ld a, [de]
  ld hl, sp + $0c
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $0e
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ClusterToSector
  add sp, $04
  push hl
  ld hl, sp + $0e
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld de, wFileSector
  ld hl, sp + $0c
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
  ld hl, sp + $02
  ld a, [hl]
  or a
  jp z, .nextChunk

  ld e, [hl]
  jp .done

.advanceSector:
  ld de, wFileSector
  ld a, [de]
  ld hl, sp + $0c
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
  ld hl, sp + $00
  ld a, [hl]
  ld hl, sp + $03
  ld [hl-], a
  dec hl
  ld a, [hl]
  ld hl, sp + $04
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp + $0d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp + $03
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld [hl-], a
  ld [hl], e
  ld hl, sp + $11
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $07
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld [hl-], a
  ld [hl], e
  ld de, wFileSector
  dec hl
  dec hl
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
  jp .nextChunk

.success:
  ld e, $00

.done:
  add sp, $12
  ret
