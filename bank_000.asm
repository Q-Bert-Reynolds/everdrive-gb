; Disassembly of "GBCOS.bin"
; This file was created with:
; mgbdis v1.5 - Game Boy ROM disassembler by Matt Currie and contributors.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $000", ROM0[$0]

RST_00::
  jp EntryPoint


  rst $38
  rst $38
  rst $38
  rst $38
  rst $38

RST_08::
  reti


  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38

RST_10::
  reti


  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38

RST_18::
  reti


  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38

RST_20::
  reti


  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38

RST_28::
  reti


  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38

RST_30::
  reti


  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38

RST_38::
  reti


  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38

VBlankInterrupt::
  jp VBLInterrupt


  rst $38
  rst $38
  rst $38
  rst $38
  rst $38

LCDCInterrupt::
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38

TimerOverflowInterrupt::
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38

SerialTransferCompleteInterrupt::
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38

JoypadTransitionInterrupt::
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  reti


  rst $38

  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38

Boot::
  jp EntryPoint


  rst $38

HeaderLogo::
  db $ce, $ed, $66, $66, $cc, $0d, $00, $0b, $03, $73, $00, $83, $00, $0c, $00, $0d
  db $00, $08, $11, $1f, $88, $89, $00, $0e, $dc, $cc, $6e, $e6, $dd, $dd, $d9, $99
  db $bb, $bb, $67, $63, $6e, $0e, $ec, $cc, $dd, $dc, $99, $9f, $bb, $b9, $33, $3e

HeaderTitle::
  db "GBXOS", $ff, $ff, $ff, $ff, $ff, $ff

HeaderManufacturerCode::
  db "KRKZ"

HeaderCGBFlag::
  db $80

HeaderNewLicenseeCode::
  db $ff, $ff

HeaderSGBFlag::
  db $03

HeaderCartridgeType::
  db $00

HeaderROMSize::
  db $00

HeaderRAMSize::
  db $00

HeaderDestinationCode::
  db $01

HeaderOldLicenseeCode::
  db $33

HeaderMaskROMVersion::
  db $00

HeaderComplementCheck::
  db $73

HeaderGlobalChecksum::
  db $e1, $7e

  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38

jr_000_01b5:
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38

jr_000_01cc:
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  nop
  ld bc, $0000
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  ld [hl], b
  rla
  ld b, l
  add hl, de
  sub e
  ld [de], a
  ld l, a
  ld h, l
  sub $65
  ld b, c
  db $10
  xor d
  ld a, [de]
  xor [hl]
  ld a, [de]
  or d
  ld a, [de]
  adc a
  inc b
  cp d
  inc b
  xor b
  inc b
  or c
  inc b
  rst $28
  add hl, bc
  ld [bc], a
  ld a, [bc]
  adc b
  rra
  sbc e
  rra
  ld l, l
  ld hl, $2193
  ldh [rNR42], a
  ld a, $22
  rst $38
  rra
  jp nz, Jump_000_3420

  jr nz, jr_000_01b5

  jr nz, jr_000_01cc

  jr nz, @+$4f

  ld hl, $09cc
  add hl, bc
  ld [hl+], a
  ld c, a
  ld [hl+], a
  ld l, b
  ld [hl+], a
  ld [hl], d
  ld [hl+], a
  pop bc
  add hl, bc
  db $eb
  ld sp, $5896
  ccf
  ld a, [hl-]
  ld h, a
  ld b, b
  or $3c
  jp nz, $7049

  ld [hl], $5f
  ccf
  sbc [hl]
  ld e, b
  xor d
  ld e, b
  or [hl]
  ld e, b
  sbc e
  ld d, a
  and d
  dec hl
  cp h
  dec hl
  jr jr_000_028c

  ld e, d
  dec hl
  and $67
  ld a, [c]
  ld l, d
  rrca
  ld l, e
  sbc $6b
  dec d
  ld l, h
  ld [hl-], a
  ld l, h
  add sp, $6a
  cp d
  ld e, b
  ld b, c
  ld e, c
  ld h, [hl]
  ld e, h
  ld e, $5b
  cp a
  ld e, d
  ei
  ld e, d
  ld a, a
  ld e, e
  add hl, bc
  ld e, h

EntryPoint:
  di
  ld sp, $dfff
  ld a, $a5
  ld [$bd0a], a
  ld a, [$01f2]

jr_000_028c:
  cp $00
  jr nz, jr_000_02bc

  ld sp, $dfff
  ld a, $00
  ldh [rSVBK], a
  ldh [rVBK], a
  ld [$bd07], a
  ld a, $04
  ld [$bd09], a
  call Call_000_02a9
  call Call_000_0a43
  jr EntryPoint

Call_000_02a9:
  ld a, $04
  ld [$bd06], a
  ld a, $00
  ld_long $ffff, a
  ld [$bd01], a
  ld a, $04
  ld [$bd08], a
  ret


jr_000_02bc:
  ld a, $00
  ld [$01f2], a
  ld a, $10
  ld [$bd06], a

jr_000_02c6:
  jr jr_000_02c6

Call_000_02c8:
  ld hl, sp+$02
  ld a, [hl]
  ld [$bd00], a

jr_000_02ce:
  ld a, [$bd01]
  and $80
  jr nz, jr_000_02ce

  ld a, [$bd00]
  ld e, a
  ret


Call_000_02da:
  ld hl, sp+$02
  ld a, [hl]
  ld [$bd00], a
  ld a, [$bd00]
  ld e, a
  ret


Call_000_02e5:
  ld hl, sp+$02
  ld a, [hl]
  ld [$bd00], a
  ret


Call_000_02ec:
  ld a, [$bd01]
  and $fe
  ld [$bd01], a
  ret


Call_000_02f5:
  ld a, [$bd01]
  or $01
  ld [$bd01], a
  ret


Call_000_02fe:
  ld a, [$bd01]
  or $02
  ld [$bd01], a
  ret


Call_000_0307:
  ld a, [$bd01]
  and $fd
  ld [$bd01], a
  ld a, [$bd06]
  and $fe
  ld [$bd06], a
  ret


Call_000_0318:
  ld a, [$bd01]
  and $fb
  ld [$bd01], a
  ld a, [$bd06]
  and $fe
  ld [$bd06], a
  ret


Call_000_0329:
  ld a, [$bd01]
  or $04
  ld [$bd01], a
  ld a, [$bd06]
  or $01
  ld [$bd06], a
  ret


Call_000_033a:
  ld a, [$bd02]
  inc a
  ld [$bd02], a
  ret


Call_000_0342:
  ld a, [hl+]
  ld [$bd02], a
  ld a, [hl]
  ld [$bd03], a
  ret


Call_000_034b:
  pop de
  pop hl
  pop bc
  push bc
  push hl
  push de
  call Call_000_0342
  call Call_000_0329
  ld de, $bd00

jr_000_035a:
  ld a, [de]
  call Call_000_043a
  ld hl, $be00
  ld b, $40

jr_000_0363:
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  dec b
  jr nz, jr_000_0363

  ld a, [de]
  call Call_000_033a
  dec c
  jr nz, jr_000_035a

  call Call_000_0318
  ld e, $00
  ret


Call_000_037b:
  pop de
  pop hl
  pop bc
  push bc
  push hl
  push de
  call Call_000_0329
  ld de, $bd00
  ld b, $00

jr_000_0389:
  ld a, [de]
  call Call_000_043a

jr_000_038d:
  ld a, [de]
  ld [hl+], a
  ld a, [de]
  ld [hl+], a
  dec b
  jr nz, jr_000_038d

  ld a, [de]
  dec c
  jr nz, jr_000_0389

  call Call_000_0318
  ld e, $00
  ret


Call_000_039e:
  pop de
  pop hl
  pop bc
  push bc
  push hl
  push de
  call Call_000_0342
  ld hl, $be00

jr_000_03aa:
  call Call_000_03d2
  ld a, e
  cp $00
  jp nz, Jump_000_0439

  ld hl, $be00
  call Call_000_033a
  dec c
  jr nz, jr_000_03aa

  jr jr_000_040b

Call_000_03be:
  pop de
  pop hl
  pop bc
  push bc
  push hl
  push de

jr_000_03c4:
  call Call_000_03d2
  ld a, e
  cp $00
  jp nz, Jump_000_0439

  dec c
  jr nz, jr_000_03c4

  jr jr_000_040b

Call_000_03d2:
  ld b, $00
  ld de, $bd00
  ld a, $ff
  ld [de], a
  ld [de], a
  ld a, $fc
  ld [de], a

jr_000_03de:
  ld a, [hl+]
  ld [de], a
  ld a, [hl+]
  ld [de], a
  dec b
  jr nz, jr_000_03de

  ld a, $ff
  ld [de], a
  ld [de], a
  ld [de], a
  ld a, [de]
  and $1f
  cp $05
  jr nz, jr_000_0431

  ld de, $0000

jr_000_03f4:
  ld a, $ff
  ld [$bd00], a
  ld a, [$bd00]
  cp $ff
  jr z, jr_000_0408

  dec d
  jr nz, jr_000_03f4

  dec e
  jr nz, jr_000_03f4

  jr jr_000_0434

jr_000_0408:
  ld e, $00
  ret


jr_000_040b:
  ld a, $fd
  ld [$bd00], a
  ld a, $ff
  ld [$bd00], a
  ld de, $0000

jr_000_0418:
  ld a, $ff
  ld [$bd00], a
  ld a, [$bd00]
  and $01
  cp $00
  jr nz, jr_000_042e

  inc d
  jr nz, jr_000_0418

  inc e
  jr nz, jr_000_0418

  jr jr_000_0437

jr_000_042e:
  ld e, $00
  ret


jr_000_0431:
  ld e, $d5
  ret


jr_000_0434:
  ld e, $d6
  ret


jr_000_0437:
  ld e, $d7

Jump_000_0439:
  ret


Call_000_043a:
  push bc
  ld bc, $0000

jr_000_043e:
  ld a, [$bd00]
  cp $fe
  jr z, jr_000_0451

  dec c
  jr nz, jr_000_043e

  dec b
  jr nz, jr_000_043e

  call Call_000_0318
  pop bc
  ld e, $d3

jr_000_0451:
  pop bc
  ret


Call_000_0453:
  pop de
  pop de
  ld a, [$bd06]
  and $20
  or $08
  ld [$bd06], a
  ld a, $00
  ld [$bd09], a
  ld a, $00
  ld [$0000], a
  ld [$3000], a
  ld [$4000], a
  ld [$6000], a
  ld a, $01
  ld [$2100], a
  ld [$2000], a
  ld a, e
  ld [$bd07], a

Jump_000_047e:
  jp Jump_000_047e


Call_000_0481:
  ld hl, sp+$02
  ld a, [hl]
  ld [$bd04], a
  ret


Call_000_0488:
  ld hl, sp+$02
  ld a, [hl]
  ld [$bd05], a
  ret


Call_000_048f:
  ld hl, sp+$02
  ld a, [$bd08]
  push af
  ld a, [hl]
  ld [$bd08], a
  ld hl, sp+$05
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call _SRAM;This looks important.
  pop af
  pop af
  ld [$bd08], a
  ret


Call_000_04a8:
  ld a, [$bd06]
  and $fd
  ld [$bd06], a
  ret


Call_000_04b1:
  ld a, [$bd06]
  or $02
  ld [$bd06], a
  ret


Call_000_04ba:
  ld hl, sp+$02
  ld a, [hl+]
  ld [$bd02], a
  ld a, [hl]
  ld [$bd03], a
  ret


Call_000_04c5:
  pop hl
  pop de
  push de
  push hl
  ld a, $00
  ld [$bd02], a
  ld [$bd03], a

jr_000_04d1:
  ld a, $ff
  ld hl, $be00

jr_000_04d6:
  cp [hl]
  jr nz, jr_000_04f0

  inc l
  jr nz, jr_000_04d6

  inc h

jr_000_04dd:
  cp [hl]
  jr nz, jr_000_04f0

  inc l
  jr nz, jr_000_04dd

  ld a, [$bd02]
  inc a
  ld [$bd02], a
  dec e
  jr nz, jr_000_04d1

  ld e, $01
  ret


jr_000_04f0:
  ld e, $00
  ret


Call_000_04f3:
  pop hl
  pop de
  push de
  push hl
  ld a, $00
  ld [$bd02], a
  ld [$bd03], a

jr_000_04ff:
  ld a, $ff
  ld hl, $be00

jr_000_0504:
  ld [hl], a
  inc l
  jr nz, jr_000_0504

  inc h

jr_000_0509:
  ld [hl], a
  inc l
  jr nz, jr_000_0509

  ld a, [$bd02]
  inc a
  ld [$bd02], a
  dec e
  jr nz, jr_000_04ff

  ret


Call_000_0518:
  pop de
  pop hl
  push hl
  push de
  ld de, $be00

jr_000_051f:
  ld a, [de]
  ld [hl+], a
  inc e
  jr nz, jr_000_051f

  inc d

jr_000_0525:
  ld a, [de]
  ld [hl+], a
  inc e
  jr nz, jr_000_0525

  ret


Call_000_052b:
  pop de
  pop hl
  push hl
  push de
  ld de, $be00

jr_000_0532:
  ld a, [hl+]
  ld [de], a
  inc e
  jr nz, jr_000_0532

  inc d

jr_000_0538:
  ld a, [hl+]
  ld [de], a
  inc e
  jr nz, jr_000_0538

  ret


Call_000_053e:
  ldh a, [rKEY1]
  sla a
  jr nc, SetCPUSpeedSlow

  ret


Call_000_0545:
  ldh a, [rKEY1]
  sla a
  jr c, SetCPUSpeedSlow

  ret


SetCPUSpeedSlow:
  ld a, $00
  ldh [rIE], a;disable interrupts
  ld a, P1F_GET_NONE
  ldh [rP1], a
  ld a, KEY1F_PREPARE
  ldh [rKEY1], a
  stop
  ret


Call_000_055b:
jr_000_055b:
  ld a, [$bd0c]
  and $80
  jr nz, jr_000_055b

  ret


Call_000_0563:
  ld a, $20
  ld [$bd0c], a
  ld [$bd0d], a
  call Call_000_055b
  ld a, $11
  ld [$bd0c], a
  ret


Call_000_0574:
Jump_000_0574:
  ld a, $30
  ld [$bd0c], a
  ld [$bd0d], a
  call Call_000_055b
  ret


Call_000_0580:
  ld a, $10
  ld [$bd0c], a
  ret


Call_000_0586:
  ld a, $11
  ld [$bd0c], a
  ret


Call_000_058c:
  ld hl, sp+$02
  ld a, [hl]
  ld [$bd0d], a

jr_000_0592:
  ld a, [$bd0c]
  and $80
  jr nz, jr_000_0592

  ld a, [$bd0c]
  and $01
  ld e, a
  ret


  ld hl, sp+$02
  ld a, [hl]
  ld [$bd0d], a
  call Call_000_055b
  ld a, [$bd0d]
  ld e, a
  ret


  ld a, [$bd0c]
  and $01
  ld e, a
  ret


Call_000_05b5:
  pop hl
  pop hl
  pop de
  ld bc, $bd0d
  add sp, -$06

jr_000_05bd:
  ld a, $ff
  ld [bc], a
  dec de

jr_000_05c1:
  ld a, [$bd0c]
  and $80
  jr nz, jr_000_05c1

  ld a, [bc]
  ld [hl+], a
  ld a, $00
  cp e
  jr nz, jr_000_05bd

  cp d
  jr nz, jr_000_05bd

  ret


Call_000_05d3:
  pop hl
  pop hl
  pop de
  ld bc, $bd0c
  add sp, -$06

jr_000_05db:
  ld a, [hl+]
  ld [$bd0d], a

jr_000_05df:
  ld a, [bc]
  and $80
  jr nz, jr_000_05df

  dec e
  jr nz, jr_000_05db

  ret


Call_000_05e8:
  ld a, [$bd0e]
  ld e, a
  ret


Call_000_05ed:
  ld a, [$bd06]
  and $df
  ld [$bd06], a
  ret


Call_000_05f6:
  ld a, [$bd06]
  or $20
  ld [$bd06], a
  ret


Call_000_05ff:
  ld a, $01
  ld [$bd0f], a
  ret


Call_000_0605:
  ld a, $00
  ld [$bd0f], a
  ret


  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  ld h, $25
  inc b
  dec b
  ld b, $07
  db $10
  ld de, $1612
  rla
  ld a, [de]
  dec de
  inc e
  jr nz, jr_000_0658

  ld [hl+], a
  inc hl
  inc h
  ld b, c
  ld b, d
  ld b, e
  ld b, h
  ld b, l
  ld b, a
  ld c, b
  ld c, c
  ld c, d
  ld c, e
  jr nc, jr_000_0677

  ld [hl-], a
  inc sp
  inc [hl]
  dec [hl]
  ld [hl], $37
  jr c, @+$3b

  ld a, [hl-]
  dec sp
  inc a
  dec a
  ld a, $3f
  ld b, b
  ld c, a
  ld [hl], b
  rst $38

jr_000_0658:
  rrca
  nop
  ld d, e
  ld b, c
  ld d, [hl]
  ld b, l
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38
  rst $38

VBLInterrupt:
  push af
  push bc
  push de
  push hl
  di
  ld a, $a5

jr_000_0677:
  ld [$bd0a], a
  ld a, $04
  ld [$bd06], a
  ld [$0620], sp
  ld sp, $066e
  call Call_000_0914
  and $00
  ldh [rLCDC], a
  ldh [rVBK], a
  and $01
  ldh [rSVBK], a
  ld a, $3e
  ld [$bd03], a
  call Call_000_06af
  call Call_000_06e3
  call Call_000_0713
  call Call_000_0751
  call Call_000_0948
  ld sp, $dfff
  call Call_000_02a9
  jp Jump_000_0a88


Call_000_06af:
  ld a, $40
  ld [$bd02], a
  call Call_000_09af
  ld hl, $be00
  ld a, [$065a]
  ld [hl+], a
  ld a, [$065b]
  ld [hl+], a
  ld a, [$065c]
  ld [hl+], a
  ld a, [$065d]
  ld [hl+], a
  ld a, [$0620]
  ld [hl+], a
  ld a, [$0621]
  ld [hl+], a
  ld a, [$bd14]
  ld [hl+], a
  ld a, [$bd15]
  ld [hl+], a
  ld a, [$bd16]
  ld [hl+], a
  ld a, [$bd17]
  ld [hl+], a
  ret


Call_000_06e3:
  ld a, $41
  ld [$bd02], a
  ld de, _VRAM
  ld c, $10
  call CopyDEtoEndOfSRAM
  ld de, _RAM
  ld c, $10
  call CopyDEtoEndOfSRAM
  call Call_000_092e
  ld de, _OAMRAM
  ld c, $01
  call CopyDEtoEndOfSRAM
  ld a, $00
  ldh [rLCDC], a
  ldh [rNR51], a
  ret


  ld a, e
  add $10
  ld e, a
  ld a, l
  add $10
  ld l, a
  ret


Call_000_0713:
  and $01
  ldh [rSVBK], a
  call Call_000_079a
  ld de, $0000

jr_000_071d:
  push bc
  call CopyDEtoBD02
  call Call_000_04b1
  ld hl, _RAM
  ld c, $10
  call CopyEndOfSRAMtoHL
  ld a, [$bd02]
  sub $10
  add $62
  ld d, $3e
  ld e, a
  call CopyDEtoBD02
  call Call_000_04a8
  ld de, _RAM
  ld c, $10
  call CopyDEtoEndOfSRAM
  ld a, [$bd02]
  sub $62
  ld d, $00
  ld e, a
  pop bc
  dec c
  jr nz, jr_000_071d

  ret


Call_000_0751:
  ld a, $a2
  ld [$bd02], a
  call Call_000_09af
  call Call_000_07af
  ld hl, $be00

jr_000_075f:
  ld a, l
  ldh [rBCPS], a
  ldh a, [rBCPD]
  ld [hl+], a
  ld a, l
  and $3f
  jr nz, jr_000_075f

jr_000_076a:
  ld a, l
  and $3f
  ldh [rOCPS], a
  ldh a, [rOCPD]
  ld [hl+], a
  ld a, l
  and $3f
  jr nz, jr_000_076a

  call IncrementBD02
  ld a, $01
  ldh [rVBK], a
  ld de, _VRAM
  ld c, $10
  call CopyDEtoEndOfSRAM
  ld b, $02
  ld a, b

jr_000_0789:
  ldh [rSVBK], a
  ld de, _RAMBANK
  ld c, $08
  call CopyDEtoEndOfSRAM
  inc b
  ld a, b
  cp $08
  jr nz, jr_000_0789

  ret


Call_000_079a:
  ld c, $01
  ld a, [$01f3]
  cp $00
  jr z, jr_000_07a5

  ld c, $04

jr_000_07a5:
  ret


CopyDEtoBD02:
  ld a, d
  ld [$bd03], a
  ld a, e
  ld [$bd02], a
  ret


Call_000_07af:
  ld a, 1
  ldh [rVBK], a
  ldh a, [rVBK]
  and 1
  jr z, .isDMG

  ld a, $00
  ldh [rVBK], a
  ldh a, [rVBK]
  and 1
  jr nz, .isDMG

  ld a, 1
  ldh [rSVBK], a
  ld a, $00
  ldh [rVBK], a
  ret
.isDMG:
  pop hl;where is this pushed?
  ret


Call_000_07ce:
  di
  ld sp, $066e
  ld a, $04
  ld [$bd06], a
  ld a, $3e
  ld [$bd03], a
  call Call_000_0948
  call Call_000_086c
  call Call_000_0844
  call Call_000_0914
  call Call_000_0948
  call Call_000_08cb
  call Call_000_092e
  call Call_000_0814
  jp Jump_000_09be


jr_000_07f7:
  ld a, $02
  ld [$bd09], a
  ld a, $00
  ld [$bd09], a
  pop hl
  pop de
  pop bc
  ldh a, [rIF]
  and $fe
  ldh [rIF], a

jr_000_080a:
  ldh a, [rIF]
  and $01
  jr z, jr_000_080a

  pop af
  jp VBlankInterrupt


Call_000_0814:
  ld a, $40
  ld [$bd02], a
  ld a, $00
  ld [$bd06], a
  ld a, [$be05]
  ld h, a
  ld a, [$be04]
  ld l, a
  ld sp, hl
  ld hl, $be06
  ld a, [hl+]
  ld [$0000], a
  ld a, [hl+]
  ld [$6000], a
  srl a
  ld [$3000], a
  ld a, [hl+]
  ld [$4000], a
  ld a, [hl+]
  ld [$2100], a
  ld [$2000], a
  jr jr_000_07f7

Call_000_0844:
  ld a, $41
  ld [$bd02], a
  ld hl, _VRAM
  ld c, $10
  call CopyEndOfSRAMtoHL
  ld hl, _RAM
  ld c, $10
  call CopyEndOfSRAMtoHL
  ld hl, _OAMRAM
  ld de, $be00
  ld hl, $ff80
  ld de, $bf80
  call Copy256FromDEtoHL
  call CopySRAMtoIO
  ret


Call_000_086c:
  and $01
  ldh [rSVBK], a
  call Call_000_079a
  ld de, $3e62

jr_000_0876:
  push bc
  call CopyDEtoBD02
  call Call_000_04a8
  ld hl, _RAM
  ld c, $10
  call CopyEndOfSRAMtoHL
  ld a, [$bd02]
  sub $72
  ld d, $00
  ld e, a
  call CopyDEtoBD02
  call Call_000_04b1
  ld de, _RAM
  ld c, $10
  call CopyDEtoEndOfSRAM
  ld a, [$bd02]
  add $62
  ld d, $3e
  ld e, a
  pop bc
  dec c
  jr nz, jr_000_0876

  ld a, $3e
  ld [$bd03], a
  call Call_000_04a8
  ret


Call_000_08b0:
  ldh a, [rIE]
  ld b, a
  ld a, $61
  ld [$bd02], a
  ld a, [$bf4d]
  and $80
  jr nz, jr_000_08c4

  call Call_000_0545
  jr jr_000_08c7

jr_000_08c4:
  call Call_000_053e

jr_000_08c7:
  ld a, b
  ldh [rIE], a
  ret


Call_000_08cb:
  call Call_000_07af
  call Call_000_08b0
  ld a, $a2
  ld [$bd02], a
  ld hl, $be00

jr_000_08d9:
  ld a, l
  ldh [rBCPS], a
  ld a, [hl+]
  ldh [rBCPD], a
  ld a, l
  and $3f
  jr nz, jr_000_08d9

jr_000_08e4:
  ld a, l
  and $3f
  ldh [rOCPS], a
  ld a, [hl+]
  ldh [rOCPD], a
  ld a, l
  and $3f
  jr nz, jr_000_08e4

  call IncrementBD02
  ld a, $01
  ldh [rVBK], a
  ld hl, _VRAM
  ld c, $10
  call CopyEndOfSRAMtoHL
  ld b, $02
  ld a, b

jr_000_0903:
  ldh [rSVBK], a
  ld hl, _RAMBANK
  ld c, $08
  call CopyEndOfSRAMtoHL
  inc b
  ld a, b
  cp $08
  jr nz, jr_000_0903

  ret


Call_000_0914:
  ldh a, [rLCDC]
  ld [$0622], a
  ldh a, [rVBK]
  ld [$0624], a
  ldh a, [rSVBK]
  ld [$0623], a
  ldh a, [rBCPS]
  ld [$0625], a
  ldh a, [rOCPS]
  ld [$0626], a
  ret


Call_000_092e:
  ld a, [$0622]
  ldh [rLCDC], a
  ld a, [$0624]
  ldh [rVBK], a
  ld a, [$0623]
  ldh [rSVBK], a
  ld a, [$0625]
  ldh [rBCPS], a
  ld a, [$0626]
  ldh [rOCPS], a
  ret


Call_000_0948:
  ld a, $00
  ldh [rLCDC], a
  ldh [rVBK], a
  ld a, $01
  ldh [rSVBK], a
  ret


  ld a, $00
  ld [$bd07], a
  ld a, $04
  ld [$bd09], a
  ld a, $00
  ld [$bd09], a
  jp Jump_000_09be


CopyEndOfSRAMtoHL::;hl = address, c = count
  ld de, $be00;last 512 bytes of _SRAM
  call Copy512FromDEtoHL
  call IncrementBD02
  dec c
  jr nz, CopyEndOfSRAMtoHL

  ret


CopyDEtoEndOfSRAM::;de = address, c = count
  ld hl, $be00
  call Copy512FromDEtoHL
  call IncrementBD02
  dec c
  jr nz, CopyDEtoEndOfSRAM

  ret


IncrementBD02:
  ld a, [$bd02]
  inc a
  ld [$bd02], a
  ret


Copy512FromDEtoHL:
.first256BytesLoop:
    ld a, [de]
    ld [hl+], a
    inc e
    jr nz, .first256BytesLoop
  inc d
second256BytesLoop:
    ld a, [de]
    ld [hl+], a
    inc e
    jr nz, second256BytesLoop
  inc d
  ret


Copy256FromDEtoHL:
    ld a, [de]
    ld [hl+], a
    inc e
    jr nz, Copy256FromDEtoHL
  ret


CopySRAMtoIO:
  ld hl, $0627;a table maybe?
  ld bc, _IO
  ld de, $bf00;last 256 bytes of _SRAM
.loopTable:
    ld a, [hl+]
    ld c, a
    ld e, a
    cp $00
    jr nz, .loadSRAMIntoIO
  ret
.loadSRAMIntoIO:
  ld a, [de]
  ld [bc], a
  jr .loopTable

Call_000_09af:
  ld hl, $be00
  ld a, $ff
  ld c, $80

jr_000_09b6:
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  dec c
  jr nz, jr_000_09b6

  ret


Jump_000_09be:
jr_000_09be:
  jr jr_000_09be

  nop

WaitVBL:;maybe?
  ld a, $00;clear interrupt flags
  ldh [rIF], a

.waitVBL:
  ldh a, [rIF]
  and $01
  jr z, .waitVBL

  ret


Call_000_09cc:
Jump_000_09cc:
  ld bc, _SCRN0
  ld hl, $c144
  ld d, $14

jr_000_09d4:
  ldh a, [rSTAT]
  and $02
  jr nz, jr_000_09d4

  ld a, [hl+]
  ld [bc], a
  inc c
  dec d
  jr nz, jr_000_09d4

  ld d, $14
  ld a, c
  add $0c
  ld c, a
  jr nz, jr_000_09d4

  inc b
  ld a, b
  cp $9b
  jr nz, jr_000_09d4

  ret


Call_000_09ef:
  pop hl
  pop hl
  pop bc
  pop de
  add sp, -$08

jr_000_09f5:
  ld a, [hl+]
  ld [bc], a
  inc bc
  dec de
  ld a, $00
  cp e
  jr nz, jr_000_09f5

  cp d
  jr nz, jr_000_09f5

  ret


Call_000_0a02:
  pop hl
  pop hl
  pop bc
  add sp, -$01
  pop de
  add sp, -$07

jr_000_0a0a:
  ld a, c
  ld [hl+], a
  dec de
  ld a, $00
  cp e
  jr nz, jr_000_0a0a

  cp d
  jr nz, jr_000_0a0a

  ret

UpdateInput:;puts button state in e
  ld a, P1F_GET_DPAD
  ldh [rP1], a
REPT 4;multiple cycles to avoid button bounce
  ldh a, [rP1];load dPad
ENDR
  and a, $F
  ld e, a
  ld a, P1F_GET_BTN
  ldh [rP1], a
  sla e
  sla e
  sla e
  sla e
REPT 4
  ldh a, [rP1];load buttons
ENDR
  and a, $F
  or e
  cpl
  ld e, a
  ld a, P1F_GET_NONE
  ldh [rP1], a
  
  ; ld hl, wGamepadState
  ; ld [hl], e;store button state

  ;process keyboard here
  ret


Call_000_0a43:
  ld a, $01
  push af
  inc sp
  call Call_000_1e04
  inc sp
  ld de, $0a7d
  push de
  call Call_000_216d
  add sp, $02
  call Call_000_09cc
  call Call_000_0d43
  ld a, e
  or a
  jr z, jr_000_0a66

  push af
  inc sp
  call Call_000_1dd0
  inc sp

jr_000_0a64:
  jr jr_000_0a64

jr_000_0a66:
  ld hl, $0000
  push hl
  ld a, $04
  push af
  inc sp
  call Call_000_048f
  add sp, $03
  ld d, e
  push de
  inc sp
  call Call_000_1dd0
  inc sp
  jr jr_000_0a66

  ret


  ld c, a
  ld d, e
  jr nz, jr_000_0aea

  ld l, [hl]
  ld l, c
  ld [hl], h
  ld l, $2e
  ld l, $00

Jump_000_0a88:
  ld hl, $fde3
  add hl, sp
  ld sp, hl
  ld hl, sp+$00
  ld a, l
  ld d, h
  ld hl, $0217
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $dc
  inc hl
  ld [hl], $0c
  ld hl, $0218
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $e9
  ld [bc], a
  inc bc
  ld a, $0c
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $f4
  inc hl
  ld [hl], $0c
  ld hl, $0218
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $ff
  inc hl
  ld [hl], $0c
  ld hl, $0218
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, $020a
  add hl, sp

jr_000_0aea:
  ld a, l
  ld d, h
  ld hl, $021b
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $dc
  inc hl
  ld [hl], $0c
  ld hl, $021c
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $0c
  ld [bc], a
  inc bc
  ld a, $0d
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $18
  inc hl
  ld [hl], $0d
  ld hl, $021c
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $22
  inc hl
  ld [hl], $0d
  ld hl, $021c
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $05
  inc hl
  ld [hl], $00
  xor a
  push af
  inc sp
  call Call_000_1e04
  inc sp
  ld hl, $0218
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  xor a
  push af
  inc sp
  push de
  call $67e6
  add sp, $03
  ld hl, $0216
  add hl, sp
  ld [hl], e

jr_000_0b5e:
  call GetInput
  ld a, e
  or a
  jr nz, jr_000_0b5e

  call Call_000_214d
  xor a
  push af
  inc sp
  call Call_000_2268
  inc sp
  ld hl, $0800
  push hl
  call Call_000_2209
  add sp, $02
  ld de, $0d33
  push de
  call Call_000_2193
  add sp, $02
  call Call_000_09cc
  ld hl, $0216
  add hl, sp
  ld a, [hl]
  or a
  jp nz, Jump_000_0c07

  ld hl, sp+$0a
  ld a, l
  ld d, h
  ld hl, $0217
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  inc hl
  ld [hl+], a
  ld [hl], e
  ld hl, $0214
  add hl, sp
  ld [hl], $00
  inc hl
  ld [hl], $00

Jump_000_0ba6:
  call Call_000_04a8
  ld hl, $0215
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $3e40
  add hl, de
  ld c, l
  ld b, h
  push bc
  call Call_000_04ba
  add sp, $02
  ld hl, $0218
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call Call_000_0518
  add sp, $02
  call Call_000_04b1
  ld hl, $0215
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0040
  add hl, de
  ld c, l
  ld b, h
  push bc
  call Call_000_04ba
  add sp, $02
  ld hl, $021a
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call Call_000_052b
  add sp, $02
  ld hl, $0214
  add hl, sp
  inc [hl]
  jr nz, jr_000_0bf9

  inc hl
  inc [hl]

jr_000_0bf9:
  ld hl, $0214
  add hl, sp
  ld a, [hl]
  sub $a4
  inc hl
  ld a, [hl]
  sbc $00
  jp c, Jump_000_0ba6

Jump_000_0c07:
  ld hl, $0216
  add hl, sp
  ld a, [hl]
  dec a
  jp nz, Jump_000_0cc2

  call Call_000_04b1
  ld hl, $0040
  push hl
  call Call_000_04ba
  add sp, $02
  ld de, $0d3e
  ld a, $04
  push af
  inc sp
  push de
  ld hl, $be00
  push hl
  call Call_000_2b5a
  add sp, $05
  ld a, e
  or a
  jr nz, jr_000_0c48

  call Call_000_214d
  ld hl, $021c
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  xor a
  push af
  inc sp
  push de
  call $67e6
  add sp, $03
  call Call_000_07ce

jr_000_0c48:
  ld hl, sp+$0a
  ld a, l
  ld d, h
  ld hl, $0219
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  inc hl
  ld [hl+], a
  ld [hl], e
  ld hl, $0214
  add hl, sp
  ld [hl], $00
  inc hl
  ld [hl], $00

Jump_000_0c61:
  call Call_000_04b1
  ld hl, $0215
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0040
  add hl, de
  ld c, l
  ld b, h
  push bc
  call Call_000_04ba
  add sp, $02
  ld hl, $021a
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call Call_000_0518
  add sp, $02
  call Call_000_04a8
  ld hl, $0215
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $3e40
  add hl, de
  ld c, l
  ld b, h
  push bc
  call Call_000_04ba
  add sp, $02
  ld hl, $021c
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call Call_000_052b
  add sp, $02
  ld hl, $0214
  add hl, sp
  inc [hl]
  jr nz, jr_000_0cb4

  inc hl
  inc [hl]

jr_000_0cb4:
  ld hl, $0214
  add hl, sp
  ld a, [hl]
  sub $a4
  inc hl
  ld a, [hl]
  sbc $00
  jp c, Jump_000_0c61

Jump_000_0cc2:
  ld hl, $0216
  add hl, sp
  ld a, [hl]
  sub $02
  jr nz, jr_000_0cd3

  ld hl, $01f2
  ld [hl], $01
  call EntryPoint

jr_000_0cd3:
  call Call_000_07ce
  ld hl, $021d
  add hl, sp
  ld sp, hl
  ret


  ld c, c
  ld l, [hl]
  jr nz, jr_000_0d27

  ld h, c
  ld l, l
  ld h, l
  jr nz, jr_000_0d32

  ld h, l
  ld l, [hl]
  ld [hl], l
  nop
  ld d, e
  ld h, c
  db $76
  ld h, l
  jr nz, jr_000_0d42

  ld [hl], h
  ld h, c
  ld [hl], h
  ld h, l
  nop
  ld c, h
  ld l, a
  ld h, c
  ld h, h
  jr nz, @+$55

  ld [hl], h
  ld h, c
  ld [hl], h
  ld h, l
  nop
  ld b, d
  ld h, c
  ld h, e
  ld l, e
  jr nz, @+$76

  ld l, a
  jr nz, jr_000_0d75

  ld h, l
  ld l, [hl]
  ld [hl], l
  nop
  ld [hl], h
  ld l, b
  ld h, l
  ld [hl], d
  ld h, l
  jr nz, @+$6b

  ld [hl], e
  jr nz, @+$70

  ld l, a
  nop
  ld [hl], e
  ld h, c
  db $76
  ld h, l
  jr nz, jr_000_0d82

  ld h, c
  ld [hl], h
  ld h, c
  nop
  ld h, [hl]
  ld l, a
  ld [hl], d
  jr nz, jr_000_0d8a

jr_000_0d27:
  ld [hl], l
  ld [hl], d
  ld [hl], d
  ld h, l
  ld l, [hl]
  ld [hl], h
  jr nz, jr_000_0d96

  ld h, c
  ld l, l
  ld h, l

jr_000_0d32:
  nop
  ld c, h
  ld l, a
  ld h, c
  ld h, h
  ld l, c
  ld l, [hl]
  ld h, a
  ld l, $2e
  ld l, $00
  ld d, e
  ld b, c
  ld d, [hl]
  ld b, l

jr_000_0d42:
  nop

Call_000_0d43:
  add sp, -$07
  call Call_000_0574
  call Call_000_0574
  call Call_000_05f6
  ld de, _RAM
  ld hl, $002b
  push hl
  xor a
  push af
  inc sp
  push de
  call Call_000_0a02
  add sp, $05
  call Call_000_1f83
  ld a, e
  ld de, $c001
  ld [de], a
  ld bc, $c004
  ld hl, $01f1
  ld a, [hl]
  ld [bc], a
  ld [hl], $00
  ld a, [$c001]
  sub $03

jr_000_0d75:
  jr nz, jr_000_0d7a

  call Call_000_053e

jr_000_0d7a:
  call Call_000_262c
  ld a, e
  or a
  jp nz, Jump_000_0e50

jr_000_0d82:
  call Call_000_2ec6
  ld a, e
  or a
  jp nz, Jump_000_0e50

jr_000_0d8a:
  call Call_000_0ec8
  ld a, e
  or a
  jp nz, Jump_000_0e50

  call Call_000_0fcb
  ld a, e

jr_000_0d96:
  cp $35
  jr z, jr_000_0d9e

  sub $f0
  jr nz, jr_000_0db0

jr_000_0d9e:
  call Call_000_0f9c
  ld a, e
  or a
  jp nz, Jump_000_0e50

  ld a, $35
  push af
  inc sp
  call Call_000_1dd0
  inc sp
  jr jr_000_0db5

jr_000_0db0:
  ld a, e
  or a
  jp nz, Jump_000_0e50

jr_000_0db5:
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
  call Call_000_048f
  add sp, $03
  ld a, [$c007]
  or a
  jr nz, jr_000_0ddd

  call Call_000_05ff
  jr jr_000_0de0

jr_000_0ddd:
  call Call_000_0605

jr_000_0de0:
  ld b, $00
  ld de, $c002
  ld a, [de]
  ld c, a
  or a
  jr z, jr_000_0df0

  call $5a35
  ld b, e
  jr jr_000_0dfe

jr_000_0df0:
  ld a, [$c008]
  or a
  jr z, jr_000_0dfe

  xor a
  push af
  inc sp
  call Call_000_0e53
  inc sp
  ld b, e

jr_000_0dfe:
  ld a, b
  or a
  jr z, jr_000_0e21

  push bc
  ld hl, $0100
  push hl
  call Call_000_04f3
  add sp, $02
  pop bc
  push bc
  inc sp
  call Call_000_1dd0
  inc sp
  ld a, [$c008]
  or a
  jr z, jr_000_0e21

  ld a, $01
  push af
  inc sp
  call Call_000_0e53
  inc sp

jr_000_0e21:
  ld hl, $01f0
  ld a, [hl]
  or a
  jr z, jr_000_0e31

  ld [hl], $00
  call $6334
  ld a, e
  or a
  jr nz, jr_000_0e50

jr_000_0e31:
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
  jr nc, jr_000_0e4e

  ld e, $52
  jr jr_000_0e50

jr_000_0e4e:
  ld e, $00

Jump_000_0e50:
jr_000_0e50:
  add sp, $07
  ret


Call_000_0e53:
  add sp, -$02
  ld hl, sp+$00
  ld [hl], $00
  ld hl, $00ff
  push hl
  call Call_000_04ba
  add sp, $02
  call Call_000_04b1
  ld hl, sp+$01
  ld [hl], $00

jr_000_0e69:
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
  jr z, jr_000_0e7e

  ld hl, sp+$01
  ld a, [hl]
  ld [bc], a

jr_000_0e7e:
  ld a, [bc]
  ld d, a
  ld hl, sp+$01
  ld a, [hl]
  sub d
  jr z, jr_000_0e8a

  ld hl, sp+$00
  ld [hl], $38

jr_000_0e8a:
  ld hl, sp+$01
  inc [hl]
  ld a, [hl]
  sub $10
  jr c, jr_000_0e69

  ld a, [$c033]
  sub $0f
  jr nz, jr_000_0e9c

  dec hl
  ld [hl], $00

jr_000_0e9c:
  ld hl, sp+$00
  ld e, [hl]
  add sp, $02
  ret


Call_000_0ea2:
  pop bc
  pop de
  push de
  push bc
  ld hl, $0013
  push hl
  push de
  ld hl, _VRAM
  push hl
  call $58ba
  add sp, $06
  ret


Call_000_0eb5:
  pop bc
  pop de
  push de
  push bc
  ld hl, $0013
  push hl
  push de
  ld hl, _VRAM
  push hl
  call $5941
  add sp, $06
  ret


Call_000_0ec8:
  add sp, -$80
  add sp, -$69
  ld hl, sp+$00
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  push bc
  ld hl, $0f66
  push hl
  push de
  call $55cb
  add sp, $04
  pop bc
  ld a, e
  or a
  jr z, jr_000_0ee8

  ld a, e
  sub $f1
  jp nz, Jump_000_0f61

jr_000_0ee8:
  ld e, c
  ld d, b
  push bc
  ld hl, $0f73
  push hl
  push de
  call $55cb
  add sp, $04
  pop bc
  ld a, e
  or a
  jr z, jr_000_0f00

  ld a, e
  sub $f1
  jp nz, Jump_000_0f61

jr_000_0f00:
  ld e, c
  ld d, b
  push bc
  ld hl, $0f82
  push hl
  push de
  call $55cb
  add sp, $04
  pop bc
  ld a, e
  or a
  jr z, jr_000_0f18

  ld a, e
  sub $f1
  jp nz, Jump_000_0f61

jr_000_0f18:
  ld e, c
  ld d, b
  push bc
  ld a, $01
  push af
  inc sp
  ld hl, $c027
  push hl
  push de
  ld hl, $0f8f
  push hl
  call $4106
  add sp, $07
  pop bc
  ld a, e
  or a
  jp nz, Jump_000_0f61

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
  ld de, $c027
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

Jump_000_0f61:
  add sp, $7f
  add sp, $6a
  ret


  cpl
  ld b, a
  ld b, d
  ld b, e
  ld d, e
  ld e, c
  ld d, e
  cpl
  ld d, e
  ld b, c
  ld d, [hl]
  ld b, l
  nop
  cpl
  ld b, a
  ld b, d
  ld b, e
  ld d, e
  ld e, c
  ld d, e
  cpl
  ld b, e
  ld c, b
  ld b, l
  ld b, c
  ld d, h
  ld d, e
  nop
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
  cpl
  ld b, a
  ld b, d
  ld b, e
  ld d, e
  ld e, c
  ld d, e
  jr nz, @+$22

  jr nz, @+$22

  jr nz, jr_000_0f9c

Call_000_0f9c:
jr_000_0f9c:
  ld de, $c02b
  ld hl, $0109
  push hl
  xor a
  push af
  inc sp
  push de
  call Call_000_0a02
  add sp, $05
  ld hl, $c02b
  ld [hl], $34
  inc hl
  ld [hl], $12
  ld hl, $c02d
  ld [hl], $01
  ld bc, $c02e
  xor a
  ld [bc], a
  ld hl, $c030
  ld [hl], $01
  call Call_000_1041
  ld a, e
  or a
  ret nz

  ld e, a
  ret


Call_000_0fcb:
  add sp, -$02
  ld de, $102d
  ld hl, $0109
  push hl
  ld hl, $c02b
  push hl
  push de
  call Call_000_10ac
  add sp, $06
  ld a, e
  or a
  jp nz, Jump_000_102a

  ld de, $c02b
  ld hl, $0000
  push hl
  ld hl, $0107
  push hl
  push de
  call Call_000_124a
  add sp, $06
  inc sp
  inc sp
  push de
  ld de, $c02b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld a, b
  sub $34
  jr nz, jr_000_101c

  ld a, c
  sub $12
  jr nz, jr_000_101c

  ld de, $c132
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, sp+$00
  ld a, [hl]
  sub b
  jr nz, jr_000_101c

  inc hl
  ld a, [hl]
  sub c
  jr z, jr_000_1020

jr_000_101c:
  ld e, $35
  jr jr_000_102a

jr_000_1020:
  ld bc, $c02e
  ld a, [bc]
  ld hl, $09c0
  ld [hl], a
  ld e, $00

Jump_000_102a:
jr_000_102a:
  add sp, $02
  ret


  cpl
  ld b, a
  ld b, d
  ld b, e
  ld d, e
  ld e, c
  ld d, e
  cpl
  ld d, d
  ld b, l
  ld b, a
  ld c, c
  ld d, e
  ld d, h
  ld d, d
  ld e, c
  ld b, d
  ld c, c
  ld c, [hl]
  nop

Call_000_1041:
  add sp, -$80
  add sp, -$65
  ld de, $c02b
  ld hl, $0000
  push hl
  ld hl, $0107
  push hl
  push de
  call Call_000_124a
  add sp, $06
  ld b, e
  ld c, d
  ld hl, $c132
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$00
  ld c, l
  ld b, h
  ld de, $1098
  ld hl, $0001
  push hl
  push bc
  push de
  call $4067
  add sp, $06
  ld a, e
  or a
  jr nz, jr_000_1093

  ld de, $c02b
  ld a, $01
  push af
  inc sp
  ld hl, $0001
  push hl
  push de
  call $49c2
  add sp, $05
  ld a, e
  or a
  jr nz, jr_000_1093

  ld bc, $c02e
  ld a, [bc]
  ld hl, $09c0
  ld [hl], a
  ld e, $00

jr_000_1093:
  add sp, $7f
  add sp, $66
  ret


  cpl
  ld b, a
  ld b, d
  ld b, e
  ld d, e
  ld e, c
  ld d, e
  cpl
  ld d, d
  ld b, l
  ld b, a
  ld c, c
  ld d, e
  ld d, h
  ld d, d
  ld e, c
  ld b, d
  ld c, c
  ld c, [hl]
  nop

Call_000_10ac:
  ld hl, $fd17
  add hl, sp
  ld sp, hl
  ld hl, $02ee
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$00
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
  call $4067
  add sp, $06
  pop bc
  ld a, e
  or a
  jp nz, Jump_000_116f

  ld hl, $02e7
  add hl, sp
  ld [hl], c
  inc hl
  ld [hl], b

Jump_000_10dd:
  ld hl, $02f0
  add hl, sp
  ld a, [hl-]
  or [hl]
  jp z, Jump_000_116d

  ld hl, $02e5
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
  jr nc, jr_000_1108

  ld hl, $02ef
  add hl, sp
  ld a, [hl+]
  ld e, [hl]
  ld hl, $02e5
  add hl, sp
  ld [hl+], a
  ld [hl], e

jr_000_1108:
  ld hl, $02f0
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $02e5
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
  ld hl, $00e5
  add hl, sp
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
  call Call_000_3cf6
  add sp, $05
  pop bc
  ld a, e
  or a
  jp nz, Jump_000_116f

  ld hl, $02e8
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $02e5
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  push bc
  call Call_000_09ef
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
  jp Jump_000_10dd


Jump_000_116d:
  ld e, $00

Jump_000_116f:
  ld c, l
  ld b, h
  ld hl, $02e9
  add hl, sp
  ld sp, hl
  ld l, c
  ld h, b
  ret


Call_000_1179:
  ld de, $c00d
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld e, b
  ld d, c
  ret


Call_000_1184:
  add sp, -$0b
  ld de, $c00f
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  sla b
  rl c
  ld hl, sp+$00
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
  call $6c53
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
  call $6c53
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
  ld a, [hl-]
  dec hl
  ld [hl], a
  pop hl
  ld hl, $0000
  push hl
  ld hl, $003c
  push hl
  push bc
  push de
  call $6c4d
  add sp, $08
  ld b, l
  ld c, h
  ld hl, sp+$06
  ld [hl], e
  ld hl, $0000
  push hl
  ld hl, $003c
  push hl
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
  call $6c4d
  add sp, $08
  ld b, l
  ld c, h
  ld hl, sp+$04
  ld [hl], e
  inc hl
  ld e, [hl]
  ld d, $00
  ld a, e
  swap a
  rrca
  and $f8
  ld e, a
  ld d, $00
  inc hl
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
  dec hl
  dec hl
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


Call_000_124a:
  add sp, -$04
  ld hl, sp+$06
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$02
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$09
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

Jump_000_125a:
  inc sp
  inc sp
  push bc
  dec bc
  ld hl, sp+$01
  ld a, [hl-]
  or [hl]
  jr z, jr_000_128a

  ld hl, sp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  dec hl
  inc [hl]
  jr nz, jr_000_1271

  inc hl
  inc [hl]

jr_000_1271:
  ld d, a
  ld e, $00
  ld hl, sp+$00
  ld [hl], d
  inc hl
  ld [hl], e
  pop de
  push de
  ld hl, sp+$0a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$0a
  ld [hl+], a
  ld [hl], d
  jp Jump_000_125a


jr_000_128a:
  ld hl, sp+$0b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  add sp, $04
  ret


Call_000_1293:
  ld hl, $fddc
  add hl, sp
  ld sp, hl
  ld hl, $0202
  add hl, sp
  ld a, l
  ld d, h
  ld hl, $0222
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $03
  ld hl, $0223
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
  ld hl, $0223
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
  ld hl, $0223
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
  ld a, $17
  ld [bc], a
  ld hl, $0223
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
  ld a, $1e
  ld [bc], a
  ld hl, $0223
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
  ld hl, $0223
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
  call Call_000_3a3f
  add sp, $04
  ld c, e
  ld a, c
  or a
  jr z, jr_000_1366

  ld e, c
  jp Jump_000_1738


jr_000_1366:
  ld hl, sp+$00
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
  call Call_000_3cf6
  add sp, $05
  pop bc
  ld a, e
  or a
  jp nz, Jump_000_1738

  ld hl, $0228
  add hl, sp
  ld a, [hl+]
  ld e, [hl]
  ld hl, $0214
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
  ld hl, $021e
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  inc hl
  ld [hl+], a
  ld [hl], e
  ld hl, HeaderTitle
  add hl, bc
  ld a, l
  ld d, h
  ld hl, $0218
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
  ld hl, $0224
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call Call_000_09ef
  add sp, $06
  pop bc
  ld hl, HeaderCGBFlag
  add hl, bc
  ld c, l
  ld b, h
  ld hl, $0200
  add hl, sp
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
  ld hl, $0218
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld hl, $0213
  add hl, sp
  ld [hl], $05
  ld a, b
  or a
  jr nz, jr_000_13f6

  ld [hl], $04

jr_000_13f6:
  ld a, b
  sub $01
  jr c, jr_000_1406

  ld a, $03
  sub b
  jr c, jr_000_1406

  ld hl, $0213
  add hl, sp
  ld [hl], $01

jr_000_1406:
  ld a, b
  sub $05
  jr c, jr_000_1416

  ld a, $06
  sub b
  jr c, jr_000_1416

  ld hl, $0213
  add hl, sp
  ld [hl], $02

jr_000_1416:
  ld a, b
  sub $08
  jr c, jr_000_1426

  ld a, $09
  sub b
  jr c, jr_000_1426

  ld hl, $0213
  add hl, sp
  ld [hl], $04

jr_000_1426:
  ld a, b
  sub $0f
  jr c, jr_000_1436

  ld a, $13
  sub b
  jr c, jr_000_1436

  ld hl, $0213
  add hl, sp
  ld [hl], $03

jr_000_1436:
  ld a, b
  sub $19
  jr c, jr_000_1446

  ld a, $1e
  sub b
  jr c, jr_000_1446

  ld hl, $0213
  add hl, sp
  ld [hl], $05

jr_000_1446:
  ld hl, $0215
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  dec hl
  dec hl
  ld a, [hl]
  ld [de], a
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld a, l
  ld d, h
  ld hl, $0220
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
  jr z, jr_000_1471

  sub $10
  jr nz, jr_000_147a

jr_000_1471:
  ld hl, $0220
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $01

jr_000_147a:
  ld hl, $0215
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0002
  add hl, de
  ld a, l
  ld d, h
  ld hl, $0220
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $03
  ld hl, $0201
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
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  dec a
  jr nz, jr_000_14b5

  ld a, $01
  jr jr_000_14b6

jr_000_14b5:
  xor a

jr_000_14b6:
  ld d, a
  ld a, b
  sub $02
  jr nz, jr_000_14c0

  ld a, $01
  jr jr_000_14c1

jr_000_14c0:
  xor a

jr_000_14c1:
  or d
  jr z, jr_000_14cd

  ld hl, $0220
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00

jr_000_14cd:
  ld hl, $0217
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $03
  jr nz, jr_000_14e3

  ld hl, $0220
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $03

jr_000_14e3:
  ld hl, $0217
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $04
  jr nz, jr_000_14f9

  ld hl, $0220
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $0f

jr_000_14f9:
  ld hl, $0217
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $05
  jr nz, jr_000_150f

  ld hl, $0220
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $07

jr_000_150f:
  ld hl, $0213
  add hl, sp
  ld a, [hl]
  sub $02
  jr nz, jr_000_1521

  ld hl, $0220
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00

jr_000_1521:
  ld hl, $0213
  add hl, sp
  ld a, [hl]
  sub $05
  jr nz, jr_000_154c

  ld de, $1742
  ld a, $04
  push af
  inc sp
  ld hl, $021f
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call Call_000_2cb1
  add sp, $05
  ld a, e
  or a
  jr z, jr_000_154c

  ld hl, $0220
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $0f

jr_000_154c:
  ld hl, $0215
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0003
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
  ld hl, $020e
  add hl, sp
  ld [hl], $00

Jump_000_156c:
  ld hl, $0223
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $020e
  add hl, sp
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld b, a
  or a
  jr z, jr_000_15a4

  ld hl, $0219
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld c, a
  ld a, b
  sub c
  jr nz, jr_000_159c

  ld hl, $0216
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $01
  jr jr_000_15a4

jr_000_159c:
  ld hl, $020e
  add hl, sp
  inc [hl]
  jp Jump_000_156c


jr_000_15a4:
  ld hl, $0215
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0001
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
  ld hl, $020f
  add hl, sp
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
  ld hl, $00e0
  add hl, bc
  ld c, l
  ld b, h

Jump_000_15db:
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, $021a
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
  ld hl, $020f
  add hl, sp
  ld d, h
  ld e, l
  ld hl, $021a
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
  jp nc, Jump_000_1633

  ld hl, $0217
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
  ld hl, $020f
  add hl, sp
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  jp Jump_000_15db


Jump_000_1633:
  ld hl, $0215
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld a, l
  ld d, h
  ld hl, $021a
  add hl, sp
  ld [hl+], a
  ld [hl], d
  ld hl, $0201
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  ld a, [bc]
  sub $03
  jr nz, jr_000_165b

  ld b, $01
  jr jr_000_165d

jr_000_165b:
  ld b, $00

jr_000_165d:
  ld hl, $021a
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, $0215
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld a, l
  ld d, h
  ld hl, $021a
  add hl, sp
  ld [hl+], a
  ld [hl], d
  ld hl, $0201
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  sub $80
  jr nz, jr_000_168b

  ld b, $01
  jr jr_000_1696

jr_000_168b:
  ld a, b
  sub $c0
  jr nz, jr_000_1694

  ld b, $02
  jr jr_000_1696

jr_000_1694:
  ld b, $00

jr_000_1696:
  ld hl, $021a
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, $0217
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld hl, $020e
  add hl, sp
  ld [hl], $01

jr_000_16ae:
  ld a, b
  or a
  jr z, jr_000_16bc

  ld hl, $020e
  add hl, sp
  sla [hl]
  srl b
  jr jr_000_16ae

jr_000_16bc:
  ld hl, $0215
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0007
  add hl, de
  ld c, l
  ld b, h
  ld hl, $020e
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
  ld hl, $0221
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  ld hl, $021a
  add hl, sp
  ld [hl], $01

jr_000_16fe:
  ld a, b
  or a
  jr z, jr_000_170c

  ld hl, $021a
  add hl, sp
  sla [hl]
  srl b
  jr jr_000_16fe

jr_000_170c:
  ld hl, $0215
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0009
  add hl, de
  ld c, l
  ld b, h
  ld hl, $021a
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

Jump_000_1738:
  ld c, l
  ld b, h
  ld hl, $0224
  add hl, sp
  ld sp, hl
  ld l, c
  ld h, b
  ret


  ld c, h
  ld d, e
  ld b, h
  ld c, d
  nop

Call_000_1747:
  call Call_000_214d
  ld a, $07
  push af
  inc sp
  call Call_000_21e0
  inc sp
  xor a
  push af
  inc sp
  call Call_000_2268
  inc sp
  ld de, $1765
  push de
  call Call_000_2193
  add sp, $02
  jp Jump_000_09cc


  ld c, h
  ld l, a
  ld h, c
  ld h, h
  ld l, c
  ld l, [hl]
  ld h, a
  ld l, $2e
  ld l, $00

Call_000_1770:
  add sp, -$25
  ld hl, sp+$27
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$1b
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00e0
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, sp+$21
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
  ld hl, sp+$21
  ld a, $00
  sub [hl]
  inc hl
  ld a, $00
  sbc [hl]
  inc hl
  ld a, $80
  sbc [hl]
  inc hl
  ld a, $00
  sbc [hl]
  jr nc, jr_000_17ab

  ld e, $30
  jp Jump_000_1942


jr_000_17ab:
  call Call_000_1747
  ld bc, $c007
  ld a, [bc]
  ld hl, sp+$00
  ld [hl], a
  ld hl, sp+$06
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  push bc
  push de
  call Call_000_0ea2
  add sp, $02
  pop bc
  ld a, e
  or a
  jp nz, Jump_000_1942

  ld de, $c131
  ld a, [de]
  ld hl, sp+$21
  ld [hl], a
  ld hl, $000c
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$19
  ld [hl+], a
  ld [hl], d
  ld hl, sp+$21
  ld a, [hl]
  or a
  jp z, Jump_000_1853

  ld de, $c128
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
  ld hl, sp+$1a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$1d
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl+], a
  ld a, [hl]
  ld hl, sp+$1d
  sub [hl]
  jp nz, Jump_000_1853

  ld hl, sp+$22
  ld a, [hl]
  ld hl, sp+$1e
  sub [hl]
  jp nz, Jump_000_1853

  ld hl, sp+$23
  ld a, [hl]
  ld hl, sp+$1f
  sub [hl]
  jp nz, Jump_000_1853

  ld hl, sp+$24
  ld a, [hl]
  ld hl, sp+$20
  sub [hl]
  jr nz, jr_000_1853

  ld hl, sp+$00
  ld a, [hl]
  or a
  jr z, jr_000_1849

  push bc
  call $6334
  pop bc
  ld a, e
  or a
  jp nz, Jump_000_1942

  ld a, [$c008]
  or a
  jr z, jr_000_1849

  ld a, [$c033]
  sub $0f
  jr nz, jr_000_1849

  push bc
  ld a, $01
  push af
  inc sp
  call Call_000_0e53
  inc sp
  pop bc

jr_000_1849:
  push bc
  call $66c3
  pop bc
  ld a, e
  or a
  jp nz, Jump_000_1942

Jump_000_1853:
jr_000_1853:
  ld de, $c031
  push bc
  push de
  ld hl, sp+$1f
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_1293
  add sp, $04
  pop bc
  ld a, e
  or a
  jp nz, Jump_000_1942

  ld hl, sp+$28
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  ld hl, $00e5
  push hl
  ld hl, $c04c
  push hl
  push de
  call Call_000_09ef
  add sp, $06
  pop bc
  ld de, $c128
  ld a, [de]
  ld hl, sp+$1d
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
  ld hl, sp+$1a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$1d
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
  ld hl, $0008
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$1d
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$21
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
  ld hl, sp+$21
  inc [hl]
  jr nz, jr_000_18cf

  inc hl
  inc [hl]
  jr nz, jr_000_18cf

  inc hl
  inc [hl]
  jr nz, jr_000_18cf

  inc hl
  inc [hl]

jr_000_18cf:
  ld hl, sp+$1e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$21
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
  push bc
  call Call_000_0eb5
  add sp, $02
  ld a, e
  or a
  jp nz, Jump_000_1942

  ld hl, $c131
  ld [hl], $01
  call Call_000_1041
  ld a, e
  or a
  jp nz, Jump_000_1942

  ld hl, sp+$00
  ld a, [hl]
  or a
  jr z, jr_000_190b

  call $6471
  ld a, e
  or a
  jp nz, Jump_000_1942

jr_000_190b:
  call $675e
  ld a, e
  or a
  jp nz, Jump_000_1942

  ld hl, sp+$29
  ld a, [hl]
  or a
  jr z, jr_000_1940

  ld hl, sp+$01
  ld c, l
  ld b, h
  ld hl, $0001
  add hl, bc
  ld a, l
  ld d, h
  ld hl, sp+$1d
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$1b
  ld a, [hl]
  ld [de], a
  inc de
  inc hl
  ld a, [hl]
  ld [de], a
  ld a, $02
  ld [bc], a
  push bc
  ld a, $08
  push af
  inc sp
  call Call_000_048f
  add sp, $03

jr_000_1940:
  ld e, $00

Jump_000_1942:
  add sp, $25
  ret


Call_000_1945:
  add sp, -$24
  ld hl, sp+$18
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld a, [$c131]
  or a
  jr nz, jr_000_1959

  ld e, $32
  jp Jump_000_1aa7


jr_000_1959:
  call Call_000_1747
  ld hl, sp+$00
  ld a, l
  ld d, h
  ld hl, sp+$1e
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call Call_000_0ea2
  add sp, $02
  ld a, e
  or a
  jp nz, Jump_000_1aa7

  ld hl, sp+$1f
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000c
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, sp+$20
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
  ld de, $c128
  ld a, [de]
  ld hl, sp+$1a
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
  ld hl, sp+$20
  ld a, [hl]
  ld hl, sp+$1a
  sub [hl]
  jr nz, jr_000_19be

  ld hl, sp+$21
  ld a, [hl]
  ld hl, sp+$1b
  sub [hl]
  jr nz, jr_000_19be

  ld hl, sp+$22
  ld a, [hl]
  ld hl, sp+$1c
  sub [hl]
  jr nz, jr_000_19be

  ld hl, sp+$23
  ld a, [hl]
  ld hl, sp+$1d
  sub [hl]
  jr z, jr_000_19c3

jr_000_19be:
  ld e, $32
  jp Jump_000_1aa7


jr_000_19c3:
  ld de, $c04c
  ld hl, $0000
  push hl
  push de
  call Call_000_3a3f
  add sp, $04
  ld a, e
  or a
  jp nz, Jump_000_1aa7

  call Call_000_04a8
  ld de, $d69e
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  xor a
  cp c
  ld a, $3f
  sbc b
  jr nc, jr_000_19ea

  ld bc, $3f00

jr_000_19ea:
  ld hl, sp+$18
  ld e, l
  ld d, h
  xor a
  push af
  inc sp
  push bc
  push de
  call Call_000_3cf6
  add sp, $05
  ld a, e
  or a
  jp nz, Jump_000_1aa7

  ld a, [$c007]
  or a
  jr nz, jr_000_1a10

  ld hl, $01f0
  ld [hl], $01
  call $6471
  ld a, e
  or a
  jp nz, Jump_000_1aa7

jr_000_1a10:
  ld a, [$c02d]
  or a
  jr z, jr_000_1a30

  ld hl, sp+$13
  ld e, l
  ld d, h
  ld a, $03
  ld [de], a
  ld hl, sp+$13
  ld e, l
  ld d, h
  push de
  ld a, $07
  push af
  inc sp
  call Call_000_048f
  add sp, $03
  ld a, e
  or a
  jp nz, Jump_000_1aa7

jr_000_1a30:
  xor a
  push af
  inc sp
  call Call_000_2b06
  inc sp
  ld a, [$c032]
  push af
  inc sp
  call Call_000_0481
  inc sp
  ld a, [$c033]
  push af
  inc sp
  call Call_000_0488
  inc sp
  ld hl, sp+$1f
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0012
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  or a
  jr nz, jr_000_1a5f

  ld a, [$c005]
  or a
  jr nz, jr_000_1a66

jr_000_1a5f:
  xor a
  push af
  inc sp
  call Call_000_0481
  inc sp

jr_000_1a66:
  ld hl, $01f3
  ld [hl], $00
  ld a, [$c033]
  or a
  jr z, jr_000_1a73

  ld [hl], $01

jr_000_1a73:
  call $67c1
  call Call_000_214d
  call Call_000_09cc
  call WaitVBL
  ld a, [$c030]
  or a
  jr z, jr_000_1a8a

  call Call_000_05ed
  jr jr_000_1a8d

jr_000_1a8a:
  call Call_000_05f6

jr_000_1a8d:
  ld a, [$c001]
  sub $03
  jr nz, jr_000_1a97

  call Call_000_0545

jr_000_1a97:
  ld hl, $ff26
  ld [hl], $80
  ld a, [$c031]
  push af
  inc sp
  call Call_000_0453
  inc sp
  ld e, $33

Jump_000_1aa7:
  add sp, $24
  ret


  ld de, _RAM
  ret


  ld de, $c02b
  ret


  add sp, -$80
  add sp, -$80
  add sp, -$16
  call $58aa
  ld b, l
  ld c, h
  ld hl, sp+$14
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$0c
  ld a, l
  ld d, h
  ld hl, $0110
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $83
  inc hl
  ld [hl], $1d
  ld hl, $0111
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $87
  ld [bc], a
  inc bc
  ld a, $1d
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $8a
  inc hl
  ld [hl], $1d
  ld hl, $0111
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$00
  ld a, l
  ld d, h
  ld hl, $010e
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $8e
  inc hl
  ld [hl], $1d
  ld hl, $010f
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  ld a, $94
  ld [bc], a
  inc bc
  ld a, $1d
  ld [bc], a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $a4
  inc hl
  ld [hl], $1d
  ld hl, $010f
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0006
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $b1
  inc hl
  ld [hl], $1d
  ld hl, $010f
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0008
  add hl, de
  ld b, l
  ld c, h
  ld [hl], $05
  inc hl
  ld [hl], $00
  call Call_000_214d
  xor a
  push af
  inc sp
  call Call_000_2268
  inc sp
  ld hl, $0800
  push hl
  call Call_000_2209
  add sp, $02
  ld de, $1dc0
  push de
  call Call_000_2193
  add sp, $02
  call Call_000_09cc
  ld hl, sp+$18
  ld [hl], $00
  ld hl, sp+$14
  ld d, h
  ld e, l
  ld hl, $0112
  add hl, sp
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
  ld hl, sp+$0a
  ld [hl], $00
  inc hl
  ld [hl], $00

Jump_000_1ba2:
  ld a, $0a
  ld hl, sp+$18
  sub [hl]
  jr nc, jr_000_1bbe

  ld [hl], $00
  ld hl, sp+$14
  ld d, h
  ld e, l
  ld hl, $0112
  add hl, sp
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

jr_000_1bbe:
  ld hl, sp+$18
  inc [hl]
  ld hl, $0114
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $0114
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_31eb
  add sp, $04
  ld a, e
  or a
  jp nz, Jump_000_1d7c

  ld hl, $c2f0
  ld a, [hl-]
  or [hl]
  jr nz, jr_000_1bfc

  ld hl, sp+$14
  ld d, h
  ld e, l
  ld hl, $0112
  add hl, sp
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
  ld hl, sp+$18
  ld [hl], $00
  jp Jump_000_1d56


jr_000_1bfc:
  call Call_000_22d8
  ld hl, $c2ef
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call $6d67
  add sp, $04
  ld c, e
  ld b, d
  ld hl, sp+$19
  ld a, l
  ld d, h
  ld hl, $010c
  add hl, sp
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, $0106
  add hl, sp
  ld [hl+], a
  ld [hl], e
  sla c
  rl b
  sla c
  rl b
  ld hl, $c6f2
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, $0102
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
  ld [hl+], a
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $0106
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $0106
  add hl, sp
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_3670
  add sp, $06
  ld a, e
  or a
  jp nz, Jump_000_1d7c

  ld hl, $010d
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00e4
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld hl, $0102
  add hl, sp
  ld [hl], a
  ld a, [hl]
  or a
  jp z, Jump_000_1cf4

  ld hl, $010d
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00d4
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, $0108
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
  ld de, $c027
  ld a, [de]
  ld hl, $00fe
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
  ld hl, $0108
  add hl, sp
  ld a, [hl]
  ld hl, $00fe
  add hl, sp
  sub [hl]
  jp nz, Jump_000_1cf4

  ld hl, $0109
  add hl, sp
  ld a, [hl]
  ld hl, $00ff
  add hl, sp
  sub [hl]
  jp nz, Jump_000_1cf4

  ld hl, $010a
  add hl, sp
  ld a, [hl]
  ld hl, $0100
  add hl, sp
  sub [hl]
  jr nz, jr_000_1cf4

  ld hl, $010b
  add hl, sp
  ld a, [hl]
  ld hl, $0101
  add hl, sp
  sub [hl]
  jr nz, jr_000_1cf4

  ld hl, sp+$14
  ld d, h
  ld e, l
  ld hl, $0112
  add hl, sp
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
  ld hl, sp+$18
  ld [hl], $00
  jp Jump_000_1d56


Jump_000_1cf4:
jr_000_1cf4:
  ld hl, $0102
  add hl, sp
  ld a, [hl]
  or a
  jr z, jr_000_1d1e

  ld hl, $010d
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00dc
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
  ld a, [de]
  ld hl, $0112
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
  jp Jump_000_1d56


jr_000_1d1e:
  ld hl, $010d
  add hl, sp
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0111
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  push de
  call Call_000_2c18
  add sp, $04
  ld a, e
  or a
  jr z, jr_000_1d56

  ld hl, $010d
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, $01
  push af
  inc sp
  push de
  call Call_000_1770
  add sp, $03
  ld a, e
  or a
  jr nz, jr_000_1d7c

  call Call_000_1945
  ld a, e
  or a
  jr nz, jr_000_1d7c

Jump_000_1d56:
jr_000_1d56:
  ld hl, sp+$0a
  inc [hl]
  jr nz, jr_000_1d5d

  inc hl
  inc [hl]

jr_000_1d5d:
  ld hl, sp+$0a
  ld a, [hl]
  sub $80
  inc hl
  ld a, [hl]
  sbc $00
  jp c, Jump_000_1ba2

  ld hl, $010f
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  xor a
  push af
  inc sp
  push de
  call $67e6
  add sp, $03
  ld e, $00

Jump_000_1d7c:
jr_000_1d7c:
  add sp, $7f
  add sp, $7f
  add sp, $18
  ret


  ld h, a
  ld h, d
  jr nz, jr_000_1d87

jr_000_1d87:
  ld h, a
  ld h, d
  nop
  ld h, a
  ld h, d
  ld h, e
  nop
  ld b, h
  daa
  ld l, a
  ld l, b
  ld hl, $5300
  ld [hl], l
  ld [hl], b
  ld [hl], b
  ld l, a
  ld [hl], d
  ld [hl], h
  ld h, l
  ld h, h
  jr nz, jr_000_1e06

  ld h, c
  ld l, l
  ld h, l
  ld [hl], e
  nop
  ld l, [hl]
  ld l, a
  ld [hl], h
  jr nz, @+$68

  ld l, a
  ld [hl], l
  ld l, [hl]
  ld h, h
  jr nz, jr_000_1e18

  ld l, [hl]
  nop
  ld h, e
  ld [hl], l
  ld [hl], d
  ld [hl], d
  ld h, l
  ld l, [hl]
  ld [hl], h
  jr nz, jr_000_1e20

  ld l, a
  ld l, h
  ld h, h
  ld h, l
  ld [hl], d
  nop
  ld d, e
  ld h, l
  ld h, c
  ld [hl], d
  ld h, e
  ld l, b
  jr nz, @+$69

  ld h, c
  ld l, l
  ld h, l
  ld [hl], e
  ld l, $2e
  ld l, $00

Call_000_1dd0:
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
  call Call_000_048f
  add sp, $03
  add sp, $07
  ret


Call_000_1e04:
  add sp, -$0f

jr_000_1e06:
  ld hl, sp+$09
  ld [hl], $00
  inc hl
  ld [hl], $82
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $8a
  ld hl, $ff40
  ld [hl], $00

jr_000_1e18:
  ld hl, $c2b1
  ld [hl], $00
  ld hl, $c2b2

jr_000_1e20:
  ld [hl], $01
  ld hl, $ff4f
  ld [hl], $00
  ld de, $ff4f
  ld a, [de]
  rrca
  jr c, jr_000_1e46

  ld hl, $ff4f
  ld [hl], $01
  ld de, $ff4f
  ld a, [de]
  and $01
  dec a
  jr nz, jr_000_1e41

  ld hl, $c2b2
  ld [hl], $03

jr_000_1e41:
  ld hl, $ff4f
  ld [hl], $00

jr_000_1e46:
  ld hl, sp+$11
  ld a, [hl]
  or a
  jr z, jr_000_1e53

  ld hl, $ff26
  ld [hl], $00
  jr jr_000_1e58

jr_000_1e53:
  ld hl, $ff25
  ld [hl], $00

jr_000_1e58:
  ld hl, $ff41
  ld [hl], $00
  ld l, $42
  ld [hl], $00
  ld l, $43
  ld [hl], $00
  ld l, $47
  ld [hl], $dc
  ld l, $48
  ld [hl], $00
  ld l, $49
  ld [hl], $00
  ld l, $4a
  ld [hl], $00
  ld l, $4b
  ld [hl], $00
  ld hl, $c2b2
  ld a, [hl]
  sub $03
  jp nz, Jump_000_1ee9

  ld hl, $ff4f
  ld [hl], $01
  ld hl, $2000
  push hl
  xor a
  push af
  inc sp
  ld h, $80
  push hl
  call Call_000_0a02
  add sp, $05
  ld hl, $ff4f
  ld [hl], $00
  ld l, $68
  ld [hl], $80
  ld hl, sp+$02
  ld [hl], $00
  inc hl
  ld [hl], $00

Jump_000_1ea6:
  ld hl, sp+$02
  ld a, [hl]
  and $03
  ld c, a
  ld b, $00
  sla c
  rl b
  ld hl, $1f77
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$0d
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  ld d, [hl]
  ld e, $00
  ld a, d
  ld de, $ff69
  ld [de], a
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld d, $00
  ld hl, $ff69
  ld [hl], c
  ld hl, sp+$02
  inc [hl]
  jr nz, jr_000_1edd

  inc hl
  inc [hl]

jr_000_1edd:
  ld hl, sp+$02
  ld a, [hl]
  sub $20
  inc hl
  ld a, [hl]
  sbc $00
  jp c, Jump_000_1ea6

Jump_000_1ee9:
  ld hl, sp+$00
  ld [hl], $00
  inc hl
  ld [hl], $7d
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00

Jump_000_1ef6:
  pop de
  push de
  ld a, [de]
  ld b, a
  ld hl, sp+$09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp+$0a
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  xor a
  ld [bc], a
  inc bc
  dec hl
  ld [hl], c
  inc hl
  ld [hl], b
  pop de
  push de
  ld a, [de]
  ld b, a
  ld hl, sp+$00
  inc [hl]
  jr nz, jr_000_1f19

  inc hl
  inc [hl]

jr_000_1f19:
  ld hl, sp+$0b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp+$0c
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  ld a, $ff
  ld [bc], a
  inc bc
  dec hl
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$02
  inc [hl]
  jr nz, jr_000_1f35

  inc hl
  inc [hl]

jr_000_1f35:
  ld hl, sp+$02
  ld a, [hl]
  sub $00
  inc hl
  ld a, [hl]
  sbc $03
  jp c, Jump_000_1ef6

  call Call_000_214d
  call $6af2
  call Call_000_09cc
  ld hl, $ff40
  ld [hl], $91
  ld hl, $c2b2
  ld a, [hl]
  dec a
  jr nz, jr_000_1f74

  ld hl, sp+$04
  ld e, l
  ld d, h
  ld a, $03
  ld [de], a
  ld hl, sp+$04
  ld e, l
  ld d, h
  push de
  ld a, $06
  push af
  inc sp
  call Call_000_048f
  add sp, $03
  ld a, e
  or a
  jr z, jr_000_1f74

  ld hl, $c2b2
  ld [hl], $02

jr_000_1f74:
  add sp, $0f
  ret

UIColors::
  RGB 5, 5, 6
  RGB 31, 26, 11
  RGB 9, 18, 23
  RGB 31, 31, 29

  nop
  nop
  nop
  nop

Call_000_1f83:
  ld hl, $c2b2
  ld e, [hl]
  ret


GetButtonDown::;returns buttons pressed in e
.waitForRelease:
  call GetInput
  ld a, e
  or a
  jr nz, .waitForRelease

.waitForPress:
  call GetInput
  ld a, e
  or a
  jr z, .waitForPress

  ld hl, wGamepadState
  ld e, [hl]
  ret


GetInput::;returns buttons in e
  ld hl, $c2b3
  inc [hl]
  jr nz, .jr_000_1fa3

  inc hl
  inc [hl]

.jr_000_1fa3:
  ld hl, $c2b5
  ld a, [hl]
  sub $16;is DPad pressed?
  jr nc, jr_000_1fae

  call WaitVBL

jr_000_1fae:
  call UpdateInput
  ld hl, wGamepadState
  ld [hl], e;store button state
  ld hl, $09c0
  ld a, [hl]
  or a
  jr z, .checkButtons

.swapAB
  ld hl, wGamepadState
  ld a, [hl]
  and PADF_A | PADF_B
  ld d, a;store A and B buttons in d
  ld a, [hl]
  and ~(PADF_A | PADF_B)
  ld [hl], a;remove A and B buttons from wGamepadState
  ld a, d;A and B buttons
  srl a;B in bit 0, toss A
  or [hl];DPad, start, and select
  ld [hl], a;store in wGamepadState
  ld a, d;A and B buttons
  and $01;toss B
  add a;put A button in bit 2
  or [hl];DPad, start, select, B
  ld [hl], a;store in wGamepadState with A and B swapped

.checkButtons:
  ld hl, wGamepadState
  ld a, [hl]
  or a;is anything pressed
  jr z, .noButtonsPressed

  ld a, [hl]
  and $f0;is it just the dPad
  jr z, .noButtonsPressed

  ld hl, $c2b5
  inc [hl]
  jr jr_000_1fe9

.noButtonsPressed:
  ld hl, $c2b5
  ld [hl], $00

jr_000_1fe9:
  ld a, $18
  ld hl, $c2b5
  sub [hl]
  jr nc, .returnInput

  ld a, [hl]
  add $fa
  ld [hl], a
  ld hl, wGamepadState
  ld [hl], $00

.returnInput:
  ld hl, wGamepadState
  ld e, [hl]
  ret


Call_000_1fff:
  add sp, -$02
  ld hl, sp+$05
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

jr_000_2007:
  ld a, [bc]
  ld d, a
  or a
  jr z, jr_000_2031

  push hl
  ld hl, $c2ac
  ld a, [hl]
  ld hl, sp+$02
  ld [hl], a
  pop hl
  push hl
  ld hl, $c2ad
  ld a, [hl]
  ld hl, sp+$03
  ld [hl], a
  pop hl
  ld a, d
  inc bc
  ld hl, $c2b1
  or [hl]
  pop de
  push de
  ld [de], a
  ld hl, $c2ac
  inc [hl]
  jr nz, jr_000_2007

  inc hl
  inc [hl]
  jr jr_000_2007

jr_000_2031:
  add sp, $02
  ret


Call_000_2034:
  ld hl, sp+$02
  ld a, [hl]
  swap a
  and $0f
  and $0f
  add $30
  ld b, a
  ld a, $39
  sub b
  jr nc, jr_000_2049

  ld a, b
  add $07
  ld b, a

jr_000_2049:
  ld hl, $c2ad
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, b
  ld hl, $c2b1
  or [hl]
  ld [de], a
  ld hl, $c2ac
  inc [hl]
  jr nz, jr_000_205e

  inc hl
  inc [hl]

jr_000_205e:
  ld hl, sp+$02
  ld a, [hl]
  and $0f
  add $30
  ld b, a
  ld a, $39
  sub b
  jr nc, jr_000_206f

  ld a, b
  add $07
  ld b, a

jr_000_206f:
  ld hl, $c2ad
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, b
  ld hl, $c2b1
  or [hl]
  ld [de], a
  ld hl, $c2ac
  inc [hl]
  ret nz

  inc hl
  inc [hl]
  ret


Call_000_2084:
  ld hl, sp+$03
  ld d, [hl]
  ld e, $00
  push de
  inc sp
  call Call_000_2034
  inc sp
  ld hl, sp+$02
  ld d, [hl]
  push de
  inc sp
  call Call_000_2034
  inc sp
  ret


  push af
  ld hl, sp+$04
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld c, [hl]
  pop af
  ld a, $10

jr_000_20a6:
  srl c
  rr b
  rr d
  rr e
  dec a
  jr nz, jr_000_20a6

  push de
  call Call_000_2084
  add sp, $02
  pop bc
  pop de
  push de
  push bc
  push de
  call Call_000_2084
  add sp, $02
  ret


  add sp, -$0d
  ld hl, sp+$0a
  ld c, l
  ld b, h
  xor a
  ld [bc], a
  ld hl, sp+$12
  ld a, [hl-]
  or [hl]
  dec hl
  or [hl]
  dec hl
  or [hl]
  jr nz, jr_000_20d8

  dec bc
  ld a, $30
  ld [bc], a

jr_000_20d8:
  ld hl, sp+$0b
  ld [hl], c
  inc hl
  ld [hl], b

Jump_000_20dd:
  ld hl, sp+$0f
  ld a, [hl+]
  or [hl]
  inc hl
  or [hl]
  inc hl
  or [hl]
  jp z, Jump_000_213f

  ld hl, sp+$0c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  dec de
  dec hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, $0000
  push hl
  ld hl, $000a
  push hl
  ld hl, sp+$15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $6c4d
  add sp, $08
  ld b, l
  ld c, h
  ld a, e
  add $30
  ld b, a
  ld hl, sp+$0b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, $0000
  push hl
  ld hl, $000a
  push hl
  ld hl, sp+$15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $6c53
  add sp, $08
  ld b, l
  ld c, h
  ld hl, sp+$0f
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  jp Jump_000_20dd


Jump_000_213f:
  ld hl, sp+$0b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_1fff
  add sp, $02
  add sp, $0d
  ret


Call_000_214d:
  ld hl, $c2ae
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld de, $c144
  ld hl, $c2ac
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, $0168
  push hl
  ld a, $20
  push af
  inc sp
  push de
  call Call_000_0a02
  add sp, $05
  ret


Call_000_216d:
  ld hl, $c2ae
  ld a, [hl]
  add $14
  ld [hl+], a
  ld a, [hl]
  adc $00
  ld [hl], a
  ld a, $44
  dec hl
  add [hl]
  ld b, a
  ld a, $c1
  inc hl
  adc [hl]
  ld c, a
  ld hl, $c2ac
  ld [hl], b
  inc hl
  ld [hl], c
  pop bc
  pop hl
  push hl
  push bc
  push hl
  call Call_000_1fff
  add sp, $02
  ret


Call_000_2193:
  ld hl, $c2ae
  ld a, [hl]
  add $14
  ld [hl+], a
  ld a, [hl]
  adc $00
  ld [hl], a
  ld a, $44
  dec hl
  add [hl]
  ld b, a
  ld a, $c1
  inc hl
  adc [hl]
  ld c, a
  ld hl, $c2ac
  ld [hl], b
  inc hl
  ld [hl], c
  pop bc
  pop hl
  push hl
  push bc
  push hl
  call Call_000_2ba2
  add sp, $02
  ld c, e
  ld a, $12
  sub c
  jr c, jr_000_21d5

  ld b, $00
  ld a, $14
  sub c
  ld c, a
  ld a, $00
  sbc b
  ld b, a
  sra b
  rr c
  ld hl, $c2ac
  ld a, [hl]
  add c
  ld [hl+], a
  ld a, [hl]
  adc b
  ld [hl], a

jr_000_21d5:
  pop bc
  pop hl
  push hl
  push bc
  push hl
  call Call_000_1fff
  add sp, $02
  ret


Call_000_21e0:
  ld hl, sp+$02
  ld b, [hl]

jr_000_21e3:
  ld c, b
  dec b
  ld a, c
  or a
  jr z, jr_000_21f6

  ld hl, $c2ae
  ld a, [hl]
  add $14
  ld [hl+], a
  ld a, [hl]
  adc $00
  ld [hl], a
  jr jr_000_21e3

jr_000_21f6:
  ld a, $44
  ld hl, $c2ae
  add [hl]
  ld b, a
  ld a, $c1
  inc hl
  adc [hl]
  ld c, a
  ld hl, $c2ac
  ld [hl], b
  inc hl
  ld [hl], c
  ret


Call_000_2209:
  add sp, -$02
  ld hl, sp+$04
  ld a, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], $00
  ld hl, sp+$05
  ld c, [hl]
  ld b, $00
  ld l, c
  ld h, b
  add hl, hl
  add hl, hl
  add hl, bc
  add hl, hl
  add hl, hl
  ld c, l
  ld b, h
  pop hl
  push hl
  add hl, bc
  ld a, l
  ld d, h
  ld hl, $c2ae
  ld [hl+], a
  ld [hl], d
  ld a, $44
  dec hl
  add [hl]
  ld b, a
  ld a, $c1
  inc hl
  adc [hl]
  ld c, a
  ld hl, $c2ac
  ld [hl], b
  inc hl
  ld [hl], c
  add sp, $02
  ret


Call_000_223e:
  ld hl, $0014
  push hl
  ld hl, $c2ae
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $6d53
  add sp, $04
  ret


  ld hl, sp+$05
  ld a, [hl]
  push af
  inc sp
  dec hl
  ld a, [hl]
  push af
  inc sp
  call Call_000_2209
  add sp, $02
  pop bc
  pop hl
  push hl
  push bc
  push hl
  call Call_000_1fff
  add sp, $02
  ret


Call_000_2268:
  push hl
  ld hl, sp+$04
  ld a, [hl]
  ld hl, $c2b1
  ld [hl], a
  pop hl
  ret


Call_000_2272:
  add sp, -$04
  ld hl, sp+$09
  ld a, [hl]
  push af
  inc sp
  dec hl
  ld a, [hl]
  push af
  inc sp
  call Call_000_2209
  add sp, $02
  ld hl, sp+$0b
  ld c, [hl]

Jump_000_2285:
  ld b, c
  dec c
  ld a, b
  or a
  jp z, Jump_000_22d5

  ld hl, sp+$0a
  ld a, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], $00
  ld hl, $c2b1
  ld e, [hl]
  ld d, $00
  ld hl, sp+$06
  ld a, [hl]
  or e
  ld b, a
  inc hl
  ld a, [hl]
  or d
  ld d, a
  ld de, $c144
  ld hl, $c2ae
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$02
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push bc
  ld hl, sp+$02
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  inc sp
  push de
  call Call_000_0a02
  add sp, $05
  pop bc
  ld hl, $c2ae
  ld a, [hl]
  add $14
  ld [hl+], a
  ld a, [hl]
  adc $00
  ld [hl], a
  jp Jump_000_2285


Jump_000_22d5:
  add sp, $04
  ret


Call_000_22d8:
  ld hl, $c2b3
  inc [hl]
  jr nz, jr_000_22e0

  inc hl
  inc [hl]

jr_000_22e0:
  ld hl, $c2b3
  ld c, [hl]
  inc hl
  ld a, [hl]
  and $3f
  ld b, a
  sla c
  rl b
  ld hl, _RAM
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  srl c
  rr b
  srl c
  rr b
  srl c
  rr b
  ld hl, $c2b3
  ld a, [hl]
  add b
  ld [hl+], a
  ld a, [hl]
  adc c
  ld [hl-], a
  ld c, [hl]
  inc hl
  ld a, [hl]
  and $1f
  ld b, a
  sla c
  rl b
  ld hl, $0500
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  srl c
  rr b
  ld hl, $c2b3
  ld a, [hl]
  add b
  ld [hl+], a
  ld a, [hl]
  adc c
  ld [hl-], a
  ld c, [hl]
  inc hl
  ld a, [hl]
  and $3f
  ld b, a
  sla c
  rl b
  ld hl, _RAM
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld b, a
  inc de
  ld a, [de]
  ld c, a
  ld hl, $c2b3
  ld a, [hl]
  xor b
  ld [hl+], a
  ld a, [hl]
  xor c
  ld [hl-], a
  ld a, [hl]
  ld hl, $c2b6
  xor [hl]
  ld hl, $c2b3
  ld [hl+], a
  ld a, [hl]
  ld hl, $c2b7
  xor [hl]
  ld hl, $c2b4
  ld [hl], a
  ld hl, $c2b6
  inc [hl]
  jr nz, jr_000_236d

  inc hl
  inc [hl]

jr_000_236d:
  ld hl, $c2b4
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ret


Call_000_2375:
  add sp, -$05
  ld hl, sp+$00
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$07
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$03
  ld [hl+], a
  ld [hl], e
  dec hl
  dec hl
  ld [hl], $05

Jump_000_238a:
  ld hl, sp+$02
  ld b, [hl]
  dec [hl]
  ld a, b
  or a
  jp z, Jump_000_23c5

  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  dec hl
  inc [hl]
  jr nz, jr_000_239e

  inc hl
  inc [hl]

jr_000_239e:
  ld d, a
  ld e, $00
  ld hl, sp+$00
  ld a, [hl]
  xor d
  ld [hl+], a
  ld a, [hl]
  xor e
  ld [hl], a
  ld bc, $0008

jr_000_23ac:
  ld hl, sp+$00
  sla [hl]
  inc hl
  rl [hl]
  bit 0, [hl]
  jr z, jr_000_23bd

  ld hl, sp+$00
  ld a, [hl]
  xor $12
  ld [hl], a

jr_000_23bd:
  dec bc
  ld a, b
  or c
  jr nz, jr_000_23ac

  jp Jump_000_238a


Jump_000_23c5:
  ld hl, sp+$00
  ld e, [hl]
  res 0, e
  ld d, $00
  add sp, $05
  ret


Call_000_23cf:
  add sp, -$19
  ld hl, sp+$01
  ld a, l
  ld d, h
  ld hl, sp+$07
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$1b
  ld a, [hl]
  ld [de], a
  ld hl, sp+$08
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  push af
  ld hl, sp+$1e
  ld a, [hl]
  ld hl, sp+$17
  ld [hl], a
  ld hl, sp+$1f
  ld a, [hl]
  ld hl, sp+$18
  ld [hl], a
  ld hl, sp+$20
  ld a, [hl]
  ld hl, sp+$19
  ld [hl], a
  ld hl, sp+$21
  ld a, [hl]
  ld hl, sp+$1a
  ld [hl], a
  pop af
  ld a, $18

jr_000_2404:
  ld hl, sp+$18
  srl [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec a
  jr nz, jr_000_2404

  ld a, [hl]
  ld hl, sp+$11
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$11
  ld a, [hl]
  ld [bc], a
  ld hl, sp+$08
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  push af
  ld hl, sp+$1e
  ld a, [hl]
  ld hl, sp+$13
  ld [hl], a
  ld hl, sp+$1f
  ld a, [hl]
  ld hl, sp+$14
  ld [hl], a
  ld hl, sp+$20
  ld a, [hl]
  ld hl, sp+$15
  ld [hl], a
  ld hl, sp+$21
  ld a, [hl]
  ld hl, sp+$16
  ld [hl], a
  pop af
  ld a, $10

jr_000_2448:
  ld hl, sp+$14
  srl [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec a
  jr nz, jr_000_2448

  ld a, [hl]
  ld hl, sp+$09
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$09
  ld a, [hl]
  ld [bc], a
  dec hl
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  inc bc
  push af
  ld hl, sp+$1e
  ld a, [hl]
  ld hl, sp+$0b
  ld [hl], a
  ld hl, sp+$1f
  ld a, [hl]
  ld hl, sp+$0c
  ld [hl], a
  ld hl, sp+$20
  ld a, [hl]
  ld hl, sp+$0d
  ld [hl], a
  ld hl, sp+$21
  ld a, [hl]
  ld hl, sp+$0e
  ld [hl], a
  pop af
  ld a, $08

jr_000_248c:
  ld hl, sp+$0c
  srl [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec a
  jr nz, jr_000_248c

  ld a, [hl]
  ld hl, sp+$0d
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$0d
  ld a, [hl]
  ld [bc], a
  ld hl, sp+$08
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$0d
  ld [hl+], a
  ld [hl], d
  push af
  ld hl, sp+$1e
  ld b, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld e, [hl]
  inc hl
  ld c, [hl]
  pop af
  ld d, $00
  ld e, $00
  ld c, $00
  ld hl, sp+$0d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp+$08
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call Call_000_2375
  add sp, $02
  ld a, e
  set 0, a
  ld hl, sp+$00
  ld [hl], a
  call Call_000_02ec
  ld a, $ff
  push af
  inc sp
  call Call_000_02c8
  inc sp
  ld hl, sp+$1b
  ld a, [hl]
  push af
  inc sp
  call Call_000_02c8
  inc sp
  ld hl, sp+$15
  ld d, [hl]
  push de
  inc sp
  call Call_000_02c8
  inc sp
  ld hl, sp+$11
  ld d, [hl]
  push de
  inc sp
  call Call_000_02c8
  inc sp
  ld hl, sp+$09
  ld d, [hl]
  push de
  inc sp
  call Call_000_02c8
  inc sp
  ld hl, sp+$1c
  ld d, [hl]
  push de
  inc sp
  call Call_000_02c8
  inc sp
  ld hl, sp+$00
  ld a, [hl]
  push af
  inc sp
  call Call_000_02c8
  inc sp
  ld a, $ff
  push af
  inc sp
  call Call_000_02c8
  inc sp
  ld a, $ff
  push af
  inc sp
  call Call_000_02c8
  inc sp
  ld hl, sp+$06
  ld [hl], e
  ld bc, $0000

jr_000_253c:
  ld hl, sp+$06
  ld a, [hl]
  inc a
  jr nz, jr_000_2560

  push bc
  ld a, $ff
  push af
  inc sp
  call Call_000_02c8
  inc sp
  pop bc
  ld hl, sp+$06
  ld [hl], e
  ld hl, sp+$0d
  ld [hl], c
  inc hl
  ld [hl], b
  inc bc
  dec hl
  ld a, [hl]
  or a
  jr nz, jr_000_253c

  inc hl
  ld a, [hl]
  sub $08
  jr nz, jr_000_253c

jr_000_2560:
  call Call_000_02f5
  ld hl, sp+$06
  ld e, [hl]
  add sp, $19
  ret


Call_000_2569:
  add sp, -$03
  call Call_000_02ec
  ld a, $ff
  push af
  inc sp
  call Call_000_02e5
  inc sp
  ld hl, sp+$05
  ld a, [hl]
  push af
  inc sp
  call Call_000_02e5
  inc sp
  push af
  ld hl, sp+$08
  ld d, [hl]
  inc hl
  ld e, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld c, [hl]
  pop af
  ld a, $18

jr_000_258c:
  srl c
  rr b
  rr e
  rr d
  dec a
  jr nz, jr_000_258c

  push de
  inc sp
  call Call_000_02e5
  inc sp
  push af
  ld hl, sp+$08
  ld d, [hl]
  inc hl
  ld e, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld c, [hl]
  pop af
  ld a, $10

jr_000_25aa:
  srl c
  rr b
  rr e
  rr d
  dec a
  jr nz, jr_000_25aa

  push de
  inc sp
  call Call_000_02e5
  inc sp
  push af
  ld hl, sp+$08
  ld d, [hl]
  inc hl
  ld e, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld c, [hl]
  pop af
  ld a, $08

jr_000_25c8:
  srl c
  rr b
  rr e
  rr d
  dec a
  jr nz, jr_000_25c8

  push de
  inc sp
  call Call_000_02e5
  inc sp
  ld hl, sp+$06
  ld d, [hl]
  push de
  inc sp
  call Call_000_02e5
  inc sp
  ld a, $ff
  push af
  inc sp
  call Call_000_02e5
  inc sp
  ld a, $ff
  push af
  inc sp
  call Call_000_02e5
  inc sp
  ld a, $ff
  push af
  inc sp
  call Call_000_02da
  inc sp
  ld hl, sp+$00
  ld [hl], e
  ld bc, $0000

jr_000_2600:
  ld hl, sp+$00
  ld a, [hl]
  inc a
  jr nz, jr_000_2623

  push bc
  ld a, $ff
  push af
  inc sp
  call Call_000_02da
  inc sp
  pop bc
  ld hl, sp+$00
  ld [hl], e
  inc hl
  ld [hl], c
  inc hl
  ld [hl], b
  inc bc
  dec hl
  ld a, [hl]
  or a
  jr nz, jr_000_2600

  inc hl
  ld a, [hl]
  sub $08
  jr nz, jr_000_2600

jr_000_2623:
  call Call_000_02f5
  ld hl, sp+$00
  ld e, [hl]
  add sp, $03
  ret


Call_000_262c:
  add sp, -$05
  ld hl, $c2bd
  ld [hl], $00
  ld hl, $c2b8
  ld [hl], $00
  xor a
  ld hl, $c2b9
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  call Call_000_02fe
  call Call_000_02f5
  ld bc, $0000

jr_000_2649:
  push bc
  ld a, $ff
  push af
  inc sp
  call Call_000_02c8
  inc sp
  pop bc
  inc bc
  ld a, c
  sub $80
  ld a, b
  sbc $00
  jr c, jr_000_2649

  ld a, $01
  push af
  inc sp
  call Call_000_2b06
  inc sp
  ld a, e
  or a
  jp nz, Jump_000_2876

  ld hl, $0000
  push hl
  ld hl, $01aa
  push hl
  ld a, $48
  push af
  inc sp
  call Call_000_23cf
  add sp, $05
  ld hl, sp+$02
  ld [hl], e
  ld bc, $0000

jr_000_2680:
  push bc
  ld a, $ff
  push af
  inc sp
  call Call_000_02c8
  inc sp
  pop bc
  inc bc
  ld a, c
  sub $05
  ld a, b
  sbc $00
  jr c, jr_000_2680

  ld hl, sp+$02
  ld a, [hl]
  inc a
  jr nz, jr_000_269e

  ld e, $c1
  jp Jump_000_2876


jr_000_269e:
  ld hl, sp+$02
  ld a, [hl]
  sub $05
  jr z, jr_000_26ac

  ld hl, $c2b8
  ld a, [hl]
  set 1, a
  ld [hl], a

jr_000_26ac:
  ld hl, $c2b8
  ld a, [hl]
  sub $02
  jp nz, Jump_000_2769

  ld hl, sp+$03
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld bc, $0000

Jump_000_26bf:
  push bc
  ld hl, $0000
  push hl
  ld hl, $ffff
  push hl
  ld a, $77
  push af
  inc sp
  call Call_000_23cf
  add sp, $05
  pop bc
  ld a, e
  inc a
  jr nz, jr_000_26db

  ld e, $c2
  jp Jump_000_2876


jr_000_26db:
  dec e
  jr nz, jr_000_26fe

  push bc
  ld hl, $4030
  push hl
  ld hl, $0000
  push hl
  ld a, $69
  push af
  inc sp
  call Call_000_23cf
  add sp, $05
  pop bc
  ld a, e
  inc a
  jr nz, jr_000_26fa

  ld e, $c3
  jp Jump_000_2876


jr_000_26fa:
  ld a, e
  or a
  jr z, jr_000_270a

jr_000_26fe:
  inc bc
  ld hl, sp+$03
  ld [hl], c
  inc hl
  ld [hl], b
  ld a, b
  sub $08
  jp c, Jump_000_26bf

jr_000_270a:
  ld hl, sp+$03
  ld a, [hl]
  or a
  jr nz, jr_000_271b

  inc hl
  ld a, [hl]
  sub $08
  jr nz, jr_000_271b

  ld e, $c4
  jp Jump_000_2876


jr_000_271b:
  ld hl, $0000
  push hl
  ld hl, $0000
  push hl
  ld a, $7a
  push af
  inc sp
  call Call_000_23cf
  add sp, $05
  inc e
  jr nz, jr_000_2734

  ld e, $c5
  jp Jump_000_2876


jr_000_2734:
  call Call_000_02ec
  ld a, $ff
  push af
  inc sp
  call Call_000_02c8
  inc sp
  ld hl, sp+$03
  ld [hl], e
  ld bc, $0000

jr_000_2745:
  push bc
  ld a, $ff
  push af
  inc sp
  call Call_000_02c8
  inc sp
  pop bc
  inc bc
  ld a, c
  sub $03
  ld a, b
  sbc $00
  jr c, jr_000_2745

  ld hl, sp+$03
  bit 6, [hl]
  jp z, Jump_000_2835

  ld hl, $c2b8
  ld a, [hl]
  set 0, a
  ld [hl], a
  jp Jump_000_2835


Jump_000_2769:
  ld hl, $0000
  push hl
  ld hl, $0000
  push hl
  ld a, $77
  push af
  inc sp
  call Call_000_23cf
  add sp, $05
  inc e
  jr nz, jr_000_2782

  ld e, $c6
  jp Jump_000_2876


jr_000_2782:
  ld hl, $0000
  push hl
  ld hl, $0000
  push hl
  ld a, $69
  push af
  inc sp
  call Call_000_23cf
  add sp, $05
  ld b, e
  ld a, b
  inc a
  jr nz, jr_000_279d

  ld e, $c7
  jp Jump_000_2876


jr_000_279d:
  ld hl, sp+$03
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$00
  ld [hl], $00
  inc hl
  ld [hl], $00

Jump_000_27ab:
  ld a, b
  sub $01
  jp nc, Jump_000_27f3

  ld hl, $0000
  push hl
  ld hl, $0000
  push hl
  ld a, $77
  push af
  inc sp
  call Call_000_23cf
  add sp, $05
  ld b, e
  ld a, b
  inc a
  jr nz, jr_000_27cc

  ld e, $c8
  jp Jump_000_2876


jr_000_27cc:
  ld a, b
  dec a
  jp nz, Jump_000_2809

  ld hl, $0000
  push hl
  ld hl, $0000
  push hl
  ld a, $69
  push af
  inc sp
  call Call_000_23cf
  add sp, $05
  ld b, e
  ld a, b
  inc a
  jr nz, jr_000_27ec

  ld e, $c9
  jp Jump_000_2876


jr_000_27ec:
  ld a, b
  or a
  jp z, Jump_000_2824

  jr jr_000_2809

Jump_000_27f3:
  ld hl, $0000
  push hl
  ld hl, $0000
  push hl
  ld a, $41
  push af
  inc sp
  call Call_000_23cf
  add sp, $05
  ld b, e
  ld a, b
  or a
  jr z, jr_000_2824

Jump_000_2809:
jr_000_2809:
  ld hl, sp+$00
  inc [hl]
  jr nz, jr_000_2810

  inc hl
  inc [hl]

jr_000_2810:
  ld hl, sp+$00
  ld a, [hl+]
  ld e, [hl]
  inc hl
  inc hl
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$00
  ld a, [hl]
  sub $00
  inc hl
  ld a, [hl]
  sbc $08
  jp c, Jump_000_27ab

Jump_000_2824:
jr_000_2824:
  ld hl, sp+$03
  ld a, [hl]
  or a
  jr nz, jr_000_2835

  inc hl
  ld a, [hl]
  sub $08
  jr nz, jr_000_2835

  ld e, $ca
  jp Jump_000_2876


Jump_000_2835:
jr_000_2835:
  call Call_000_0307
  ld hl, $c2b9
  ld [hl], $01
  xor a
  inc hl
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  ld hl, $c2bd
  ld [hl], $01
  ld bc, $0000

jr_000_284a:
  push bc
  ld a, $ff
  push af
  inc sp
  call Call_000_02e5
  inc sp
  pop bc
  inc bc
  ld a, b
  sub $02
  jr c, jr_000_284a

  ld hl, $0000
  push hl
  ld hl, $0002
  push hl
  call Call_000_2879
  add sp, $04
  push de
  call Call_000_2a24
  pop de
  ld a, e
  or a
  jr z, jr_000_2874

  ld e, $cb
  jr jr_000_2876

jr_000_2874:
  ld e, $00

Jump_000_2876:
jr_000_2876:
  add sp, $05
  ret


Call_000_2879:
  ld hl, $c2b8
  ld a, [hl]
  rrca
  jr c, jr_000_2894

  push af
  pop af
  ld a, $09

jr_000_2884:
  ld hl, sp+$02
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, jr_000_2884

jr_000_2894:
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld a, $52
  push af
  inc sp
  call Call_000_2569
  add sp, $05
  ld a, e
  or a
  jr z, jr_000_28b0

  ld e, $d2
  ret


jr_000_28b0:
  call Call_000_02ec
  ld e, $00
  ret


Call_000_28b6:
  add sp, -$04
  ld b, $00
  ld hl, sp+$06
  ld a, [hl]
  ld hl, $c2b9
  sub [hl]
  jr nz, jr_000_28df

  ld hl, sp+$07
  ld a, [hl]
  ld hl, $c2ba
  sub [hl]
  jr nz, jr_000_28df

  ld hl, sp+$08
  ld a, [hl]
  ld hl, $c2bb
  sub [hl]
  jr nz, jr_000_28df

  ld hl, sp+$09
  ld a, [hl]
  ld hl, $c2bc
  sub [hl]
  jp z, Jump_000_290e

jr_000_28df:
  call Call_000_2a24
  ld hl, sp+$08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2879
  add sp, $04
  ld b, e
  ld a, b
  or a
  jr z, jr_000_28fc

  ld e, b
  jp Jump_000_296a


jr_000_28fc:
  ld hl, sp+$06
  ld d, h
  ld e, l
  ld hl, $c2b9
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

Jump_000_290e:
  ld a, b
  or a
  jr z, jr_000_2916

  ld e, b
  jp Jump_000_296a


jr_000_2916:
  ld hl, sp+$0c
  ld a, [hl]
  ld hl, sp+$00
  ld [hl], a
  ld hl, sp+$0d
  ld a, [hl]
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, $c2ba
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
  ld hl, $c2ba
  ld [hl-], a
  ld [hl], e
  ld hl, $c2bc
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
  ld hl, $c2bc
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$0c
  ld d, [hl]
  push de
  inc sp
  dec hl
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_037b
  add sp, $03
  ld a, e
  or a
  jr z, jr_000_296a

  push de
  call Call_000_02f5
  pop de

Jump_000_296a:
jr_000_296a:
  add sp, $04
  ret


Call_000_296d:
  add sp, -$04
  ld b, $00
  ld hl, sp+$06
  ld a, [hl]
  ld hl, $c2b9
  sub [hl]
  jr nz, jr_000_2996

  ld hl, sp+$07
  ld a, [hl]
  ld hl, $c2ba
  sub [hl]
  jr nz, jr_000_2996

  ld hl, sp+$08
  ld a, [hl]
  ld hl, $c2bb
  sub [hl]
  jr nz, jr_000_2996

  ld hl, sp+$09
  ld a, [hl]
  ld hl, $c2bc
  sub [hl]
  jp z, Jump_000_29c5

jr_000_2996:
  call Call_000_2a24
  ld hl, sp+$08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2879
  add sp, $04
  ld b, e
  ld a, b
  or a
  jr z, jr_000_29b3

  ld e, b
  jp Jump_000_2a21


jr_000_29b3:
  ld hl, sp+$06
  ld d, h
  ld e, l
  ld hl, $c2b9
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

Jump_000_29c5:
  ld a, b
  or a
  jr z, jr_000_29cd

  ld e, b
  jp Jump_000_2a21


jr_000_29cd:
  ld hl, sp+$0c
  ld a, [hl]
  ld hl, sp+$00
  ld [hl], a
  ld hl, sp+$0d
  ld a, [hl]
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, $c2ba
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
  ld hl, $c2ba
  ld [hl-], a
  ld [hl], e
  ld hl, $c2bc
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
  ld hl, $c2bc
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$0c
  ld d, [hl]
  push de
  inc sp
  dec hl
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_034b
  add sp, $03
  ld a, e
  or a
  jr z, jr_000_2a21

  push de
  call Call_000_02f5
  pop de

Jump_000_2a21:
jr_000_2a21:
  add sp, $04
  ret


Call_000_2a24:
  ld hl, $c2b9
  ld a, [hl]
  inc a
  jr nz, jr_000_2a3c

  inc hl
  ld a, [hl]
  inc a
  jr nz, jr_000_2a3c

  inc hl
  ld a, [hl]
  inc a
  jr nz, jr_000_2a3c

  inc hl
  ld a, [hl]
  inc a
  ret z

  jr jr_000_2a3c

  ret


jr_000_2a3c:
  call Call_000_02f5
  ld hl, $0000
  push hl
  ld hl, $0000
  push hl
  ld a, $4c
  push af
  inc sp
  call Call_000_2569
  add sp, $05
  ld hl, $c2b9
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  ret


Call_000_2a5f:
  ld hl, $c2b8
  ld a, [hl]
  rrca
  jr c, jr_000_2a7a

  push af
  pop af
  ld a, $09

jr_000_2a6a:
  ld hl, sp+$02
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, jr_000_2a6a

jr_000_2a7a:
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld a, $59
  push af
  inc sp
  call Call_000_2569
  add sp, $05
  ld a, e
  or a
  jr z, jr_000_2a96

  ld e, $d4
  ret


jr_000_2a96:
  call Call_000_02ec
  ld e, $00
  ret


Call_000_2a9c:
  call Call_000_2a24
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2a5f
  add sp, $04
  ld a, e
  or a
  ret nz

  ld hl, sp+$08
  ld d, [hl]
  push de
  inc sp
  dec hl
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_03be
  add sp, $03
  push de
  call Call_000_02f5
  pop de
  ld a, e
  or a
  ret nz

  call Call_000_2a24
  ld e, $00
  ret


Call_000_2ad1:
  call Call_000_2a24
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2a5f
  add sp, $04
  ld a, e
  or a
  ret nz

  ld hl, sp+$08
  ld d, [hl]
  push de
  inc sp
  dec hl
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_039e
  add sp, $03
  push de
  call Call_000_02f5
  pop de
  ld a, e
  or a
  ret nz

  call Call_000_2a24
  ld e, $00
  ret


Call_000_2b06:
  dec sp
  ld hl, sp+$03
  ld a, [hl]
  or a
  jr nz, jr_000_2b18

  ld hl, $c2bd
  ld a, [hl]
  or a
  jr nz, jr_000_2b18

  ld e, a
  jp Jump_000_2b58


jr_000_2b18:
  call Call_000_2a24
  ld hl, $c2bd
  ld [hl], $00
  ld e, $00
  ld hl, sp+$00
  ld [hl], $00

jr_000_2b26:
  dec e
  jr nz, jr_000_2b2d

  ld a, $01
  jr jr_000_2b2e

jr_000_2b2d:
  xor a

jr_000_2b2e:
  ld b, a
  or a
  jr nz, jr_000_2b4e

  ld hl, sp+$00
  ld c, [hl]
  inc [hl]
  ld a, c
  sub $08
  jr nc, jr_000_2b4e

  ld hl, $0000
  push hl
  ld hl, $0000
  push hl
  ld a, $40
  push af
  inc sp
  call Call_000_23cf
  add sp, $05
  jr jr_000_2b26

jr_000_2b4e:
  ld a, b
  or a
  jr nz, jr_000_2b56

  ld e, $c0
  jr jr_000_2b58

jr_000_2b56:
  ld e, $00

Jump_000_2b58:
jr_000_2b58:
  inc sp
  ret


Call_000_2b5a:
  add sp, -$05
  ld hl, sp+$08
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$03
  ld [hl+], a
  ld [hl], e
  push hl
  ld hl, sp+$0d
  ld a, [hl]
  ld hl, sp+$04
  ld [hl], a
  pop hl

jr_000_2b71:
  push hl
  ld hl, sp+$04
  ld a, [hl-]
  ld [hl], a
  pop hl
  ld hl, sp+$02
  dec [hl]
  dec hl
  ld a, [hl]
  or a
  jr z, jr_000_2b9d

  ld a, [bc]
  ld [hl], a
  inc bc
  ld hl, sp+$04
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$00
  ld [hl], a
  ld hl, sp+$03
  inc [hl]
  jr nz, jr_000_2b93

  inc hl
  inc [hl]

jr_000_2b93:
  ld hl, sp+$01
  ld a, [hl-]
  sub [hl]
  jr z, jr_000_2b71

  ld e, $00
  jr jr_000_2b9f

jr_000_2b9d:
  ld e, $01

jr_000_2b9f:
  add sp, $05
  ret


Call_000_2ba2:
  dec sp
  ld hl, sp+$00
  ld [hl], $00
  ld hl, sp+$04
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

jr_000_2bad:
  ld a, [bc]
  inc bc
  or a
  jr z, jr_000_2bb7

  ld hl, sp+$00
  inc [hl]
  jr jr_000_2bad

jr_000_2bb7:
  ld hl, sp+$00
  ld e, [hl]
  inc sp
  ret


Call_000_2bbc:
  add sp, -$02
  ld hl, sp+$05
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld a, [bc]
  sub $2e
  jr nz, jr_000_2bce

  inc bc
  dec hl
  ld [hl], c
  inc hl
  ld [hl], b

jr_000_2bce:
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2ba2
  add sp, $02
  ld b, e
  push bc
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2ba2
  add sp, $02
  pop bc
  ld c, e
  ld a, b
  sub c
  jr nc, jr_000_2bf0

  ld e, $00
  jr jr_000_2c15

jr_000_2bf0:
  ld hl, sp+$00
  ld [hl], b
  inc hl
  ld [hl], $00
  ld b, $00
  pop de
  push de
  ld a, e
  sub c
  ld e, a
  ld a, d
  sbc b
  ld b, a
  ld c, e
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  push bc
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2c52
  add sp, $04

jr_000_2c15:
  add sp, $02
  ret


Call_000_2c18:
  add sp, -$02
  ld hl, sp+$05
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

Jump_000_2c20:
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp+$00
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld a, [hl-]
  or [hl]
  jr z, jr_000_2c4d

  push bc
  ld hl, sp+$08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2bbc
  add sp, $04
  ld a, e
  pop bc
  or a
  jr z, jr_000_2c48

  ld e, $01
  jr jr_000_2c4f

jr_000_2c48:
  inc bc
  inc bc
  jp Jump_000_2c20


jr_000_2c4d:
  ld e, $00

jr_000_2c4f:
  add sp, $02
  ret


Call_000_2c52:
  add sp, -$04
  ld hl, sp+$06
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$08
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$02
  ld [hl+], a
  ld [hl], e

Jump_000_2c64:
  pop de
  push de
  ld a, [de]
  ld b, a
  ld hl, sp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld c, a
  ld a, b
  or a
  jr nz, jr_000_2c7d

  ld a, c
  or a
  jr nz, jr_000_2c7d

  ld e, $01
  jp Jump_000_2cae


jr_000_2c7d:
  ld hl, sp+$00
  inc [hl]
  jr nz, jr_000_2c84

  inc hl
  inc [hl]

jr_000_2c84:
  ld hl, sp+$02
  inc [hl]
  jr nz, jr_000_2c8b

  inc hl
  inc [hl]

jr_000_2c8b:
  ld a, b
  sub $41
  jr c, jr_000_2c99

  ld a, $5a
  sub b
  jr c, jr_000_2c99

  ld a, b
  set 5, a
  ld b, a

jr_000_2c99:
  ld a, c
  sub $41
  jr c, jr_000_2ca7

  ld a, $5a
  sub c
  jr c, jr_000_2ca7

  ld a, c
  set 5, a
  ld c, a

jr_000_2ca7:
  ld a, b
  sub c
  jp z, Jump_000_2c64

  ld e, $00

Jump_000_2cae:
  add sp, $04
  ret


Call_000_2cb1:
  add sp, -$05
  ld hl, sp+$07
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$02
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$09
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e
  push hl
  ld hl, sp+$0d
  ld a, [hl]
  ld hl, sp+$06
  ld [hl], a
  pop hl

Jump_000_2ccb:
  ld hl, sp+$04
  ld b, [hl]
  dec [hl]
  ld a, b
  or a
  jp z, Jump_000_2d1f

  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld b, a
  pop de
  push de
  ld a, [de]
  ld c, a
  ld a, b
  or a
  jr nz, jr_000_2cec

  ld a, c
  or a
  jr nz, jr_000_2cec

  ld e, $01
  jp Jump_000_2d21


jr_000_2cec:
  ld hl, sp+$02
  inc [hl]
  jr nz, jr_000_2cf3

  inc hl
  inc [hl]

jr_000_2cf3:
  ld hl, sp+$00
  inc [hl]
  jr nz, jr_000_2cfa

  inc hl
  inc [hl]

jr_000_2cfa:
  ld a, b
  sub $41
  jr c, jr_000_2d08

  ld a, $5a
  sub b
  jr c, jr_000_2d08

  ld a, b
  set 5, a
  ld b, a

jr_000_2d08:
  ld a, c
  sub $41
  jr c, jr_000_2d16

  ld a, $5a
  sub c
  jr c, jr_000_2d16

  ld a, c
  set 5, a
  ld c, a

jr_000_2d16:
  ld a, b
  sub c
  jp z, Jump_000_2ccb

  ld e, $00
  jr jr_000_2d21

Jump_000_2d1f:
  ld e, $01

Jump_000_2d21:
jr_000_2d21:
  add sp, $05
  ret


Call_000_2d24:
  add sp, -$02
  ld hl, sp+$04
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$07
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

jr_000_2d34:
  pop de
  push de
  ld a, [de]
  or a
  jr z, jr_000_2d45

  ld hl, sp+$00
  inc [hl]
  jr nz, jr_000_2d41

  inc hl
  inc [hl]

jr_000_2d41:
  ld [bc], a
  inc bc
  jr jr_000_2d34

jr_000_2d45:
  xor a
  ld [bc], a
  add sp, $02
  ret


Call_000_2d4a:
  add sp, -$02
  ld hl, sp+$05
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

jr_000_2d52:
  ld a, [bc]
  or a
  jr z, jr_000_2d59

  inc bc
  jr jr_000_2d52

jr_000_2d59:
  ld hl, sp+$06
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$00
  ld [hl+], a
  ld [hl], e

jr_000_2d61:
  pop de
  push de
  ld a, [de]
  or a
  jr z, jr_000_2d72

  ld hl, sp+$00
  inc [hl]
  jr nz, jr_000_2d6e

  inc hl
  inc [hl]

jr_000_2d6e:
  ld [bc], a
  inc bc
  jr jr_000_2d61

jr_000_2d72:
  xor a
  ld [bc], a
  add sp, $02
  ret


Call_000_2d77:
  add sp, -$0d
  ld hl, sp+$0a
  ld c, l
  ld b, h
  xor a
  ld [bc], a
  ld hl, sp+$12
  ld a, [hl-]
  or [hl]
  dec hl
  or [hl]
  dec hl
  or [hl]
  jr nz, jr_000_2d8d

  dec bc
  ld a, $30
  ld [bc], a

jr_000_2d8d:
  ld hl, sp+$0b
  ld [hl], c
  inc hl
  ld [hl], b

Jump_000_2d92:
  ld hl, sp+$0f
  ld a, [hl+]
  or [hl]
  inc hl
  or [hl]
  inc hl
  or [hl]
  jp z, Jump_000_2df4

  ld hl, sp+$0c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  dec de
  dec hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld hl, $0000
  push hl
  ld hl, $000a
  push hl
  ld hl, sp+$15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $6c4d
  add sp, $08
  ld b, l
  ld c, h
  ld a, e
  add $30
  ld b, a
  ld hl, sp+$0b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, $0000
  push hl
  ld hl, $000a
  push hl
  ld hl, sp+$15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $6c53
  add sp, $08
  ld b, l
  ld c, h
  ld hl, sp+$0f
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], b
  inc hl
  ld [hl], c
  jp Jump_000_2d92


Jump_000_2df4:
  ld hl, sp+$0b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$15
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2d4a
  add sp, $04
  add sp, $0d
  ret


Call_000_2e08:
  add sp, -$02
  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2ba2
  add sp, $02
  ld b, e
  ld hl, sp+$06
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld l, b
  ld h, $00
  add hl, de
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
  xor a
  ld [bc], a
  dec hl
  dec hl
  ld a, [hl]
  swap a
  and $0f
  ld hl, sp+$01
  ld [hl], a
  ld a, $09
  sub [hl]
  jr nc, jr_000_2e41

  ld a, [hl]
  add $07
  ld [hl], a

jr_000_2e41:
  ld hl, sp+$06
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp+$01
  ld a, [hl]
  add $30
  ld [bc], a
  ld hl, sp+$04
  ld a, [hl]
  and $0f
  ld hl, sp+$00
  ld [hl], a
  ld a, $09
  sub [hl]
  jr nc, jr_000_2e5e

  ld a, [hl]
  add $07
  ld [hl], a

jr_000_2e5e:
  inc bc
  ld hl, sp+$00
  ld a, [hl]
  add $30
  ld [bc], a
  add sp, $02
  ret


Call_000_2e68:
  ld hl, sp+$03
  ld d, [hl]
  ld e, $00
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  inc sp
  call Call_000_2e08
  add sp, $03
  ld hl, sp+$02
  ld d, [hl]
  ld e, $00
  inc hl
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  inc sp
  call Call_000_2e08
  add sp, $03
  ret


  push af
  ld hl, sp+$04
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld b, [hl]
  inc hl
  ld c, [hl]
  pop af
  ld a, $10

jr_000_2e99:
  srl c
  rr b
  rr d
  rr e
  dec a
  jr nz, jr_000_2e99

  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call Call_000_2e68
  add sp, $04
  ld hl, sp+$02
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld b, $00
  ld c, $00
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push de
  call Call_000_2e68
  add sp, $04
  ret


Call_000_2ec6:
  add sp, -$08
  ld de, $c2f2
  ld hl, $0001
  push hl
  push de
  ld hl, $0000
  push hl
  ld hl, $0001
  push hl
  call Call_000_28b6
  add sp, $08
  ld hl, $c2de
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  ld hl, $c2ca
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  ld hl, $c2ce
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  xor a
  ld hl, $c2c6
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  ld hl, $0000
  push hl
  ld hl, $0000
  push hl
  call $30bd
  add sp, $04
  ld a, e
  or a
  jp nz, Jump_000_30ad

  call Call_000_3197
  ld hl, $c2e5
  ld [hl], e
  ld a, [hl]
  or a
  jr nz, jr_000_2f61

  ld de, $c4b8
  ld hl, $c2c6
  push hl
  push de
  call $4323
  add sp, $04
  ld hl, $c2c8
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, $c2c6
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $30bd
  add sp, $04
  ld a, e
  or a
  jp nz, Jump_000_30ad

  call Call_000_3197
  ld hl, $c2e5
  ld [hl], e
  ld a, [hl]
  or a
  jr nz, jr_000_2f61

  ld e, $f6
  jp Jump_000_30ad


jr_000_2f61:
  ld hl, $c2e5
  ld a, [hl]
  dec a
  jr nz, jr_000_2f6d

  ld e, $fb
  jp Jump_000_30ad


jr_000_2f6d:
  ld de, $c316
  ld hl, $c2d2
  push hl
  push de
  call $4323
  add sp, $04
  push af
  ld hl, $c2d2
  ld a, [hl]
  ld hl, $c2be
  ld [hl], a
  ld hl, $c2d3
  ld a, [hl]
  ld hl, $c2bf
  ld [hl], a
  ld hl, $c2d4
  ld a, [hl]
  ld hl, $c2c0
  ld [hl], a
  ld hl, $c2d5
  ld a, [hl]
  ld hl, $c2c1
  ld [hl], a
  pop af
  ld a, $07

jr_000_2f9e:
  ld hl, $c2be
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, jr_000_2f9e

  ld de, $c300
  push de
  call Call_000_31ce
  add sp, $02
  ld hl, $c2e2
  ld [hl], e
  inc hl
  ld [hl], d
  ld bc, $c2ff
  ld a, [bc]
  ld hl, $c2e4
  ld [hl], a
  push af
  ld hl, $c2d2
  ld a, [hl]
  ld hl, sp+$02
  ld [hl], a
  ld hl, $c2d3
  ld a, [hl]
  ld hl, sp+$03
  ld [hl], a
  ld hl, $c2d4
  ld a, [hl]
  ld hl, sp+$04
  ld [hl], a
  ld hl, $c2d5
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
  ld hl, $c2c6
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
  ld hl, $c2c8
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
  ld hl, $c2e2
  ld a, [hl]
  ld hl, sp+$04
  ld [hl], a
  ld hl, $c2e3
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
  ld hl, $c2d7
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
  ld hl, $c2d9
  ld [hl-], a
  ld [hl], e
  ld hl, $c2c7
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
  ld hl, $c2c3
  ld [hl-], a
  ld [hl], e
  ld hl, $c2c9
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
  ld hl, $c2c5
  ld [hl-], a
  ld [hl], e
  ld hl, $c2d6
  ld d, h
  ld e, l
  ld hl, $c2da
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
  ld hl, $c2e4
  ld b, [hl]
  ld hl, $c2e6
  ld [hl], $00

jr_000_3094:
  ld a, $01
  sub b
  jr nc, jr_000_30a1

  srl b
  ld hl, $c2e6
  inc [hl]
  jr jr_000_3094

jr_000_30a1:
  ld hl, $c2e7
  ld [hl], $02
  xor a
  inc hl
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  ld e, $00

Jump_000_30ad:
  add sp, $08
  ret


  ld bc, $0503
  rlca
  add hl, bc
  ld c, $10
  ld [de], a
  inc d
  ld d, $18
  inc e
  ld e, $f8
  ld [bc], a
  ld a, [hl]
  ld hl, $c2ca
  sub [hl]
  jr nz, jr_000_30e3

  ld hl, sp+$03
  ld a, [hl]
  ld hl, $c2cb
  sub [hl]
  jr nz, jr_000_30e3

  ld hl, sp+$04
  ld a, [hl]
  ld hl, $c2cc
  sub [hl]
  jr nz, jr_000_30e3

  ld hl, sp+$05
  ld a, [hl]
  ld hl, $c2cd
  sub [hl]
  jr nz, jr_000_30e3

  ld e, a
  ret


jr_000_30e3:
  ld hl, sp+$02
  ld e, [hl]
  inc hl
  ld d, [hl]
  inc hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $c2ca
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, $0001
  push hl
  ld hl, $c2f2
  push hl
  push bc
  push de
  call Call_000_28b6
  add sp, $08
  ret


Call_000_3106:
  add sp, -$04
  ld hl, sp+$06
  ld a, [hl]
  ld hl, $c2ce
  sub [hl]
  jr nz, jr_000_3130

  ld hl, sp+$07
  ld a, [hl]
  ld hl, $c2cf
  sub [hl]
  jr nz, jr_000_3130

  ld hl, sp+$08
  ld a, [hl]
  ld hl, $c2d0
  sub [hl]
  jr nz, jr_000_3130

  ld hl, sp+$09
  ld a, [hl]
  ld hl, $c2d1
  sub [hl]
  jr nz, jr_000_3130

  ld e, a
  jp Jump_000_3194


jr_000_3130:
  ld hl, sp+$06
  ld d, h
  ld e, l
  ld hl, $c2ce
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
  ld hl, $c2c2
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
  ld hl, $c2c4
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
  ld de, $c4f2
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
  call Call_000_28b6
  add sp, $08

Jump_000_3194:
  add sp, $04
  ret


Call_000_3197:
  ld de, $c328
  ld a, $03
  push af
  inc sp
  ld hl, $31ca
  push hl
  push de
  call Call_000_2b5a
  add sp, $05
  ld a, e
  or a
  jr z, jr_000_31af

  ld e, $01
  ret


jr_000_31af:
  ld bc, $31ca
  ld de, $c344
  ld a, $03
  push af
  inc sp
  push bc
  push de
  call Call_000_2b5a
  add sp, $05
  ld a, e
  or a
  jr z, jr_000_31c7

  ld e, $02
  ret


jr_000_31c7:
  ld e, $00
  ret


  ld b, [hl]
  ld b, c
  ld d, h
  nop

Call_000_31ce:
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


Call_000_31eb:
  add sp, -$1a
  ld hl, sp+$0a
  ld [hl], $00
  ld hl, sp+$19
  ld [hl], $00
  ld hl, $c2ef
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
  ld hl, $c2de
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
  jr nz, jr_000_323c

  ld hl, $c2d6
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
  ld hl, sp+$1c
  ld [hl], $02
  xor a
  inc hl
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  xor a
  ld hl, $c2eb
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  jp Jump_000_32a9


jr_000_323c:
  push de
  push bc
  call Call_000_34ab
  add sp, $04
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
  call $30bd
  add sp, $04
  ld a, e
  or a
  jp nz, Jump_000_34a8

  ld de, $c326
  push de
  call Call_000_31ce
  add sp, $02
  ld hl, $c2eb
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

jr_000_327c:
  ld hl, $c2eb
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, jr_000_327c

  ld de, $c32c
  push de
  call Call_000_31ce
  add sp, $02
  ld b, $00
  ld c, $00
  ld hl, $c2eb
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

Jump_000_32a9:
  ld hl, sp+$04
  ld a, [hl]
  ld hl, $c2d6
  sub [hl]
  jr nz, jr_000_32d1

  ld hl, sp+$05
  ld a, [hl]
  ld hl, $c2d7
  sub [hl]
  jr nz, jr_000_32d1

  ld hl, sp+$06
  ld a, [hl]
  ld hl, $c2d8
  sub [hl]
  jr nz, jr_000_32d1

  ld hl, sp+$07
  ld a, [hl]
  ld hl, $c2d9
  sub [hl]
  jr nz, jr_000_32d1

  ld a, $01
  jr jr_000_32d3

jr_000_32d1:
  ld a, $00

jr_000_32d3:
  ld hl, $c2f1
  ld [hl], a

Jump_000_32d7:
  ld hl, sp+$04
  ld d, h
  ld e, l
  ld hl, sp+$0f
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
  ld hl, sp+$08
  ld [hl], $00

Jump_000_32ec:
  ld hl, sp+$08
  ld a, [hl]
  ld hl, $c2e4
  sub [hl]
  jp nc, Jump_000_347b

  push af
  ld hl, sp+$11
  ld a, [hl]
  ld hl, sp+$02
  ld [hl], a
  ld hl, sp+$12
  ld a, [hl]
  ld hl, sp+$03
  ld [hl], a
  ld hl, sp+$13
  ld a, [hl]
  ld hl, sp+$04
  ld [hl], a
  ld hl, sp+$14
  ld a, [hl]
  ld hl, sp+$05
  ld [hl], a
  pop af
  ld a, $04

jr_000_3312:
  ld hl, sp+$00
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, jr_000_3312

  ld hl, sp+$11
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$11
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $30bd
  add sp, $04
  ld a, e
  or a
  jp nz, Jump_000_34a8

  ld hl, sp+$0d
  ld [hl], $f2
  inc hl
  ld [hl], $c2
  ld hl, sp+$09
  ld [hl], $00

Jump_000_3343:
  ld hl, sp+$0e
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
  jr nz, jr_000_3355

  ld e, a
  jp Jump_000_34a8


jr_000_3355:
  ld hl, sp+$0c
  ld a, [hl]
  sub $e5
  jr z, jr_000_3363

  ld hl, sp+$0c
  ld a, [hl]
  sub $2e
  jr nz, jr_000_336a

jr_000_3363:
  ld hl, sp+$0a
  ld [hl], $00
  jp Jump_000_344b


jr_000_336a:
  ld hl, sp+$0e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000b
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld hl, sp+$0b
  ld [hl], a
  ld hl, $c2f0
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  sla c
  rl b
  sla c
  rl b
  ld hl, sp+$09
  ld a, [hl]
  ld hl, sp+$15
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, $c6f2
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$15
  ld a, [hl]
  ld hl, sp+$00
  or [hl]
  ld hl, sp+$15
  ld [hl+], a
  ld a, [hl]
  ld hl, sp+$01
  or [hl]
  ld hl, sp+$16
  ld [hl+], a
  ld a, [hl]
  ld hl, sp+$02
  or [hl]
  ld hl, sp+$17
  ld [hl+], a
  ld a, [hl]
  ld hl, sp+$03
  or [hl]
  ld hl, sp+$18
  ld [hl], a
  ld hl, sp+$0b
  ld a, [hl]
  sub $0f
  jp nz, Jump_000_33fc

  ld hl, sp+$0e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0001
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$13
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$19
  ld [hl], a
  ld hl, sp+$0c
  ld a, [hl]
  and $f0
  sub $40
  jp nz, Jump_000_344b

  dec hl
  dec hl
  ld [hl], $01
  ld hl, sp+$15
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
  jp Jump_000_344b


Jump_000_33fc:
  ld hl, sp+$19
  ld a, [hl]
  sub $2e
  jr nz, jr_000_3409

  ld hl, sp+$0a
  ld a, [hl]
  or a
  jr nz, jr_000_3410

jr_000_3409:
  ld hl, sp+$0b
  ld a, [hl]
  and $0a
  jr z, jr_000_3417

jr_000_3410:
  ld hl, sp+$0a
  ld [hl], $00
  jp Jump_000_344b


jr_000_3417:
  ld hl, sp+$0a
  ld a, [hl]
  or a
  jr nz, jr_000_342d

  ld hl, sp+$15
  ld a, [hl]

Jump_000_3420:
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

jr_000_342d:
  ld hl, $c2ef
  inc [hl]
  jr nz, jr_000_3435

  inc hl
  inc [hl]

jr_000_3435:
  ld hl, sp+$0a
  ld [hl], $00
  ld hl, $c2ef
  ld a, [hl]
  sub $e8
  jr nz, jr_000_344b

  inc hl
  ld a, [hl]
  sub $03
  jr nz, jr_000_344b

  ld e, a
  jp Jump_000_34a8


Jump_000_344b:
jr_000_344b:
  ld hl, sp+$09
  inc [hl]
  ld hl, sp+$0e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0020
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$0d
  ld [hl+], a
  ld [hl], d
  ld hl, sp+$09
  ld a, [hl]
  sub $10
  jp c, Jump_000_3343

  ld hl, sp+$0f
  inc [hl]
  jr nz, jr_000_3475

  inc hl
  inc [hl]
  jr nz, jr_000_3475

  inc hl
  inc [hl]
  jr nz, jr_000_3475

  inc hl
  inc [hl]

jr_000_3475:
  ld hl, sp+$08
  inc [hl]
  jp Jump_000_32ec


Jump_000_347b:
  ld hl, sp+$1c
  ld e, l
  ld d, h
  push de
  call Call_000_3645
  add sp, $02
  ld a, e
  or a
  jr nz, jr_000_34a8

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
  call Call_000_34ab
  add sp, $04
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
  jp Jump_000_32d7


Jump_000_34a8:
jr_000_34a8:
  add sp, $1a
  ret


Call_000_34ab:
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
  ld hl, $d6a3
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
  ld hl, $d6a5
  ld [hl-], a
  ld [hl], e
  ld hl, $c2e6
  ld a, [hl]
  or a
  jr z, jr_000_34ef

  ld a, [hl]
  push af
  pop af
  inc a
  jr jr_000_34ec

jr_000_34de:
  ld hl, $d6a2
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]

jr_000_34ec:
  dec a
  jr nz, jr_000_34de

jr_000_34ef:
  ld hl, $d6a3
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, $c2da
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld hl, $d6a3
  ld [hl-], a
  ld [hl], e
  ld hl, $d6a5
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $c2dc
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld hl, $d6a5
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


Call_000_3525:
  ld hl, sp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, $c2da
  sub [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  push af
  ld hl, $d6a7
  ld [hl-], a
  ld [hl], e
  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $c2dc
  pop af
  ld a, e
  sbc [hl]
  ld e, a
  ld a, d
  inc hl
  sbc [hl]
  ld hl, $d6a9
  ld [hl-], a
  ld [hl], e
  ld hl, $c2e6
  ld a, [hl]
  or a
  jr z, jr_000_356d

  ld a, [hl]
  push af
  pop af
  inc a
  jr jr_000_356a

jr_000_355c:
  ld hl, $d6a9
  srl [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]

jr_000_356a:
  dec a
  jr nz, jr_000_355c

jr_000_356d:
  ld hl, $d6a7
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
  ld hl, $d6a9
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


Call_000_3599:
  ld hl, sp+$03
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, $c2da
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
  ld hl, $c2dc
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
  ld hl, $c2e4
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


Call_000_35df:
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

jr_000_35ee:
  srl b
  rr c
  rr d
  rr e
  dec a
  jr nz, jr_000_35ee

  push bc
  push de
  call Call_000_3106
  add sp, $04
  ld a, e
  or a
  jp nz, Jump_000_3642

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

jr_000_361c:
  ld hl, sp+$00
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, jr_000_361c

  ld de, $c4f2
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
  call $4323
  add sp, $04
  ld e, $00

Jump_000_3642:
  add sp, $04
  ret


Call_000_3645:
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
  call Call_000_35df
  add sp, $06
  add sp, $04
  ret


Call_000_3670:
  add sp, -$23
  ld hl, sp+$29
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$1f
  ld [hl+], a
  ld [hl], e
  dec hl
  ld d, [hl]
  inc hl
  ld e, [hl]
  ld hl, sp+$0c
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
  ld hl, sp+$1e
  ld [hl], d
  push af
  ld hl, sp+$27
  ld a, [hl]
  ld hl, sp+$06
  ld [hl], a
  ld hl, sp+$28
  ld a, [hl]
  ld hl, sp+$07
  ld [hl], a
  ld hl, sp+$29
  ld a, [hl]
  ld hl, sp+$08
  ld [hl], a
  ld hl, sp+$2a
  ld a, [hl]
  ld hl, sp+$09
  ld [hl], a
  pop af
  ld a, $04

jr_000_36ae:
  ld hl, sp+$07
  srl [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec a
  jr nz, jr_000_36ae

  inc hl
  inc hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_3525
  add sp, $04
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
  call Call_000_3599
  add sp, $04
  ld hl, sp+$0a
  ld [hl], e
  ld hl, sp+$1e
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
  ld hl, $c2f2
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$21
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00
  ld hl, sp+$0d
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
  ld hl, sp+$20
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

Jump_000_3743:
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
  call $30bd
  add sp, $04
  ld a, e
  or a
  jr z, jr_000_375c

  ld e, a
  jp Jump_000_3a3c


jr_000_375c:
  ld hl, sp+$21
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$1c
  ld [hl+], a
  ld [hl], e
  push hl
  inc hl
  ld a, [hl]
  ld hl, sp+$1d
  ld [hl], a
  pop hl

Jump_000_376b:
  ld hl, sp+$1b
  ld a, [hl]
  sub $10
  jp nc, Jump_000_3824

  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000b
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  sub $0f
  jp nz, Jump_000_3824

  ld hl, sp+$1d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp+$1a
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
  ld hl, sp+$0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$08
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$1a
  ld a, [hl]
  and $40
  sub $40
  jr nz, jr_000_37cc

  ld hl, sp+$09
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $000d
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$18
  ld [hl+], a
  ld [hl], d
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00

jr_000_37cc:
  ld hl, sp+$18
  ld [hl], $b0
  inc hl
  ld [hl], $30
  ld hl, sp+$09
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc hl
  inc hl
  ld [hl], $00

Jump_000_37dd:
  ld hl, sp+$19
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  inc hl
  ld [hl-], a
  dec hl
  inc [hl]
  jr nz, jr_000_37ec

  inc hl
  inc [hl]

jr_000_37ec:
  ld hl, sp+$1d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$1a
  ld l, [hl]
  ld h, $00
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$12
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld [bc], a
  inc bc
  ld hl, sp+$0b
  inc [hl]
  ld a, [hl]
  sub $0d
  jp c, Jump_000_37dd

  ld hl, sp+$1d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0020
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$1c
  ld [hl+], a
  ld [hl], d
  dec hl
  dec hl
  inc [hl]
  jp Jump_000_376b


Jump_000_3824:
  ld hl, sp+$1c
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$12
  ld [hl+], a
  ld [hl], e
  push hl
  ld hl, sp+$1d
  ld a, [hl]
  ld hl, sp+$20
  ld [hl], a
  pop hl
  ld hl, sp+$1b
  ld a, [hl]
  sub $10
  jp nz, Jump_000_3895

  ld hl, sp+$1e
  ld [hl], $00
  ld hl, sp+$21
  ld [hl], $f2
  inc hl
  ld [hl], $c2
  ld hl, sp+$0a
  inc [hl]
  ld hl, sp+$04
  inc [hl]
  jr nz, jr_000_3859

  inc hl
  inc [hl]
  jr nz, jr_000_3859

  inc hl
  inc [hl]
  jr nz, jr_000_3859

  inc hl
  inc [hl]

jr_000_3859:
  ld hl, sp+$0a
  ld a, [hl]
  ld hl, $c2e4
  sub [hl]
  jp nz, Jump_000_3743

  ld hl, sp+$00
  ld e, l
  ld d, h
  push de
  call Call_000_3645
  add sp, $02
  ld a, e
  or a
  jp nz, Jump_000_3a3c

  ld hl, sp+$02
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$02
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_34ab
  add sp, $04
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
  ld hl, sp+$0a
  ld [hl], $00
  jp Jump_000_3743


Jump_000_3895:
  ld hl, sp+$0d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  or a
  jp nz, Jump_000_38e3

  dec hl
  dec hl
  ld [hl], $00

Jump_000_38a4:
  ld hl, sp+$0d
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
  ld hl, sp+$18
  ld [hl+], a
  ld [hl], d
  ld hl, sp+$13
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$0b
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld b, a
  ld hl, sp+$18
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp+$0b
  inc [hl]
  ld a, [hl]
  sub $0b
  jp c, Jump_000_38a4

  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  dec hl
  dec hl
  ld l, [hl]
  ld h, $00
  add hl, de
  ld c, l
  ld b, h
  xor a
  ld [bc], a

Jump_000_38e3:
  ld hl, sp+$20
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00d8
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$18
  ld [hl+], a
  ld [hl], d
  push af
  ld hl, sp+$06
  ld a, [hl]
  ld hl, sp+$16
  ld [hl], a
  ld hl, sp+$07
  ld a, [hl]
  ld hl, sp+$17
  ld [hl], a
  ld hl, sp+$08
  ld a, [hl]
  ld hl, sp+$18
  ld [hl], a
  ld hl, sp+$09
  ld a, [hl]
  ld hl, sp+$19
  ld [hl], a
  pop af
  ld a, $04

jr_000_390f:
  ld hl, sp+$14
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, jr_000_390f

  ld hl, sp+$1e
  ld d, [hl]
  ld e, $00
  ld bc, $0000
  ld hl, sp+$14
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
  ld [hl+], a
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$14
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
  ld hl, sp+$20
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00e4
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$14
  ld [hl+], a
  ld [hl], d
  dec hl
  dec hl
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
  ld hl, sp+$14
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp+$20
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00dc
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$14
  ld [hl+], a
  ld [hl], d
  dec hl
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0014
  add hl, de
  ld c, l
  ld b, h
  push bc
  call Call_000_31ce
  add sp, $02
  ld hl, sp+$0e
  ld [hl], e
  inc hl
  ld [hl], d
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$15
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$0e
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

jr_000_39b5:
  ld hl, sp+$0e
  sla [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  inc hl
  rl [hl]
  dec a
  jr nz, jr_000_39b5

  ld hl, sp+$15
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$0e
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
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $001a
  add hl, de
  ld c, l
  ld b, h
  push bc
  call Call_000_31ce
  add sp, $02
  ld b, $00
  ld c, $00
  ld hl, sp+$0e
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
  ld hl, sp+$15
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$0e
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
  ld hl, sp+$20
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00e0
  add hl, de
  ld c, l
  ld b, h
  ld hl, sp+$13
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $001c
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$0e
  ld [hl+], a
  ld [hl], d
  push bc
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $4323
  add sp, $04
  ld e, $00

Jump_000_3a3c:
  add sp, $23
  ret


Call_000_3a3f:
  add sp, -$08
  ld hl, sp+$0a
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$06
  ld [hl+], a
  ld [hl], e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00e4
  add hl, de
  ld c, l
  ld b, h
  ld a, [bc]
  ld c, a
  or a
  jr z, jr_000_3a5d

  ld e, $f5
  jp Jump_000_3c17


jr_000_3a5d:
  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00e0
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$04
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
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
  ld de, $d69a
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
  push af
  ld hl, sp+$02
  ld b, [hl]
  inc hl
  ld c, [hl]
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  pop af
  ld a, $09

jr_000_3a9e:
  srl d
  rr e
  rr c
  rr b
  dec a
  jr nz, jr_000_3a9e

  ld hl, $d69e
  ld [hl], b
  inc hl
  ld [hl], c
  ld hl, sp+$00
  ld a, [hl]
  or a
  jr nz, jr_000_3aba

  inc hl
  bit 0, [hl]
  jr z, jr_000_3ac9

jr_000_3aba:
  ld de, $d69e
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  inc bc
  ld hl, $d69e
  ld [hl], c
  inc hl
  ld [hl], b

jr_000_3ac9:
  ld de, $d69e
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
  jp nc, Jump_000_3b28

  ld hl, sp+$0c
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$08
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call $46df
  add sp, $04
  ld a, e
  or a
  jp nz, Jump_000_3c17

  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00d4
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
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
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_3670
  add sp, $06
  ld a, e
  or a
  jp nz, Jump_000_3c17

Jump_000_3b28:
  ld hl, sp+$07
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $00dc
  add hl, de
  ld b, l
  ld c, h
  ld e, b
  ld d, c
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
  ld de, $d692
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
  dec hl
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$02
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_34ab
  add sp, $04
  push hl
  ld hl, sp+$02
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld de, $d696
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
  ld bc, $d6a1
  xor a
  ld [bc], a
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
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
  ld de, $d69a
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
  ld bc, $d6a0
  ld hl, sp+$0d
  ld a, [hl-]
  or [hl]
  jr z, jr_000_3bba

  ld a, $01
  jr jr_000_3bbc

jr_000_3bba:
  ld a, $00

jr_000_3bbc:
  ld [bc], a
  ld de, $d69a
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
  push af
  ld hl, sp+$02
  ld b, [hl]
  inc hl
  ld c, [hl]
  inc hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  pop af
  ld a, $09

jr_000_3bda:
  srl d
  rr e
  rr c
  rr b
  dec a
  jr nz, jr_000_3bda

  ld hl, $d69e
  ld [hl], b
  inc hl
  ld [hl], c
  ld de, $d69a
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
  ld a, [hl]
  or a
  jr nz, jr_000_3c06

  inc hl
  bit 0, [hl]
  jr z, jr_000_3c15

jr_000_3c06:
  ld de, $d69e
  ld a, [de]
  ld c, a
  inc de
  ld a, [de]
  ld b, a
  inc bc
  ld hl, $d69e
  ld [hl], c
  inc hl
  ld [hl], b

jr_000_3c15:
  ld e, $00

Jump_000_3c17:
  add sp, $08
  ret


  add sp, -$04
  ld de, $d69e
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
  jr nc, jr_000_3c32

  ld e, $f3
  jp Jump_000_3cf3


jr_000_3c32:
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
  ld hl, $d69e
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$07
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]

Jump_000_3c4b:
  ld a, b
  or c
  jp z, Jump_000_3cf1

  ld de, $d696
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
  jr nz, jr_000_3c6f

  inc hl
  inc [hl]
  jr nz, jr_000_3c6f

  inc hl
  inc [hl]
  jr nz, jr_000_3c6f

  inc hl
  inc [hl]

jr_000_3c6f:
  ld de, $d696
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
  ld a, [$d6a1]
  inc a
  ld hl, sp+$00
  ld [hl], a
  ld de, $d6a1
  ld a, [hl]
  ld [de], a
  dec bc
  ld hl, $c2e4
  ld a, [hl]
  ld hl, sp+$00
  sub [hl]
  jp nz, Jump_000_3c4b

  ld hl, $d6a1
  ld [hl], $00
  ld de, $d692
  push bc
  push de
  call Call_000_3645
  add sp, $02
  pop bc
  ld a, e
  or a
  jp nz, Jump_000_3cf3

  ld de, $d692
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
  call Call_000_34ab
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
  ld de, $d696
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
  jp Jump_000_3c4b


Jump_000_3cf1:
  ld e, $00

Jump_000_3cf3:
  add sp, $04
  ret


Call_000_3cf6:
  add sp, -$12
  ld bc, $d6a0
  ld a, [bc]
  ld hl, sp+$07
  ld [hl], a
  ld a, [hl]
  or a
  jr z, jr_000_3d08

  ld e, $f7
  jp Jump_000_3f1d


jr_000_3d08:
  ld de, $d69e
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
  jr nc, jr_000_3d1e

  ld e, $f3
  jp Jump_000_3f1d


jr_000_3d1e:
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
  ld hl, $d69e
  ld [hl], b
  inc hl
  ld [hl], c

Jump_000_3d32:
  ld hl, sp+$17
  ld a, [hl-]
  or [hl]
  jp z, Jump_000_3f1b

  ld de, $d6a1
  ld a, [de]
  ld c, a
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$0c
  ld [hl+], a
  ld [hl], e
  ld a, c
  or a
  jr nz, jr_000_3d64

  ld hl, $c2e4
  ld b, [hl]
  ld c, $00
  ld hl, sp+$16
  ld a, b
  sub [hl]
  inc hl
  ld a, c
  sbc [hl]
  jr c, jr_000_3d5c

  ld hl, sp+$0c
  ld b, [hl]
  inc hl
  ld c, [hl]

jr_000_3d5c:
  ld hl, sp+$01
  ld [hl], b
  inc hl
  ld [hl], c
  jp Jump_000_3d95


jr_000_3d64:
  ld hl, $c2e4
  ld a, [hl]
  ld hl, sp+$0e
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
  ld hl, sp+$01
  ld [hl], c
  inc hl
  ld [hl], b
  ld hl, sp+$16
  ld d, h
  ld e, l
  ld hl, sp+$01
  ld a, [de]
  sub [hl]
  inc hl
  inc de
  ld a, [de]
  sbc [hl]
  jr nc, jr_000_3d95

  ld hl, sp+$0c
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], e

Jump_000_3d95:
jr_000_3d95:
  ld hl, sp+$14
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$0e
  ld [hl+], a
  ld [hl], e
  ld de, $d696
  ld a, [de]
  ld hl, sp+$03
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
  jp nz, Jump_000_3df8

  ld hl, sp+$01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$10
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_296d
  add sp, $08
  ld hl, sp+$0c
  ld [hl], e
  ld hl, sp+$14
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$10
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
  ld hl, sp+$01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$10
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], c
  inc hl
  ld [hl], b
  jp Jump_000_3e2c


Jump_000_3df8:
  ld hl, sp+$01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$10
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  ld hl, sp+$09
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_28b6
  add sp, $08
  ld hl, sp+$0c
  ld [hl], e
  ld hl, sp+$01
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

Jump_000_3e2c:
  ld hl, sp+$0c
  ld a, [hl]
  or a
  jr z, jr_000_3e36

  ld e, [hl]
  jp Jump_000_3f1d


jr_000_3e36:
  ld de, $d6a1
  ld a, [de]
  ld b, a
  ld hl, sp+$01
  ld d, [hl]
  ld a, b
  add d
  ld b, a
  ld hl, $d6a1
  ld [hl], b
  ld hl, sp+$17
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$01
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld a, e
  sub l
  ld e, a
  ld a, d
  sbc h
  ld hl, sp+$17
  ld [hl-], a
  ld [hl], e
  ld hl, $c2e4
  ld a, [hl]
  sub b
  jp nz, Jump_000_3ec2

  ld hl, $d6a1
  ld [hl], $00
  ld de, $d692
  push de
  call Call_000_3645
  add sp, $02
  ld hl, sp+$00
  ld [hl], e
  ld a, [hl]
  or a
  jr z, jr_000_3e7a

  ld e, [hl]
  jp Jump_000_3f1d


jr_000_3e7a:
  ld de, $d692
  ld a, [de]
  ld hl, sp+$03
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
  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_34ab
  add sp, $04
  push hl
  ld hl, sp+$05
  ld [hl], e
  inc hl
  ld [hl], d
  pop de
  inc hl
  ld [hl], e
  inc hl
  ld [hl], d
  ld de, $d696
  ld hl, sp+$03
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
  ld hl, sp+$00
  ld a, [hl]
  or a
  jp z, Jump_000_3d32

  ld e, [hl]
  jp Jump_000_3f1d


Jump_000_3ec2:
  ld de, $d696
  ld a, [de]
  ld hl, sp+$03
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
  ld hl, sp+$01
  ld a, [hl]
  ld hl, sp+$08
  ld [hl], a
  ld hl, sp+$02
  ld a, [hl]
  ld hl, sp+$09
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$04
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, e
  ld hl, sp+$08
  add [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  push af
  ld [hl-], a
  ld [hl], e
  dec hl
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$0c
  pop af
  ld a, e
  adc [hl]
  ld e, a
  ld a, d
  inc hl
  adc [hl]
  ld [hl-], a
  ld [hl], e
  ld de, $d696
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
  jp Jump_000_3d32


Jump_000_3f1b:
  ld e, $00

Jump_000_3f1d:
  add sp, $12
  ret


Call_000_3f20:
  pop de
  pop bc
  push bc
  push de
  xor a
  ld [bc], a
  push bc
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  call Call_000_2d4a
  add sp, $04
  pop bc
  push bc
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2ba2
  add sp, $02
  pop bc
  dec e
  jr z, jr_000_3f50

  ld de, $3f5d
  push bc
  push de
  push bc
  call Call_000_2d4a
  add sp, $04
  pop bc

jr_000_3f50:
  ld hl, sp+$06
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  push bc
  call Call_000_2d4a
  add sp, $04
  ret


  cpl
  nop

Call_000_3f5f:
  add sp, -$09
  ld hl, sp+$00
  ld [hl], $00
  ld hl, sp+$11
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$05
  ld [hl+], a
  ld [hl], e
  dec hl
  ld a, [hl+]
  ld e, [hl]
  inc hl
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00
  ld hl, sp+$0d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2ba2
  add sp, $02
  ld b, e
  push bc
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
  ld hl, sp+$0b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_3f20
  add sp, $06
  pop bc
  ld hl, sp+$0f
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$01
  ld [hl+], a
  ld [hl], e
  ld a, b
  sub $0b
  jp nz, $4007

  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  push hl
  call Call_000_2ba2
  add sp, $02
  ld c, e
  ld hl, sp+$02
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  sub $2e
  jr nz, jr_000_3fd2

  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0001
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp+$0f
  ld [hl+], a
  ld [hl], d

jr_000_3fd2:
  ld b, $00
  ld a, c
  add $fd
  ld c, a
  ld a, b
  adc $ff
  ld b, a
  ld hl, sp+$05
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  add hl, bc
  ld c, l
  ld b, h
  ld hl, sp+$0f
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$03
  ld [hl+], a
  ld [hl], e
  ld hl, sp+$04
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  or a
  jr z, @+$0e

  dec hl
  inc [hl]
  jr nz, jr_000_3ffc

  inc hl
  inc [hl]

jr_000_3ffc:
  and $df
  ld [bc], a
  inc bc
