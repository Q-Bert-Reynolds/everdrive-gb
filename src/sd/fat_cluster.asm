; Cluster/sector arithmetic and FAT traversal

SECTION "Cluster/sector arithmetic and FAT traversal", ROM0[$34df]

ClusterToSector:
  ; Return ((cluster - 2) << wClusterSectorShift) + wDataStartSector.
  ; DE is the low word; HL is the high word.
  ld hl, sp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  sub $02
  ld e, a
  ld a, d
  sbc $00
  push af
  ld hl, wClusterToSectorTemp+$01
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  pop af
  ld a, e
  sbc $00
  ld e, a
  ld a, d
  sbc $00
  ld hl, wClusterToSectorTemp+$03
  ld [hl-], a
  ld [hl], e
  ld hl, wClusterSectorShift
  ld a, [hl]
  or a
  jr z, .addDataStart

  ld a, [hl]
  push af
  pop af
  inc a
  jr .nextShift

.shiftCluster:
  ld hl, wClusterToSectorTemp
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]

.nextShift:
  dec a
  jr nz, .shiftCluster

.addDataStart:
  ld hl, wClusterToSectorTemp+$01
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, wDataStartSector
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld hl, wClusterToSectorTemp+$01
  ld [hl-], a
  ld [hl], e
  ld hl, wClusterToSectorTemp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, wDataStartSector+$02
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld hl, wClusterToSectorTemp+$03
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ret


SectorToCluster:
  ; Inverse of ClusterToSector: ((sector - data start) >> shift) + 2.
  ld hl, sp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, wDataStartSector
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, wSectorToClusterTemp+$01
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, wDataStartSector+$02
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, wSectorToClusterTemp+$03
  ld [hl-], a
  ld [hl], e
  ld hl, wClusterSectorShift
  ld a, [hl]
  or a
  jr z, .addFirstCluster

  ld a, [hl]
  push af
  pop af
  inc a
  jr .nextShift

.shiftSector:
  ld hl, wSectorToClusterTemp+$03
  srl [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]

.nextShift:
  dec a
  jr nz, .shiftSector

.addFirstCluster:
  ld hl, wSectorToClusterTemp+$01
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  add $02
  ld e, a
  ld a, d
  adc $00
  push af
  ld [hl-], a
  ld [hl], e
  ld hl, wSectorToClusterTemp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  pop af
  ld a, e
  adc $00
  ld e, a
  ld a, d
  adc $00
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ret


SectorOffsetInCluster:
  ; Return (sector - data start) & (sectors per cluster - 1).
  ld hl, sp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, wDataStartSector
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$05
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, wDataStartSector+$02
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, sp+$05
  ld [hl-], a
  ld [hl], e
  ld hl, wSectorsPerCluster
  ld b, [hl]
  dec b
  ld e, b
  ld d, $00
  ld b, $00
  ld c, $00
  ld a, e
  ld hl, sp+$02
  and [hl]
  ld e, a
  ld a, d
  inc hl
  and [hl]
  ld d, a
  ld a, b
  inc hl
  and [hl]
  ld b, a
  ld a, c
  inc hl
  and [hl]
  ld c, a
  ret


ReadNextFATCluster:
  ; Arguments: cluster number (dword), destination pointer. Read the FAT32
  ; entry through the FAT cache: 128 entries per sector, four bytes per entry.
  add sp, -$04
  push af
  ld hl, sp+$08
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  pop af
  ld a, $07

.computeFATSector:
  srl b
  rr c
  rr d
  rr e
  dec a
  jr nz, .computeFATSector

  push bc
  push de
  call ReadCachedFATSector
  add sp, $04
  ld a, e
  or a
  jp nz, .done

  ld hl, sp+$06
  ld d, [hl]
  res 7, d
  ld e, $00
  ld bc, $0000
  push af
  ld hl, sp+$02
  ld [hl], d
  inc hl
  ld [hl], e
  inc hl
  ld [hl], c
  inc hl
  ld [hl], b
  pop af
  ld a, $02

.computeEntryOffset:
  ld hl, sp+$00
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, .computeEntryOffset

  ld de, wFATSectorBuffer
  pop hl
  push hl
  add hl, de
  ld c, l
  ld b, h
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  call ReadLittleEndianDWord
  add sp, $04
  ld e, $00

.done:
  add sp, $04
  ret


AdvanceFATCluster:
  ; Argument: pointer to a cluster dword. Replace it with the FAT entry.
  add sp, -$04
  ld hl, sp+$07
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld e, c
  ld d, b
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
  call ReadNextFATCluster
  add sp, $06
  add sp, $04
  ret
