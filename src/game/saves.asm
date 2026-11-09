; Resident game save, snapshot and RTC file helpers. CPU addresses $4000-$7fff remain fixed in OS mode.
SECTION "Resident game save, snapshot and RTC file helpers", ROMX[$6340], BANK[1]

BackupGameSaveFiles::
  add sp, -$02
  ld hl, sp + $00
  ld [hl], $01
  inc hl
  ld [hl], $01
  call EnableStreaming
  ld a, [$c035]
  or a
  jr nz, jr_001_634a
  ld hl, sp + $00
  ld [hl], $00

jr_001_634a:
  ld hl, sp + $00
  ld a, [hl]
  or a
  jr z, jr_001_6366

  ld de, $c03b
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  push bc
  call Call_000_04c5
  add sp, $02
  ld a, e
  or a
  jr z, jr_001_6366

  ld hl, sp + $00
  ld [hl], $00

jr_001_6366:
  ld a, [$c003]
  or a
  jr z, @ + 38

  ld hl, $0040
  push hl
  call Cart_SetSectorPointerFromStack
  add sp, $02
  ld de, Bank1Address63DB
  ld a, $04
  push af
  inc sp
  push de
  ld hl, $be00
  push hl
  call CompareBytesEqual
  add sp, $05
  ld a, e
  or a
  jr nz, jr_001_6390

  ld hl, sp + $01
  ld [hl], $00
  jr jr_001_6390
  ld hl, sp + $01
  ld [hl], $00

jr_001_6390:
  ld hl, sp+$00
  ld a, [hl]
  or a
  jr z, jr_001_63b8

  ld de, $c03b
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  ld hl, Bank1Address63ED
  push hl
  ld hl, Bank1Address63E0
  push hl
  push bc
  ld hl, 0
  push hl
  call BackupCartridgeRegionToFile
  add sp, $08
  ld a, e
  or a
  jr nz, jr_001_63d8

jr_001_63b8:
  ld hl, sp + $01
  ld a, [hl]
  or a
  jr z, jr_001_63d6

  ld de, Bank1Address63F1
  ld hl, Bank1Address63FE
  push hl
  push de
  ld hl, $00a4
  push hl
  ld l, $40
  push hl
  call BackupCartridgeRegionToFile
  add sp, $08
  ld a, e
  or a
  jr nz, jr_001_63d8

jr_001_63d6:
  ld e, $00

jr_001_63d8:
  add sp, $02
  ret

Bank1Address63DB::;probably a table
  ld d, e
  ld b, c
  ld d, [hl]
  ld b, l
  nop
Bank1Address63E0::
  cpl
  ld b, a
  ld b, d
  ld b, e
  ld d, e
  ld e, c
  ld d, e
Bank1Address63E7::
  cpl
  ld d, e
  ld b, c
  ld d, [hl]
  ld b, l
  nop

Bank1Address63ED::
  ld [hl], e
  ld [hl], d
  ld l, l
  nop
Bank1Address63F1::
  cpl
  ld b, a
  ld b, d
  ld b, e
  ld d, e
  ld e, c
  ld d, e
  cpl
  ld d, e
  ld c, [hl]
  ld b, c
  ld d, b
  nop
Bank1Address63FE:: DB "sav", 0

BackupCartridgeRegionToFile:
  add sp, -$80
  add sp, -$80
  add sp, -$80
  add sp, -$67
  ld hl, sp + $00
  ld e, l
  ld d, h
  ld c, e
  ld b, d
  push de
  push bc
  ld hl, $01f3 ; stack-frame offset; not an OS state reference
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $c04d
  push hl
  ld hl, $01f5 ; stack-frame offset; not an OS state reference
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call BuildPathWithExtension
  add sp, $08
  pop de
  ld hl, $0100
  add hl, sp
  ld c, l
  ld b, h
  ld hl, $01e5
  add hl, sp
  ld [hl], c
  inc hl
  ld [hl], b
  push bc
  ld hl, $01ed
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $01e9
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call OpenFileByPath
  add sp, $06
  pop bc
  ld a, e
  or a
  jr nz, jr_001_6468

  ld hl, $01e9
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  call WriteCartridgeBufferToFile
  add sp, $04
  ld a, e
  or a
  jr nz, jr_001_6468

  ld e, a

jr_001_6468:
  add sp, $7f
  add sp, $7f
  add sp, $7f
  add sp, $6a
  ret

RestoreGameSaveFiles::
  call EnableStreaming
  ld de, $c03b
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  push bc
  call Call_000_04f3
  add sp, $02
  ld a, [$c003]
  or a
  jr z, jr_001_649e

  ld hl, $0040
  push hl
  call Cart_SetSectorPointerFromStack
  add sp, $02
  ld de,Bank1Address64D5
  ld hl, $be00
  push hl
  push de
  call CopyString
  add sp, $04

jr_001_649e:
  ld a, [$c035]
  or a
  jr z, jr_001_64b8

  ld de, Bank1Address64DA
  ld hl, Bank1Address64E7
  push hl
  push de
  ld hl, $0000
  push hl
  call RestoreFileToCartridgeRegion
  add sp, $06
  ld a, e
  or a
  ret nz

jr_001_64b8:
  ld a, [$c003]
  or a
  jr z, jr_001_64d2

  ld de, Bank1Address64EB
  ld hl, Bank1Address64F8
  push hl
  push de
  ld hl, $0040
  push hl
  call RestoreFileToCartridgeRegion
  add sp, $06
  ld a, e
  or a
  ret nz

jr_001_64d2:
  ld e, $00
  ret

Bank1Address64D5::
  ld c, [hl]
  ld d, l
  ld c, h
  ld c, h
  nop
Bank1Address64DA::
  cpl
  ld b, a
  ld b, d
  ld b, e
  ld d, e
  ld e, c
  ld d, e
Bank1Address64E1::
  cpl
  ld d, e
  ld b, c
  ld d, [hl]
  ld b, l
  nop
Bank1Address64E7::
  ld [hl], e
  ld [hl], d
  ld l, l
  nop
Bank1Address64EB::
  cpl
  ld b, a
  ld b, d
  ld b, e
  ld d, e
  ld e, c
  ld d, e
Bank1Address64F2::
  cpl
  ld d, e
  ld c, [hl]
  ld b, c
  ld d, b
  nop
Bank1Address64F8:: DB "sav", 0

RestoreFileToCartridgeRegion:
  add sp, -$80
  add sp, -$80
  add sp, -$80
  add sp, -$67
  ld hl, sp + $00
  ld e, l
  ld d, h
  ld c, e
  ld b, d
  push de
  push bc
  ld hl, $01f1 ; stack-frame offset; not an OS state reference
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $c04d
  push hl
  ld hl, $01f3 ; stack-frame offset; not an OS state reference
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call BuildPathWithExtension
  add sp, $08
  pop de
  ld hl, $0100
  add hl, sp
  ld c, l
  ld b, h
  ld hl, $01e5
  add hl, sp
  ld [hl], c
  inc hl
  ld [hl], b
  push bc
  ld hl, $0000
  push hl
  ld hl, $01e9
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call OpenFileByPath
  add sp, $06
  pop bc
  ld a, e
  sub $f0
  jr nz, jr_001_654f

  ld e, a
  jr jr_001_6566

jr_001_654f:
  ld a, e
  or a
  jr nz, jr_001_6566

  ld hl, $01e9
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  call ReadFileToCartridgeBuffer
  add sp, $04
  ld a, e
  or a
  jr nz, jr_001_6566

  ld e, a

jr_001_6566:
  add sp, $7f
  add sp, $7f
  add sp, $7f
  add sp, $6a
  ret


WriteCartridgeBufferToFile:
  add sp, -$08
  ld hl, sp+$0c
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$0b
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $00e0
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$02
  ld [hl+], a
  ld [hl], d
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
  push bc
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call BytesToSectors32
  add sp, $04
  pop bc
  push de
  push de
  push bc
  call OpenFileForSectorIO
  add sp, $04
  ld a, e
  pop de
  or a
  jr z, jr_001_65bb

  ld e, a
  jr jr_001_65d3

jr_001_65bb:
  push de
  call EnableStreaming
  pop de
  ld hl, sp+$00
  ld c, l
  ld b, h
  xor a
  push af
  inc sp
  push de
  push bc
  call WriteFileSectors
  add sp, $05
  ld a, e
  or a
  jr nz, jr_001_65d3

  ld e, a

jr_001_65d3:
  add sp, $08
  ret


ReadFileToCartridgeBuffer:
  add sp, -$08
  ld hl, sp+$0c
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$0b
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $00e0
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$06
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$02
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
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call BytesToSectors32
  add sp, $04
  pop bc
  push de
  ld hl, $0000
  push hl
  push bc
  call OpenFileForSectorIO
  add sp, $04
  ld a, e
  pop de
  or a
  jr z, jr_001_6626

  ld e, a
  jr jr_001_663e

jr_001_6626:
  push de
  call EnableStreaming
  pop de
  ld hl, sp+$00
  ld c, l
  ld b, h
  xor a
  push af
  inc sp
  push de
  push bc
  call ReadFileSectors
  add sp, $05
  ld a, e
  or a
  jr nz, jr_001_663e

  ld e, a

jr_001_663e:
  add sp, $08
  ret


BytesToSectors32:
  push af
  ld hl, sp+$04
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld e, [hl]
  pop af
  ld a, $09

jr_001_664e:
  srl e
  rr d
  rr b
  rr c
  dec a
  jr nz, jr_001_664e

  ld hl, sp+$02
  ld a, [hl]
  or a
  jr nz, jr_001_6664

  inc hl
  bit 0, [hl]
  jr z, jr_001_6665

jr_001_6664:
  inc bc

jr_001_6665:
  xor a
  cp c
  ld a, $01
  sbc b
  jr nc, jr_001_666f

  ld bc, $0100

jr_001_666f:
  ld e, c
  ld d, b
  ret


Call_001_6672:
  add sp, -$80
  add sp, -$80
  add sp, -$80
  add sp, -$65
  ld hl, sp + $00
  ld e, l
  ld d, h
  ld c, e
  ld b, d
  push de
  push bc
  ld hl, Bank1Address66BF
  push hl
  ld hl, $c04d
  push hl
  ld hl, Bank1Address66B2
  push hl
  call BuildPathWithExtension
  add sp, $08
  pop de
  ld hl, $0100
  add hl, sp
  ld c, l
  ld b, h
  ld hl, $01e7
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  push de
  call OpenFileByPath
  add sp, $06
  add sp, $7f
  add sp, $7f
  add sp, $7f
  add sp, $68
  ret

Bank1Address66B2::
  cpl
  ld b, a
  ld b, d
  ld b, e
  ld d, e
  ld e, c
  ld d, e
Bank1Address66B9::
  cpl
  ld d, e
  ld b, c
  ld d, [hl]
  ld b, l
  nop
Bank1Address66BF::
  ld [hl], d
  ld [hl], h
  ld h, e
  nop

BackupGameRTCFile::
  ld hl, $fdf4
  add hl, sp
  ld sp, hl
  ld a, [$c002]
  or a
  jr z, jr_001_66d4

  ld a, [$c038]
  or a
  jr nz, jr_001_66d9

jr_001_66d4:
  ld e, $00
  jp Jump_001_6754

jr_001_66d9:
  ld hl, $0200
  add hl, sp
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  push bc
  push de
  call ReadSavedGameRTCShadow
  add sp, $02
  pop bc
  ld e, c
  ld d, b
  push bc
  push de
  call Call_001_5c7a
  add sp, $02
  ld a, e
  pop bc
  or a
  jr z, jr_001_66fc

  ld e, $00
  jp Jump_001_6754


jr_001_66fc:
  ld hl, sp+$00
  ld a, l
  ld d, h
  ld hl, $020a
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  ld hl, $0200
  push hl
  xor a
  push af
  inc sp
  push de
  call FillMemory
  add sp, $05
  pop bc
  ld hl, $020b
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000a
  push hl
  push de
  push bc
  call CopyMemory
  add sp, $06
  ld hl, $0001
  push hl
  call Call_001_6672
  add sp, $02
  ld a, e
  or a
  jr nz, jr_001_6754

  ld hl, $020b
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, $01
  push af
  inc sp
  ld hl, $0001
  push hl
  push de
  call WriteFileSectors
  add sp, $05
  ld a, e
  or a
  jr nz, jr_001_6754

  ld e, a

Jump_001_6754:
jr_001_6754:
  ld c, l
  ld b, h
  ld hl, $020c
  add hl, sp
  ld sp, hl
  ld l, c
  ld h, b
  ret


RestoreGameRTCFile::
  ld hl, $fdfe
  add hl, sp
  ld sp, hl
  ld hl, sp + $00
  ld c, l
  ld b, h
  ld d, c
  ld e, b
  ld hl, $0200
  add hl, sp
  ld [hl], d
  inc hl
  ld [hl], e
  ld a, [$c002]
  or a
  jr z, jr_001_677a

  ld a, [$c038]
  or a
  jr nz, jr_001_677f

jr_001_677a:
  ld e, $00
  jp Jump_001_67b7


jr_001_677f:
  push bc
  call ClearGameRTC
  pop bc
  push bc
  ld hl, $0000
  push hl
  call Call_001_6672
  add sp, $02
  pop bc
  ld a, e
  sub $f0
  jr nz, jr_001_6797

  ld e, a
  jr Jump_001_67b7

jr_001_6797:
  ld a, e
  or a
  jr nz, Jump_001_67b7

  ld a, $01
  push af
  inc sp
  ld hl, $0001
  push hl
  push bc
  call ReadFileSectors
  add sp, $05
  ld a, e
  or a
  jr nz, Jump_001_67b7
  ld hl, $0200
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call ProgramGameRTC
  add sp, $02
  ld e, $00

Jump_001_67b7:
  ld c, l
  ld b, h
  ld hl, $0202
  add hl, sp
  ld sp, hl
  ld l, c
  ld h, b
  ret

RefreshGameRTCBeforeLaunch::
  add sp, -$0a
  ld a, [$c002]
  or a
  jr z, jr_001_67e3

  ld a, [$c038]
  or a
  jr z, jr_001_67e3

  ld hl, sp+$00
  ld e, l
  ld d, h
  ld c, e
  ld b, d
  push de
  push bc
  call ReadSavedGameRTCShadow
  add sp, $02
  pop de
  push de
  call Call_001_629f
  add sp, $02

jr_001_67e3:
  add sp, $0a
  ret
