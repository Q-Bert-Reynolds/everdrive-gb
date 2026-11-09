; Save RAM validation and EEPROM settings

SECTION "Save RAM validation and EEPROM settings", ROM0[$0e6c]

CheckSaveRAMMarker:
  ; Argument: nonzero initializes the 16-byte marker; zero checks it.
  ; Select save RAM sector $ff, test bytes $bfe0-$bfef against 0..15.
  ; Returns $38 on mismatch, except when the game RAM mask is $0f.
  add sp, -$02
  ld hl, sp+$00
  ld [hl], $00
  ld hl, $00ff
  push hl
  call Cart_SetSectorPointerFromStack
  add sp, $02
  call EnableStreaming
  ld hl, sp+$01
  ld [hl], $00

CheckSaveRAMMarker.nextByte:
  ld hl, sp+$01
  ld e, [hl]
  ld d, $00
  ld hl, $bfe0
  add hl, de
  ld c, l
  ld b, h
  ld hl, sp+$04
  ld a, [hl]
  or a
  jr z, CheckSaveRAMMarker.compareByte

  ld hl, sp+$01
  ld a, [hl]
  ld [bc], a

CheckSaveRAMMarker.compareByte:
  ld a, [bc]
  ld d, a
  ld hl, sp+$01
  ld a, [hl]
  sub d
  jr z, CheckSaveRAMMarker.advanceByte

  ld hl, sp+$00
  ld [hl], $38

CheckSaveRAMMarker.advanceByte:
  ld hl, sp+$01
  inc [hl]
  ld a, [hl]
  sub $10
  jr c, CheckSaveRAMMarker.nextByte

  ld a, [wGameRAMMask]
  sub $0f
  jr nz, CheckSaveRAMMarker.done

  dec hl
  ld [hl], $00

CheckSaveRAMMarker.done:
  ld hl, sp+$00
  ld e, [hl]
  add sp, $02
  ret


ReadCartEEPROMSettings:
  ; Read $13 bytes through the I2C helper, using device/address argument $8000.
  ; The caller supplies the destination pointer.
  pop bc
  pop de
  push de
  push bc
  ld hl, $0013
  push hl
  push de
  ld hl, _VRAM
  push hl
  call Bank1Function58BA
  add sp, $06
  ret


WriteCartEEPROMSettings:
  ; Write the same $13-byte cartridge settings record through I2C.
  pop bc
  pop de
  push de
  push bc
  ld hl, $0013
  push hl
  push de
  ld hl, _VRAM
  push hl
  call Bank1Function5941
  add sp, $06
  ret



; Registry defaults and persistence

SECTION "Registry defaults and persistence", ROM0[$0fb5]

ResetRegistryDefaults:
  ; Clear the $010a-byte registry, write signature $1234 and default options,
  ; then persist the defaults through SaveRegistry.
  ld de, wRegistry
  ld hl, REGISTRY_SIZE
  push hl
  xor a
  push af
  inc sp
  push de
  call FillMemory
  add sp, $05
  ld hl, wRegistry
  ld [hl], $34
  inc hl
  ld [hl], $12
  ld hl, $c02d
  ld [hl], $01
  ld bc, wRegistrySwapAB
  xor a
  ld [bc], a
  ld hl, $c030
  ld [hl], $01
  ld bc, $c031
  xor a
  ld [bc], a
  call SaveRegistry
  ld a, e
  or a
  ret nz

  ld e, a
  ret


LoadRegistry:
  ; Load /GBCSYS/REGISTRY.BIN using its packed 8.3 path spelling below.
  ; Validate signature $1234 and the 16-bit additive checksum; E=$35 on failure.
  add sp, -$02
  ld de, GBSysRegistryBinText;$102D
  ld hl, REGISTRY_SIZE
  push hl
  ld hl, wRegistry
  push hl
  push de
  call ReadFileBytes
  add sp, $06
  ld a, e
  or a
  jp nz, LoadRegistry.done

  ld de, wRegistry
  ld hl, $0000
  push hl
  ld hl, REGISTRY_CHECKSUM_SIZE
  push hl
  push de
  call SumBytes16
  add sp, $06
  inc sp
  inc sp
  push de
  ld de, wRegistry
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld a, b
  sub $34
  jr nz, LoadRegistry.invalid

  ld a, c
  sub $12
  jr nz, LoadRegistry.invalid

  ld de, wRegistryChecksum
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp+$00
  ld a, [hl]
  sub b
  jr nz, LoadRegistry.invalid
  inc hl
  ld a, [hl]
  sub c
  jr z, LoadRegistry.applyButtonSwap

LoadRegistry.invalid:
  ld e, $35
  jr LoadRegistry.done

LoadRegistry.applyButtonSwap:
  ld bc, wRegistrySwapAB
  ld a, [bc]
  ld hl, SwapABFlag
  ld [hl], a
  ld e, $00

LoadRegistry.done:
  add sp, $02
  ret

GBSysRegistryBinText:: DB "/GBCSYS/REGISTRYBIN", 0

SaveRegistry:
  ; Update the additive checksum, write the registry file and apply A/B swap.
  add sp, -$80
  add sp, -$65
  ld de, wRegistry
  ld hl, $0000
  push hl
  ld hl, REGISTRY_CHECKSUM_SIZE
  push hl
  push de
  call SumBytes16
  add sp, $06
  ld b, e
  ld c, d
  ld hl, wRegistryChecksum
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$00
  ld c, l
  ld b, h
  ld de, GBSysRegistryBinText2;$1098
  ld hl, $0001
  push hl
  push bc
  push de
  call Bank1Function4067
  add sp, $06
  ld a, e
  or a
  jr nz, SaveRegistry.done

  ld de, wRegistry
  ld a, $01
  push af
  inc sp
  ld hl, $0001
  push hl
  push de
  call Bank1Function49C2
  add sp, $05
  ld a, e
  or a
  jr nz, SaveRegistry.done

  ld bc, wRegistrySwapAB
  ld a, [bc]
  ld hl, SwapABFlag
  ld [hl], a
  ld e, $00

SaveRegistry.done:
  add sp, $7f
  add sp, $66
  ret

GBSysRegistryBinText2:: db "/GBCSYS/REGISTRYBIN", 0

; Filesystem date and time values

SECTION "Filesystem date and time values", ROM0[$1197]

GetFATDate:
  ; Return the stored packed date word at $c00d in DE.
  ld de, $c00d
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld e, b
  ld d, c
  ret


GetFATTime:
  ; Convert the stored two-second count at $c00f into FAT hour/minute/second
  ; bit fields. These getters supply directory-entry timestamps.
  add sp, -$0b
  ld de, $c00f
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  sla b
  rl c
  ld hl, sp + $03
  ld [hl], b
  inc hl
  ld [hl], c
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, $0000
  push hl
  ld hl, $003c
  push hl
  ld hl, sp + $09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6C53
  add sp, $08
  ld c, l
  ld b, h
  push bc
  push de
  ld hl, $0000
  push hl
  ld hl, $003c
  push hl
  push bc
  push de
  call Bank1Function6C53
  add sp, $08
  push hl
  ld hl, sp+$0d
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  pop bc
  push hl
  ld hl, sp+$09
  ld a, [hl]
  ld hl, sp + $03
  ld [hl], a
  pop hl
  ld hl, $0000
  push hl
  ld hl, $003c
  push hl
  push bc
  push de
  call Bank1Function6C4D
  add sp, $08
  ld b, l
  ld c, h
  ld hl, sp + $00
  ld [hl], e
  ld hl, $0000
  push hl
  ld hl, $003c
  push hl
  ld hl, sp + $09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6C4D
  add sp, $08
  ld b, l
  ld c, h
  ld hl, sp + $02
  ld [hl], e
  dec hl
  ld e, [hl]
  ld d, $00
  ld a, e
  swap a
  rrca
  and $f8
  ld e, a
  ld d, $00
  dec hl
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
  ld a, d
  or c
  ld d, a
  ld a, e
  or b
  ld b, a
  inc hl
  inc hl
  ld e, [hl]
  srl e
  ld c, $00
  ld a, d
  or e
  ld e, a
  ld a, b
  or c
  ld d, a
  add sp, $0b
  ret
