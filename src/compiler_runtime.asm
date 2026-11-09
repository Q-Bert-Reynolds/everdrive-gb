; Resident compiler runtime and arithmetic helpers. CPU addresses $4000-$7fff remain fixed in OS mode.
SECTION "Resident compiler runtime and arithmetic helpers", ROMX[$6c5a], BANK[1]

Call_001_6c47:
  jp Jump_001_71df


  jp Jump_001_6e58


Bank1Function6C4D:
  jp Jump_001_6f78


  jp Jump_001_7025


Bank1Function6C53:
  jp Jump_001_714e

  ld a, $05
  rst $08
  jp Jump_001_6e2f


  ld a, $05
  rst $08
  jp Jump_001_6d13


  ld a, $05
  rst $08
  jp Bank1Function6D53


  ld a, $05
  rst $08
  jp Jump_001_6e0f


  ld a, $05
  rst $08
  jp Jump_001_6cf9


  ld a, $05
  rst $08
  jp Jump_001_6d07


  ld a, $05
  rst $08
  jp Call_001_6e22


  ld a, $05
  rst $08
  jp Call_001_6d39


  ld a, $05
  rst $08
  jp Call_001_6d47


  ld a, $05
  rst $08
  jp Jump_001_6dfb


  ld a, $05
  rst $08
  jp Jump_001_6cbc


  ld a, $05
  rst $08
  jp Jump_001_6ccb


  ld a, $05
  rst $08
  jp Jump_001_6e05


  ld a, $05
  rst $08
  jp Jump_001_6cd7
  ld a, $05
  rst $08
  jp Jump_001_6ce9
  ld a, $05
  rst $08
  jp Jump_001_6d27
  ld a, $05
  rst $08
  jp Bank1Function6D67


Jump_001_6cbc:
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld b, $00
  call Call_001_6d7d
  ld e, c
  ld d, b
  ret


Jump_001_6ccb:
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld b, $00
  jp Jump_001_6d7d


Jump_001_6cd7:
  ld hl, $0003
  ld d, h
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld a, c
  rlca
  sbc a
  ld b, a
  call Call_001_6d81
  ld e, c
  ld d, b
  ret


Jump_001_6ce9:
  ld hl, $0003
  ld d, h
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  ld a, c
  rlca
  sbc a
  ld b, a
  call Call_001_6d81
  ret


Jump_001_6cf9:
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call Call_001_6d79
  ld e, c
  ld d, b
  ret


Jump_001_6d07:
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call Call_001_6d79
  ret


Jump_001_6d13:
  ld hl, $0005
  add hl, sp
  ld d, [hl]
  dec hl
  ld e, [hl]
  dec hl
  ld a, [hl]
  dec hl
  ld l, [hl]
  ld h, a
  ld b, h
  ld c, l
  call Call_001_6d81
  ld e, c
  ld d, b
  ret


Jump_001_6d27:
  ld hl, $0005
  add hl, sp
  ld d, [hl]
  dec hl
  ld e, [hl]
  dec hl
  ld a, [hl]
  dec hl
  ld l, [hl]
  ld h, a
  ld b, h
  ld c, l
  call Call_001_6d81
  ret


Call_001_6d39:
Jump_001_6d39:
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call Call_001_6db7
  ld e, c
  ld d, b
  ret


Call_001_6d47:
Jump_001_6d47:
  ld hl, $0003
  add hl, sp
  ld e, [hl]
  dec hl
  ld l, [hl]
  ld c, l
  call Call_001_6db7
  ret


Bank1Function6D53:
  ld hl, $0005
  add hl, sp
  ld d, [hl]
  dec hl
  ld e, [hl]
  dec hl
  ld a, [hl]
  dec hl
  ld l, [hl]
  ld h, a
  ld b, h
  ld c, l
  call Call_001_6dba
  ld e, c
  ld d, b
  ret


Bank1Function6D67:
  ld hl, $0005
  add hl, sp
  ld d, [hl]
  dec hl
  ld e, [hl]
  dec hl
  ld a, [hl]
  dec hl
  ld l, [hl]
  ld h, a
  ld b, h
  ld c, l
  call Call_001_6dba
  ret


Call_001_6d79:
  ld a, c
  rlca
  sbc a
  ld b, a

Call_001_6d7d:
Jump_001_6d7d:
  ld a, e
  rlca
  sbc a
  ld d, a

Call_001_6d81:
  ld a, b
  push af
  xor d
  push af
  bit 7, d
  jr z, jr_001_6d8f

  sub a
  sub e
  ld e, a
  sbc a
  sub d
  ld d, a

jr_001_6d8f:
  bit 7, b
  jr z, jr_001_6d99

  sub a
  sub c
  ld c, a
  sbc a
  sub b
  ld b, a

jr_001_6d99:
  call Call_001_6dba
  jr c, jr_001_6db4

  pop af
  and $80
  jr z, jr_001_6da9

  sub a
  sub c
  ld c, a
  sbc a
  sub b
  ld b, a

jr_001_6da9:
  pop af
  and $80
  ret z

  sub a
  sub e
  ld e, a
  sbc a
  sub d
  ld d, a
  ret


jr_001_6db4:
  pop af
  pop af
  ret


Call_001_6db7:
  ld b, $00
  ld d, b

Call_001_6dba:
  ld a, e
  or d
  jr nz, jr_001_6dc5

  ld bc, $0000
  ld d, b
  ld e, c
  scf
  ret


jr_001_6dc5:
  ld l, c
  ld h, b
  ld bc, $0000
  or a
  ld a, $10

jr_001_6dcd:
  push af
  rl l
  rl h
  rl c
  rl b
  push bc
  ld a, c
  sbc e
  ld c, a
  ld a, b
  sbc d
  ld b, a
  ccf
  jr c, jr_001_6de8

  pop bc
  pop af
  dec a
  or a
  jr nz, jr_001_6dcd

  jr jr_001_6df1

jr_001_6de8:
  inc sp
  inc sp
  pop af
  dec a
  scf
  jr nz, jr_001_6dcd

  jr jr_001_6df1

jr_001_6df1:
  ld d, b
  ld e, c
  rl l
  ld c, l
  rl h
  ld b, h
  or a
  ret


Jump_001_6dfb:
  ld hl, $0003
  ld b, h
  add hl, sp
  ld e, [hl]
  dec hl
  ld c, [hl]
  jr jr_001_6e1b

Jump_001_6e05:
  ld hl, $0002
  ld b, h
  add hl, sp
  ld e, [hl]
  inc hl
  ld c, [hl]
  jr jr_001_6e1b

Jump_001_6e0f:
  ld hl, $0002
  add hl, sp
  ld e, [hl]
  inc hl
  ld l, [hl]
  ld c, l
  ld a, l
  rla
  sbc a
  ld b, a

jr_001_6e1b:
  ld a, e
  rla
  sbc a
  ld d, a
  jp Jump_001_6e3d


Call_001_6e22:
Jump_001_6e22:
  ld hl, $0002
  add hl, sp
  ld e, [hl]
  inc hl
  ld c, [hl]
  xor a
  ld d, a
  ld b, a
  jp Jump_001_6e3d


Call_001_6e2f:
Jump_001_6e2f:
  ld hl, $0002
  add hl, sp
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl]
  inc hl
  ld h, [hl]
  ld l, a
  ld b, h
  ld c, l

Jump_001_6e3d:
  ld hl, $0000
  ld a, b
  ld b, $10
  or a
  jp nz, Jump_001_6e4a

  ld b, $08
  ld a, c

Jump_001_6e4a:
jr_001_6e4a:
  add hl, hl
  rl c
  rla
  jp nc, Jump_001_6e52

  add hl, de

Jump_001_6e52:
  dec b
  jr nz, jr_001_6e4a

  ld e, l
  ld d, h
  ret


Jump_001_6e58:
  add sp, -$0d
  ld hl, sp+$0f
  ld a, [hl]
  sub $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  ld d, [hl]
  ld a, $00
  ld e, a
  bit 7, e
  jr z, jr_001_6e7a

  bit 7, d
  jr nz, jr_001_6e7f

  cp a
  jr jr_001_6e7f

jr_001_6e7a:
  bit 7, d
  jr z, jr_001_6e7f

  scf

jr_001_6e7f:
  ld a, $00
  rla
  ld hl, sp+$04
  ld [hl], a
  ld a, [hl]
  or a
  jr z, jr_001_6eab

  ld de, $0000
  ld a, e
  ld hl, sp+$0f
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$0c
  ld [hl-], a
  ld [hl], e
  ld de, $0000
  ld hl, sp+$13
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, sp+$0c
  ld [hl-], a
  ld [hl], e
  jr jr_001_6ebc

jr_001_6eab:
  ld hl, sp+$0f
  ld d, h
  ld e, l
  ld hl, sp+$09
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

jr_001_6ebc:
  ld hl, sp+$13
  ld a, [hl]
  sub $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  ld d, [hl]
  ld a, $00
  ld e, a
  bit 7, e
  jr z, jr_001_6edc

  bit 7, d
  jr nz, jr_001_6ee1

  cp a
  jr jr_001_6ee1

jr_001_6edc:
  bit 7, d
  jr z, jr_001_6ee1

  scf

jr_001_6ee1:
  jr nc, jr_001_6f05

  ld de, $0000
  ld a, e
  ld hl, sp+$13
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$08
  ld [hl-], a
  ld [hl], e
  ld de, $0000
  ld hl, sp+$17
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, sp+$08
  ld [hl-], a
  ld [hl], e
  jr jr_001_6f16

jr_001_6f05:
  ld hl, sp+$13
  ld d, h
  ld e, l
  ld hl, sp+$05
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

jr_001_6f16:
  ld hl, sp+$05
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  push bc
  push de
  ld hl, sp+$0f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$0f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6C4D
  add sp, $08
  ld b, l
  ld c, h
  ld hl, sp+$00
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  inc hl
  ld a, [hl]
  or a
  jp z, Jump_001_6f6e

  ld de, $0000
  ld a, e
  ld hl, sp+$00
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$08
  ld [hl-], a
  ld [hl], e
  ld de, $0000
  ld hl, sp+$04
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, sp+$08
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
  jr jr_001_6f75

Jump_001_6f6e:
  pop de
  push de
  ld hl, sp+$02
  ld a, [hl+]
  ld h, [hl]
  ld l, a

jr_001_6f75:
  add sp, $0d
  ret


Jump_001_6f78:
  ld b, $00
  ld c, $00

Jump_001_6f7c:
  ld hl, sp+$09
  ld a, [hl]
  rlc a
  and $01
  jp nz, Jump_001_6fc5

  push af
  pop af
  ld a, $01
  ld hl, sp+$06
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  ld hl, sp+$02
  ld d, h
  ld e, l
  ld hl, sp+$06
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
  jr nc, jr_001_6fc0

  push af
  pop af
  ld a, $01
  ld hl, sp+$09
  srl [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  jr jr_001_6fc5

jr_001_6fc0:
  inc c
  ld b, c
  jp Jump_001_6f7c


Jump_001_6fc5:
jr_001_6fc5:
  ld hl, sp+$02
  ld d, h
  ld e, l
  ld hl, sp+$06
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
  jp c, Jump_001_7002

  ld hl, sp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp+$06
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
  ld hl, sp+$0a
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

Jump_001_7002:
  push af
  pop af
  ld a, $01
  ld hl, sp+$09
  srl [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  ld c, b
  dec b
  ld a, c
  or a
  jp nz, Jump_001_6fc5

  ld hl, sp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ret


Jump_001_7025:
  add sp, -$0e
  ld hl, sp+$10
  ld a, [hl]
  sub $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  ld d, [hl]
  ld a, $00
  ld e, a
  bit 7, e
  jr z, jr_001_7047

  bit 7, d
  jr nz, jr_001_704c

  cp a
  jr jr_001_704c

jr_001_7047:
  bit 7, d
  jr z, jr_001_704c

  scf

jr_001_704c:
  ld a, $00
  rla
  ld hl, sp+$0d
  ld [hl], a
  ld a, [hl]
  or a
  jr z, jr_001_7078

  ld de, $0000
  ld a, e
  ld hl, sp+$10
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$07
  ld [hl-], a
  ld [hl], e
  ld de, $0000
  ld hl, sp+$14
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, sp+$07
  ld [hl-], a
  ld [hl], e
  jr jr_001_7089

jr_001_7078:
  ld hl, sp+$10
  ld d, h
  ld e, l
  ld hl, sp+$04
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

jr_001_7089:
  ld hl, sp+$14
  ld a, [hl]
  sub $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  inc hl
  ld a, [hl]
  sbc $00
  ld d, [hl]
  ld a, $00
  ld e, a
  bit 7, e
  jr z, jr_001_70a9

  bit 7, d
  jr nz, jr_001_70ae

  cp a
  jr jr_001_70ae

jr_001_70a9:
  bit 7, d
  jr z, jr_001_70ae

  scf

jr_001_70ae:
  ld a, $00
  rla
  ld hl, sp+$0c
  ld [hl], a
  ld a, [hl]
  or a
  jr z, jr_001_70da

  ld de, $0000
  ld a, e
  ld hl, sp+$14
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$0b
  ld [hl-], a
  ld [hl], e
  ld de, $0000
  ld hl, sp+$18
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, sp+$0b
  ld [hl-], a
  ld [hl], e
  jr jr_001_70eb

jr_001_70da:
  ld hl, sp+$14
  ld d, h
  ld e, l
  ld hl, sp+$08
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

jr_001_70eb:
  ld hl, sp+$08
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  push bc
  push de
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Bank1Function6C53
  add sp, $08
  ld c, l
  ld b, h
  ld hl, sp+$00
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$0d
  ld a, [hl-]
  xor [hl]
  jp z, Jump_001_7144

  ld de, $0000
  ld a, e
  ld hl, sp+$00
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$0b
  ld [hl-], a
  ld [hl], e
  ld de, $0000
  ld hl, sp+$04
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, sp+$0b
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
  jr jr_001_714b

Jump_001_7144:
  pop de
  push de
  ld hl, sp+$02
  ld a, [hl+]
  ld h, [hl]
  ld l, a

jr_001_714b:
  add sp, $0e
  ret


Jump_001_714e:
  add sp, -$04
  xor a
  ld hl, sp+$00
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  ld b, $20

Jump_001_7159:
  ld hl, sp+$09
  ld a, [hl]
  rlc a
  and $01
  ld d, a
  push af
  pop af
  ld a, $01
  ld hl, sp+$06
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  push af
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
  bit 0, d
  jr z, jr_001_718d

  ld hl, sp+$00
  ld a, [hl]
  set 0, a
  ld [hl], a

jr_001_718d:
  ld hl, sp+$00
  ld d, h
  ld e, l
  ld hl, sp+$0a
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
  jp c, Jump_001_71cc

  pop de
  push de
  ld a, e
  ld hl, sp+$0a
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, sp+$03
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$0e
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
  ld hl, sp+$06
  ld a, [hl]
  set 0, a
  ld [hl], a

Jump_001_71cc:
  dec b
  ld a, b
  or a
  jp nz, Jump_001_7159

  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add sp, $04
  ret


Jump_001_71df:
  add sp, -$10
  ld hl, sp+$12
  ld a, l
  ld d, h
  ld hl, sp+$0e
  ld [hl+], a
  ld [hl], d
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld hl, sp+$0c
  ld [hl], c
  inc hl
  ld [hl], b
  inc hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$0a
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$16
  ld a, l
  ld d, h
  ld hl, sp+$08
  ld [hl+], a
  ld [hl], d
  dec hl
  ld b, [hl]
  inc hl
  ld c, [hl]
  ld e, b
  ld d, c
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  push bc
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_6e2f
  add sp, $04
  ld b, e
  ld c, d
  ld hl, sp+$0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$0f
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld hl, sp+$0a
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$0f
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$0c
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$09
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$06
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$0e
  ld b, [hl]
  inc hl
  ld c, [hl]
  ld e, b
  ld d, c
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  push bc
  ld hl, sp+$08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_001_6e2f
  add sp, $04
  ld c, e
  ld b, d
  ld hl, sp+$0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$0f
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld hl, sp+$06
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$0f
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$0a
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp+$0f
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, [bc]
  ld hl, sp+$0c
  ld [hl], a
  ld hl, sp+$09
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, [bc]
  push af
  inc sp
  ld hl, sp+$0d
  ld a, [hl]
  push af
  inc sp
  call Call_001_6e22
  add sp, $02
  ld c, e
  ld b, d
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$06
  ld [hl], a
  ld hl, sp+$0f
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, [bc]
  push af
  inc sp
  ld hl, sp+$07
  ld a, [hl]
  push af
  inc sp
  call Call_001_6e22
  add sp, $02
  inc sp
  inc sp
  push de
  ld hl, sp+$09
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld hl, sp+$06
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$0f
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$0a
  ld [hl-], a
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, [bc]
  push af
  inc sp
  inc hl
  ld a, [hl]
  push af
  inc sp
  call Call_001_6e22
  add sp, $02
  ld b, e
  ld c, d
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$09
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld hl, sp+$06
  ld [hl], c
  inc hl
  ld [hl], b
  inc hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc hl
  ld [hl], c
  inc hl
  ld [hl], b
  dec hl
  dec hl
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld e, c
  ld d, b
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
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$00
  ld a, c
  sub [hl]
  inc hl
  ld a, b
  sbc [hl]
  ld a, $00
  rla
  ld b, a
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp+$0e
  ld d, [hl]
  inc hl
  ld e, [hl]
  ld hl, sp+$06
  ld [hl], d
  inc hl
  ld [hl], e
  ld hl, sp+$0f
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld d, a
  ld hl, sp+$09
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld a, [bc]
  push af
  inc sp
  push de
  inc sp
  call Call_001_6e22
  add sp, $02
  ld b, e
  ld c, d
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  xor a
  ld [de], a
  ld hl, sp+$13
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp+$16
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld hl, sp+$05
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$17
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$1a
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld hl, sp+$05
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
  add sp, $10
  ret
