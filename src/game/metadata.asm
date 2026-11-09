; Game header decoding

SECTION "Game header decoding", ROM0[$12b1]

ReadGameMetadata:
  ; Arguments: expanded directory entry pointer and output metadata pointer.
  ; Read the ROM header and derive mapper, ROM/RAM masks, battery, RTC,
  ; SGB/CGB flags and sector counts. See wGameMetadata in constants.asm.
  ; The initial stack table lists cartridge types with battery-backed saves.
  ld hl, $fddc
  add hl, sp
  ld sp, hl
  ld hl, sp + $00
  ld a, l
  ld d, h
  ld hl, $021c
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $03
  ld hl, $021d
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, $06
  ld [bc], a
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $09
  ld [bc], a
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld a, $0d
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld c, l
  ld b, h
  ld a, $0f
  ld [bc], a
  ld hl, $021d
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld c, l
  ld b, h
  ld a, $10
  ld [bc], a
  ld hl, $021d
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld c, l
  ld b, h
  ld a, $13
  ld [bc], a
  ld hl, $021d
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0007
  add hl, de
  ld c, l
  ld b, h
  ld a, $17
  ld [bc], a
  ld hl, $021d
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld c, l
  ld b, h
  ld a, $1b
  ld [bc], a
  ld hl, $021d
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0009
  add hl, de
  ld c, l
  ld b, h
  ld a, $1e
  ld [bc], a
  ld hl, $021d
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000a
  add hl, de
  ld c, l
  ld b, h
  ld a, $ff
  ld [bc], a
  ld hl, $021d
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000b
  add hl, de
  ld c, l
  ld b, h
  xor a
  ld [bc], a
  ld hl, $0000
  push hl
  ld hl, $0228
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call OpenFileForSectorIO
  add sp, $04
  ld c, e
  ld a, c
  or a
  jr z, ReadGameMetadata.readHeader

  ld e, c
  jp ReadGameMetadata.done


ReadGameMetadata.readHeader:
  ld hl, sp + $12
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
  jp nz, ReadGameMetadata.done

  ld hl, $0228
  add hl, sp
  ld a, [hl+]
  ld e, [hl]
  ld hl, $0222
  add hl, sp
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000b
  add hl, de
  ld a, l
  ld d, h
  ld hl, $0220
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, $0216
  add hl, sp
  ld [hl+], a
  ld [hl], e
  ld hl, ROM_HEADER_TITLE
  add hl, bc
  ld a, l
  ld d, h
  ld hl, $0214
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  ld hl, $0010
  push hl
  ld hl, $021a
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call CopyMemory
  add sp, $06
  pop bc
  ld hl, ROM_HEADER_CGB_FLAG
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp + $0c
  ld [hl], c
  inc hl
  ld [hl], b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld a, l
  ld d, h
  ld hl, $0214
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld hl, $0212
  add hl, sp
  ld [hl], $05
  ld a, b
  or a
  jr nz, ReadGameMetadata.checkMBC1

  ld [hl], $04

ReadGameMetadata.checkMBC1:
  ld a, b
  sub $01
  jr c, ReadGameMetadata.checkMBC2

  ld a, $03
  sub b
  jr c, ReadGameMetadata.checkMBC2

  ld hl, $0212
  add hl, sp
  ld [hl], $01

ReadGameMetadata.checkMBC2:
  ld a, b
  sub $05
  jr c, ReadGameMetadata.checkROMWithRAM

  ld a, $06
  sub b
  jr c, ReadGameMetadata.checkROMWithRAM

  ld hl, $0212
  add hl, sp
  ld [hl], $02

ReadGameMetadata.checkROMWithRAM:
  ld a, b
  sub $08
  jr c, ReadGameMetadata.checkMBC3

  ld a, $09
  sub b
  jr c, ReadGameMetadata.checkMBC3

  ld hl, $0212
  add hl, sp
  ld [hl], $04

ReadGameMetadata.checkMBC3:
  ld a, b
  sub $0f
  jr c, ReadGameMetadata.checkMBC5

  ld a, $13
  sub b
  jr c, ReadGameMetadata.checkMBC5

  ld hl, $0212
  add hl, sp
  ld [hl], $03

ReadGameMetadata.checkMBC5:
  ld a, b
  sub $19
  jr c, ReadGameMetadata.storeMapper

  ld a, $1e
  sub b
  jr c, ReadGameMetadata.storeMapper

  ld hl, $0212
  add hl, sp
  ld [hl], $05

ReadGameMetadata.storeMapper:
  ld hl, $0223
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0212
  add hl, sp
  ld a, [hl]
  ld [de], a
  ld hl, $0223
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld a, l
  ld d, h
  ld hl, $0216
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00
  ld a, b
  cp $0f
  jr z, ReadGameMetadata.enableRTC

  sub $10
  jr nz, ReadGameMetadata.decodeRAMSize

ReadGameMetadata.enableRTC:
  ld hl, $0216
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $01

ReadGameMetadata.decodeRAMSize:
  ld hl, $0223
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0002
  add hl, de
  ld a, l
  ld d, h
  ld hl, $0216
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $03
  ld hl, sp + $0d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld a, l
  ld d, h
  ld hl, $021e
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  dec a
  jr nz, ReadGameMetadata.ramCodeNotOne

  ld a, $01
  jr ReadGameMetadata.checkRAMCodeTwo

ReadGameMetadata.ramCodeNotOne:
  xor a

ReadGameMetadata.checkRAMCodeTwo:
  ld d, a
  ld a, b
  sub $02
  jr nz, ReadGameMetadata.ramCodeNotTwo

  ld a, $01
  jr ReadGameMetadata.combineSmallRAMCodes

ReadGameMetadata.ramCodeNotTwo:
  xor a

ReadGameMetadata.combineSmallRAMCodes:
  or d
  jr z, ReadGameMetadata.checkRAMCodeThree

  ld hl, $0216
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00

ReadGameMetadata.checkRAMCodeThree:
  ld hl, $021f
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $03
  jr nz, ReadGameMetadata.checkRAMCodeFour

  ld hl, $0216
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $03

ReadGameMetadata.checkRAMCodeFour:
  ld hl, $021f
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $04
  jr nz, ReadGameMetadata.checkRAMCodeFive

  ld hl, $0216
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $0f

ReadGameMetadata.checkRAMCodeFive:
  ld hl, $021f
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $05
  jr nz, ReadGameMetadata.checkMBC2RAM

  ld hl, $0216
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $07

ReadGameMetadata.checkMBC2RAM:
  ld hl, $0212
  add hl, sp
  ld a, [hl]
  sub $02
  jr nz, ReadGameMetadata.checkLSDJ

  ld hl, $0216
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00

ReadGameMetadata.checkLSDJ:
  ld hl, $0212
  add hl, sp
  ld a, [hl]
  sub $05
  jr nz, ReadGameMetadata.findBatteryType

  ld de, LSDJTitlePrefix
  ld a, $04
  push af
  inc sp
  ld hl, $0221
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call StringEqualsIgnoreCaseN
  add sp, $05
  ld a, e
  or a
  jr z, ReadGameMetadata.findBatteryType

  ld hl, $0216
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $0f

ReadGameMetadata.findBatteryType:
  ld hl, $0223
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0003
  add hl, de
  ld a, l
  ld d, h
  ld hl, $021e
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00
  ld hl, $0213
  add hl, sp
  ld [hl], $00

ReadGameMetadata.nextBatteryType:
  ld hl, $021d
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0213
  add hl, sp
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld b, a
  or a
  jr z, ReadGameMetadata.computeROMMask

  ld hl, $0215
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld c, a
  ld a, b
  sub c
  jr nz, ReadGameMetadata.advanceBatteryType

  ld hl, $021e
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $01
  jr ReadGameMetadata.computeROMMask

ReadGameMetadata.advanceBatteryType:
  ld hl, $0213
  add hl, sp
  inc [hl]
  jp ReadGameMetadata.nextBatteryType


ReadGameMetadata.computeROMMask:
  ld hl, $0223
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0001
  add hl, de
  ld a, l
  ld d, h
  ld hl, $021e
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00
  ld hl, sp + $0e
  ld [hl], $00
  inc hl
  ld [hl], $80
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, $0227
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, DIRECTORY_ENTRY_FILE_SIZE
  add hl, bc
  ld c, l
  ld b, h

ReadGameMetadata.growROMMask:
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, $0218
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
  ld hl, sp + $0e
  ld d, h
  ld e, l
  ld hl, $0218
  add hl, sp
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jp nc, ReadGameMetadata.decodeSGB

  ld hl, $021f
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  add a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld [de], a
  set 0, a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld [de], a
  push af
  pop af
  ld a, $01
  ld hl, sp + $0e
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  jp ReadGameMetadata.growROMMask


ReadGameMetadata.decodeSGB:
  ld hl, $0223
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld a, l
  ld d, h
  ld hl, $0218
  add hl, sp
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $0d
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld a, [bc]
  sub $03
  jr nz, ReadGameMetadata.notSGB

  ld b, $01
  jr ReadGameMetadata.storeSGBFlag

ReadGameMetadata.notSGB:
  ld b, $00

ReadGameMetadata.storeSGBFlag:
  ld hl, $0218
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, $0223
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld a, l
  ld d, h
  ld hl, $0218
  add hl, sp
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $0d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  sub $80
  jr nz, ReadGameMetadata.checkCGBOnly

  ld b, $01
  jr ReadGameMetadata.storeCGBMode

ReadGameMetadata.checkCGBOnly:
  ld a, b
  sub $c0
  jr nz, ReadGameMetadata.notCGB

  ld b, $02
  jr ReadGameMetadata.storeCGBMode

ReadGameMetadata.notCGB:
  ld b, $00

ReadGameMetadata.storeCGBMode:
  ld hl, $0218
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, $021f
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld hl, $0213
  add hl, sp
  ld [hl], $01

ReadGameMetadata.countROMMaskBits:
  ld a, b
  or a
  jr z, ReadGameMetadata.storeROMBankCount

  ld hl, $0213
  add hl, sp
  sla [hl]
  srl b
  jr ReadGameMetadata.countROMMaskBits

ReadGameMetadata.storeROMBankCount:
  ld hl, $0223
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0007
  add hl, de
  ld c, l
  ld b, h
  ld hl, $0213
  add hl, sp
  ld d, [hl]
  ld e, $00
  sla d
  rl e
  sla d
  rl e
  sla d
  rl e
  sla d
  rl e
  sla d
  rl e
  sla d
  rl e
  ld a, d
  ld [bc], a
  inc bc
  ld a, e
  ld [bc], a
  ld hl, $0217
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  inc hl
  ld [hl], $01

ReadGameMetadata.countRAMMaskBits:
  ld a, b
  or a
  jr z, ReadGameMetadata.storeRAMSectorCount

  ld hl, $0218
  add hl, sp
  sla [hl]
  srl b
  jr ReadGameMetadata.countRAMMaskBits

ReadGameMetadata.storeRAMSectorCount:
  ld hl, $0223
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0009
  add hl, de
  ld c, l
  ld b, h
  ld hl, $0218
  add hl, sp
  ld e, [hl]
  ld d, $00
  sla e
  rl d
  sla e
  rl d
  sla e
  rl d
  sla e
  rl d
  ld a, e
  ld [bc], a
  inc bc
  ld a, d
  ld [bc], a
  ld e, $00

ReadGameMetadata.done:
  ld c, l
  ld b, h
  ld hl, $0224
  add hl, sp
  ld sp, hl
  ld l, c
  ld h, b
  ret


LSDJTitlePrefix:: DB "LSDJ", 0
