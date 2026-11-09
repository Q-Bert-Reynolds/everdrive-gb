; Resident I2C and RTC helpers. CPU addresses $4000-$7fff remain fixed in OS mode.
SECTION "Resident I2C and RTC helpers", ROMX[$58c8], BANK[1]

ReadI2CBytes::
  ld hl, sp+$03
  bit 7, [hl]
  jr z, jr_001_58c4

  ld d, $a2
  jr jr_001_58c6

jr_001_58c4:
  ld d, $a0

jr_001_58c6:
  push de
  call I2C_Start
  pop de
  push de
  push de
  inc sp
  call I2C_WriteByte
  inc sp
  ld a, e
  pop de
  or a
  jr z, jr_001_58da

  ld e, $41
  ret


jr_001_58da:
  ld a, d
  sub $a0
  jr nz, jr_001_58f3

  ld hl, sp+$03
  ld b, [hl]
  ld e, $00
  push de
  push bc
  inc sp
  call I2C_WriteByte
  inc sp
  ld a, e
  pop de
  or a
  jr z, jr_001_58f3

  ld e, $41
  ret


jr_001_58f3:
  ld hl, sp+$02
  ld b, [hl]
  ld e, $00
  push de
  push bc
  inc sp
  call I2C_WriteByte
  inc sp
  ld a, e
  pop de
  or a
  jr z, jr_001_5907

  ld e, $41
  ret


jr_001_5907:
  push de
  call I2C_Start
  pop de
  ld a, d
  set 0, a
  push af
  inc sp
  call I2C_WriteByte
  inc sp
  ld a, e
  or a
  jr z, jr_001_591c

  ld e, $41
  ret


jr_001_591c:
  call I2C_Ack
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call I2C_ReadBytes
  add sp, $04
  call I2C_Stop
  ld a, $ff
  push af
  inc sp
  call I2C_WriteByte
  inc sp
  call I2C_ResetBus
  ld e, $00
  ret

WriteI2CBytes::
  add sp, -$05
  ld hl, sp+$09
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $02
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$08
  bit 7, [hl]
  jr z, jr_001_5955

  ld a, $a2
  jr jr_001_5957

jr_001_5955:
  ld a, $a0

jr_001_5957:
  ld hl, sp + $00
  ld [hl], a
  ld a, [hl]
  sub $a0
  jr nz, jr_001_5963

  ld a, $01
  jr jr_001_5964

jr_001_5963:
  xor a

jr_001_5964:
  ld hl, sp+$04
  ld [hl], a
  ld a, [hl]
  or a
  jr z, jr_001_596f

  ld a, $40
  jr jr_001_5971

jr_001_596f:
  ld a, $08

jr_001_5971:
  ld hl, sp + $01
  ld [hl], a

Jump_001_5974:
  ld b, $ff

jr_001_5976:
  ld a, b
  or a
  jr z, jr_001_5996

  push bc
  call I2C_Start
  pop bc
  push bc
  ld hl, sp + $02
  ld a, [hl]
  push af
  inc sp
  call I2C_WriteByte
  inc sp
  ld a, e
  pop bc
  or a
  jr z, jr_001_5996

  push bc
  call I2C_ResetBus
  pop bc
  dec b
  jr jr_001_5976

jr_001_5996:
  ld a, b
  or a
  jr nz, jr_001_599f

  ld e, $42
  jp Jump_001_5a32


jr_001_599f:
  ld hl, sp+$0c
  ld a, [hl-]
  or [hl]
  jp z, Jump_001_5a2d

  ld hl, sp+$04
  ld a, [hl]
  or a
  jr z, jr_001_59c0

  ld hl, sp+$08
  ld d, [hl]
  ld e, $00
  push de
  inc sp
  call I2C_WriteByte
  inc sp
  ld a, e
  or a
  jr z, jr_001_59c0

  ld e, $41
  jp Jump_001_5a32


jr_001_59c0:
  ld hl, sp+$07
  ld d, [hl]
  ld e, $00
  push de
  inc sp
  call I2C_WriteByte
  inc sp
  ld a, e
  or a
  jr z, jr_001_59d4

  ld e, $41
  jp Jump_001_5a32


jr_001_59d4:
  ld hl, sp + $01
  ld c, [hl]
  ld b, $00
  ld hl, sp+$0b
  ld a, [hl]
  sub c
  inc hl
  ld a, [hl]
  sbc b
  jr nc, jr_001_59e8

  ld hl, sp+$0c
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

jr_001_59e8:
  ld b, c
  ld hl, sp + $03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  push bc
  inc sp
  push de
  call I2C_WriteBytes
  add sp, $03
  pop bc
  push bc
  call I2C_ResetBus
  pop bc
  ld hl, sp + $03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld l, b
  ld h, $00
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $02
  ld [hl+], a
  ld [hl], d
  ld c, b
  ld b, $00
  ld hl, sp+$0c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  sub c
  ld e, a
  ld a, d
  sbc b
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$07
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$07
  ld [hl+], a
  ld [hl], d
  jp Jump_001_5974


Jump_001_5a2d:
  call I2C_ResetBus
  ld e, $00

Jump_001_5a32:
  add sp, $05
  ret

CheckAndInitializeRTC::
  add sp, -$12
  ld hl, $bd13
  ld [hl], $06
  ld l, $10
  ld [hl], $00
  ld hl, sp+$00
  ld a, l
  ld d, h
  ld hl, sp+$10
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call ReadRTCClockRegisters
  add sp, $02
  ld hl, sp+$11
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000f
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  rlca
  jp nc, Jump_001_5aae

  ld hl, sp+$11
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0010
  push hl
  xor a
  push af
  inc sp
  push de
  call FillMemory
  add sp, $05
  ld hl, sp+$11
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld c, l
  ld b, h
  ld a, $01
  ld [bc], a
  ld hl, sp+$11
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld a, $01
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld c, l
  ld b, h
  ld a, $01
  ld [bc], a
  ld hl, sp+$11
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call WriteRTCClockRegisters
  add sp, $02
  ld e, $37
  jr jr_001_5ab0

Jump_001_5aae:
  ld e, $00

jr_001_5ab0:
  add sp, $12
  ret

Bank1Address5AB3::
  rra
  inc e
  rra
  ld e, $1f
  ld e, $1f
  rra
  ld e, $1f
  ld e, $1f

ReadRTCClockRegisters:
  call I2C_Start
  ld a, $d0
  push af
  inc sp
  call I2C_WriteByte
  inc sp
  xor a
  push af
  inc sp
  call I2C_WriteByte
  inc sp
  call I2C_Start
  ld a, $d1
  push af
  inc sp
  call I2C_WriteByte
  inc sp
  call I2C_Ack
  pop bc
  pop de
  push de
  push bc
  ld hl, $0010
  push hl
  push de
  call I2C_ReadBytes
  add sp, $04
  call I2C_Stop
  ld a, $ff
  push af
  inc sp
  call I2C_WriteByte
  inc sp
  jp I2C_ResetBus


WriteRTCClockRegisters:
  call I2C_Start
  ld a, $d0
  push af
  inc sp
  call I2C_WriteByte
  inc sp
  xor a
  push af
  inc sp
  call I2C_WriteByte
  inc sp
  pop bc
  pop de
  push de
  push bc
  ld a, $10
  push af
  inc sp
  push de
  call I2C_WriteBytes
  add sp, $03
  jp I2C_ResetBus


WriteMapperRTCRegisters:
  add sp, -$05
  ld hl, $bd13
  ld [hl], $04
  ld l, $10
  ld [hl], $40
  ld l, $11
  ld [hl], $40
  ld hl, sp+$08
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$03
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, $0005
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], d
  dec hl
  dec hl
  ld [hl], $00

Jump_001_5b46:
  ld de, $bd13
  ld hl, sp+$00
  ld a, [hl]
  ld [de], a
  ld hl, sp+$04
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$00
  ld l, [hl]
  ld h, $00
  add hl, bc
  ld c, l
  ld b, h
  ld a, [bc]
  ld de, $bd10
  ld [de], a
  ld hl, sp+$02
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  dec hl
  dec hl
  ld l, [hl]
  ld h, $00
  add hl, bc
  ld c, l
  ld b, h
  ld a, [bc]
  ld de, $bd11
  ld [de], a
  ld hl, sp+$00
  inc [hl]
  ld a, [hl]
  sub $05
  jp c, Jump_001_5b46

  add sp, $05
  ret


ReadSavedGameRTCShadow:
  add sp, -$02
  call EnableStreaming
  ld hl, $00ff
  push hl
  call Cart_SetSectorPointerFromStack
  add sp, $02
  ld hl, sp+$04
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e
  ld de, $bff0
  ld a, [de]
  ld b, a
  pop hl
  push hl
  ld [hl], b
  pop de
  push de
  ld hl, $0005
  add hl, de
  ld c, l
  ld b, h
  ld de, $bff1
  ld a, [de]
  ld [bc], a
  pop bc
  push bc
  inc bc
  ld de, $bff2
  ld a, [de]
  ld [bc], a
  pop de
  push de
  ld hl, $0006
  add hl, de
  ld c, l
  ld b, h
  ld de, $bff3
  ld a, [de]
  ld [bc], a
  pop bc
  push bc
  inc bc
  inc bc
  ld de, $bff4
  ld a, [de]
  ld [bc], a
  pop de
  push de
  ld hl, $0007
  add hl, de
  ld c, l
  ld b, h
  ld de, $bff5
  ld a, [de]
  ld [bc], a
  pop bc
  push bc
  inc bc
  inc bc
  inc bc
  ld de, $bff6
  ld a, [de]
  ld [bc], a
  pop de
  push de
  ld hl, $0008
  add hl, de
  ld c, l
  ld b, h
  ld de, $bff7
  ld a, [de]
  ld [bc], a
  pop de
  push de
  ld hl, $0004
  add hl, de
  ld c, l
  ld b, h
  ld de, $bff8
  ld a, [de]
  ld [bc], a
  pop de
  push de
  ld hl, $0009
  add hl, de
  ld c, l
  ld b, h
  ld de, $bff9
  ld a, [de]
  ld [bc], a
  add sp, $02
  ret


ProgramGameRTC:
  ld hl, $bd13
  ld [hl], $06
  ld l, $10
  ld [hl], $01
  pop bc
  pop hl
  push hl
  push bc
  push hl
  call WriteMapperRTCRegisters
  add sp, $02
  ld hl, $bd13
  ld [hl], $06
  ld l, $10
  ld [hl], $00
  ret


ClearGameRTC:
  add sp, -$0c
  ld hl, sp+$00
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  push bc
  ld hl, $000a
  push hl
  xor a
  push af
  inc sp
  push de
  call FillMemory
  add sp, $05
  pop bc
  ld hl, $0004
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$0a
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $40
  ld hl, $0009
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$0a
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $40
  push bc
  call ProgramGameRTC
  add sp, $02
  add sp, $0c
  ret
LatchAndReadGameRTC::


  ld hl, $bd12
  ld [hl], $00
  ld l, $12
  ld [hl], $01
  pop bc
  pop hl
  push hl
  push bc
  push hl
  call Call_001_5ca4
  add sp, $02
  ret


Call_001_5c7a:
  add sp, -$02
  ld hl, sp+$05
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0004
  add hl, bc
  inc sp
  inc sp
  push hl
  pop de
  push de
  ld a, [de]
  sub $40
  jr nz, jr_001_5c9f

  ld hl, $0009
  add hl, bc
  ld c, l
  ld b, h
  ld a, [bc]
  sub $40
  jr nz, jr_001_5c9f

  ld e, $01
  jr jr_001_5ca1

jr_001_5c9f:
  ld e, $00

jr_001_5ca1:
  add sp, $02
  ret


Call_001_5ca4:
  add sp, -$05
  ld hl, sp+$08
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$03
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, $0005
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], d
  dec hl
  dec hl
  ld [hl], $00

Jump_001_5cbf:
  ld de, $bd13
  ld hl, sp+$00
  ld a, [hl]
  ld [de], a
  ld hl, sp+$04
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$00
  ld l, [hl]
  ld h, $00
  add hl, bc
  ld c, l
  ld b, h
  ld de, $bd10
  ld a, [de]
  ld [bc], a
  ld hl, sp+$02
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  dec hl
  dec hl
  ld l, [hl]
  ld h, $00
  add hl, bc
  ld c, l
  ld b, h
  ld de, $bd11
  ld a, [de]
  ld [bc], a
  ld hl, sp+$00
  inc [hl]
  ld a, [hl]
  sub $05
  jp c, Jump_001_5cbf

  add sp, $05
  ret


Call_001_5cf8:
  ld hl, sp+$02
  ld a, [hl]
  and $0f
  ld b, a
  ld a, [hl]
  swap a
  and $0f
  ld [hl], a
  ld a, [hl]
  or a
  jr z, jr_001_5d11

  ld a, [hl]
  ld e, a
  add a
  add a
  add e
  add a
  ld c, a
  add b
  ld b, a

jr_001_5d11:
  ld e, b
  ret


Call_001_5d13:
  add sp, -$07
  ld hl, sp+$09
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $01
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$09
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$03
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  and $7f
  ld [bc], a
  ld hl, sp + $00
  ld [hl], $00
  ld hl, sp+$02
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  dec hl
  dec hl
  ld l, [hl]
  ld h, $00
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$05
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  push bc
  push af
  inc sp
  call Call_001_5cf8
  inc sp
  ld a, e
  pop bc
  ld hl, sp+$06
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld [de], a
  ld hl, sp + $00
  inc [hl]
  ld a, [hl]
  sub $07
  jp c, $5d45

  ld a, [bc]
  add $ff
  ld [bc], a
  ld hl, sp + $04
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  add $ff
  ld [bc], a
  add sp, $07
  ret


Call_001_5d78:
  add sp, -$0b
  ld hl, sp+$09
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$0d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_5d13
  add sp, $02
  ld hl, sp+$0d
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $05
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $07
  ld [hl+], a
  ld [hl], d
  ld c, $00

Jump_001_5da4:
  ld hl, sp + $08
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld a, c
  sub b
  jr nc, jr_001_5dd0
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $016d
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$09
  ld [hl+], a
  ld [hl], d
  ld a, c
  and $03
  jr nz, jr_001_5dcc

  ld hl, sp+$09
  inc [hl]
  jr nz, jr_001_5dcc

  inc hl
  inc [hl]

jr_001_5dcc:
  inc c
  jr Jump_001_5da4


jr_001_5dd0:
  ld a, b
  and $03
  ld hl, sp + $07
  ld [hl-], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $03
  ld [hl+], a
  ld [hl], d
  dec hl
  dec hl
  ld [hl], $00

Jump_001_5dea:
  ld hl, sp + $04
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  dec hl
  dec hl
  ld a, [hl]
  sub b
  jp nc, Jump_001_5e2b

  ld de, Bank1Address5AB3
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld c, a
  ld b, $00
  ld hl, sp+$09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$09
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $07
  ld a, [hl]
  or a
  jr nz, jr_001_5e25
  ld hl, sp + $02
  ld a, [hl]
  dec a
  jr nz, jr_001_5e25

  ld hl, sp+$09
  inc [hl]
  jr nz, jr_001_5e25

  inc hl
  inc [hl]

jr_001_5e25:
  ld hl, sp + $02
  inc [hl]
  jp Jump_001_5dea


Jump_001_5e2b:
  ld hl, sp + $06
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld c, a
  ld b, $00
  ld hl, sp+$09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  inc sp
  inc sp
  push bc
  ld hl, sp+$0f
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $03
  ld [hl+], a
  ld [hl], e
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld hl, sp + $03
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp + $04
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0001
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $07
  ld [hl+], a
  ld [hl], d
  dec hl
  dec hl
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, [bc]
  ld b, a
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp + $04
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0002
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $07
  ld [hl+], a
  ld [hl], d
  dec hl
  dec hl
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, [bc]
  ld b, a
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp + $04
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld hl, sp + $00
  ld a, [hl]
  ld [bc], a
  ld hl, sp + $04
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld c, l
  ld b, h
  ld hl, sp + $01
  ld d, [hl]
  ld e, $00
  ld a, d
  and $01
  ld d, a
  ld e, $00
  ld a, d
  ld [bc], a
  add sp, $0b
  ret


Call_001_5ec4:
  add sp, -$0e
  ld hl, sp+$10
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $08
  ld [hl+], a
  ld [hl], e
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld a, [bc]
  ld e, a
  ld d, $00
  ld bc, $0000
  push bc
  push de
  ld hl, $0001
  push hl
  ld hl, jr_001_5184
  push hl
  call Call_001_6c47
  add sp, $08
  ld b, l
  ld c, h
  ld hl, sp+$04
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  rrca
  jr nc, jr_001_5f23

  ld hl, sp+$05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld a, d
  add $80
  push af
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  pop af
  ld a, e
  adc $51
  ld e, a
  ld a, d
  adc $01
  ld [hl-], a
  ld [hl], e

jr_001_5f23:
  ld hl, sp + $09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  inc hl
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp + $0a
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld [hl-], a
  ld [hl], e
  ld hl, sp + $09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $0e
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld [hl-], a
  ld [hl], e
  ld hl, sp + $09
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, [bc]
  ld e, a
  ld d, $00
  ld bc, $0000
  push bc
  push de
  ld hl, $0000
  push hl
  ld hl, $003c
  push hl
  call Call_001_6c47
  add sp, $08
  push hl
  ld hl, sp+$06
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, sp + $0b
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
  ld hl, sp + $0d
  ld [hl-], a
  ld [hl], e
  ld hl, sp + $0f
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
  ld hl, sp + $0d
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
  ld d, h
  ld e, l
  ld hl, sp+$00
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
  ld hl, sp + $09
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, [bc]
  ld e, a
  ld d, $00
  ld bc, $0000
  push bc
  push de
  ld hl, $0000
  push hl
  ld hl, $0e10
  push hl
  call Call_001_6c47
  add sp, $08
  push hl
  ld hl, sp + $0c
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  push de
  ld a, e
  ld hl, sp + $0a
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp + $0e
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
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
  add sp, $0e
  ret


Call_001_6008:
  add sp, -$08
  ld hl, sp+$0a
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $04
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$06
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00
  ld hl, sp + $05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0002
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $02
  ld [hl+], a
  ld [hl], d
  ld hl, $0001
  push hl
  ld hl, jr_001_5184
  push hl
  ld hl, sp+$12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6C4D
  add sp, $08
  ld c, l
  ld b, h
  ld hl, $0000
  push hl
  ld hl, $0e10
  push hl
  push bc
  push de
  call Bank1Function6C53
  add sp, $08
  ld b, l
  ld c, h
  ld b, e
  ld hl, sp + $02
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp + $05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0001
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $02
  ld [hl+], a
  ld [hl], d
  ld hl, $0000
  push hl
  ld hl, $0e10
  push hl
  ld hl, sp+$12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6C4D
  add sp, $08
  ld c, l
  ld b, h
  ld hl, $0000
  push hl
  ld hl, $003c
  push hl
  push bc
  push de
  call Bank1Function6C53
  add sp, $08
  ld b, l
  ld c, h
  ld b, e
  ld hl, sp + $02
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, $0000
  push hl
  ld hl, $003c
  push hl
  ld hl, sp+$12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6C4D
  add sp, $08
  ld b, l
  ld c, h
  ld b, e
  ld hl, sp + $04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, $0001
  push hl
  ld hl, jr_001_5184
  push hl
  ld hl, sp+$12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$12
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6C53
  add sp, $08
  ld b, l
  ld c, h
  ld hl, sp+$00
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, sp + $05
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld hl, sp+$00
  ld d, [hl]
  ld e, $00
  ld a, d
  ld [bc], a
  ld b, [hl]
  inc hl
  ld a, [hl]
  and $01
  ld c, a
  ld a, $ff
  cp b
  ld a, $00
  sbc c
  jr nc, jr_001_6119

  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  set 0, a
  ld b, a
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b

jr_001_6119:
  ld hl, sp+$0c
  ld a, [hl]
  sub $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $a3
  inc hl
  ld a, [hl]
  sbc $02
  jr c, jr_001_613b

  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  set 7, a
  ld b, a
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b

jr_001_613b:
  add sp, $08
  ret


Call_001_613e:
  add sp, -$1e
  ld hl, sp+$20
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $14
  ld [hl+], a
  ld [hl], e
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_5ec4
  add sp, $02
  ld b, l
  ld c, h
  ld hl, sp+$1a
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp + $15
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld c, l
  ld b, h
  push bc
  call Call_001_5ec4
  add sp, $02
  ld b, l
  ld c, h
  ld hl, sp + $10
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$22
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_5ec4
  add sp, $02
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
  ld hl, sp + $08
  ld d, h
  ld e, l
  ld hl, sp+$16
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
  ld hl, sp + $08
  ld d, h
  ld e, l
  ld hl, sp+$1a
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
  jr nc, jr_001_61d8

  ld hl, sp + $09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld a, d
  add $00
  push af
  ld hl, sp+$19
  ld [hl-], a
  ld [hl], e
  ld hl, sp + $0d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  pop af
  ld a, e
  adc $a3
  ld e, a
  ld a, d
  adc $02
  ld hl, sp+$19
  ld [hl-], a
  ld [hl], e

jr_001_61d8:
  ld hl, sp+$17
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp+$1a
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$03
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$1b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$1e
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, sp+$03
  ld [hl-], a
  ld [hl], e
  ld hl, sp + $11
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp+$00
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld hl, sp+$19
  ld [hl-], a
  ld [hl], e
  ld hl, sp + $15
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$04
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld hl, sp+$19
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
  ld d, h
  ld e, l
  ld hl, sp + $04
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
  ld hl, sp+$1b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp+$00
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld hl, sp+$19
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$1f
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$04
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld hl, sp+$19
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
  ld d, h
  ld e, l
  ld hl, sp + $0c
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
  ld hl, sp+$25
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  push bc
  ld hl, sp + $10
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $10
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  call Call_001_6008
  add sp, $06
  pop bc
  inc bc
  inc bc
  inc bc
  inc bc
  inc bc
  ld hl, sp + $06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp + $06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  call Call_001_6008
  add sp, $06
  add sp, $1e
  ret


Call_001_629f:
  add sp, -$21
  ld hl, sp + $0a
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  push bc
  push de
  call ReadRTCClockRegisters
  add sp, $02
  pop bc
  ld hl, sp+$1a
  ld e, l
  ld d, h
  ld hl, sp+$1f
  ld [hl], e
  inc hl
  ld [hl], d
  push de
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  call Call_001_5d78
  add sp, $04
  pop de
  ld hl, sp+$24
  ld a, [hl-]
  or [hl]
  jr z, jr_001_62db

  push de
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_5c7a
  add sp, $02
  ld a, e
  pop de
  or a
  jp z, Jump_001_6309

jr_001_62db:
  ld hl, sp + $00
  ld b, l
  ld c, h
  ld hl, sp+$1f
  ld [hl], b
  inc hl
  ld [hl], c
  ld c, e
  ld b, d
  push de
  ld hl, $0005
  push hl
  ld hl, sp+$23
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  call CopyMemory
  add sp, $06
  pop de
  ld hl, sp + $05
  ld c, l
  ld b, h
  ld hl, $0005
  push hl
  push bc
  push de
  call CopyMemory
  add sp, $06
  jr jr_001_631a

Jump_001_6309:
  ld hl, sp + $00
  ld c, l
  ld b, h
  push bc
  push de
  ld hl, sp+$27
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_613e
  add sp, $06

jr_001_631a:
  ld hl, sp + $00
  ld e, l
  ld d, h
  push de
  call WriteMapperRTCRegisters
  add sp, $02
  ld hl, $bd13
  ld [hl], $06
  ld l, $10
  ld [hl], $01
  ld l, $13
  ld [hl], $00
  add sp, $21
  ret
