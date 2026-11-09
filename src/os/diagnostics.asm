; OS page 9: runtime $a000-$bfff via $BD08.
; Linker addresses $6000-$7fff describe its location in the BIN only.
SECTION "OS page 9 image", ROMX[$6000], BANK[4]

RunDiagnostics::
; OS page 9 entry. Runtime $a000; selected by $BD08=9.
    ld hl, $bc00
    ld [hl], $00
    inc hl
    ld [hl], $02
    jp RunDiagnosticTests + OS_WINDOW_FROM_6000
RunDiagnosticTests::
; Diagnostic screen and test sequence; shares the page-9 API pointer.


    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0034
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $003c
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
    xor a
    push af
    inc sp
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
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
    ld de, DiagnosticTitleText + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
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
    ld de, DiagnosticSeparatorText + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    call DiagnosticDumpSaveRAM + OS_WINDOW_FROM_6000
    ld a, e
    or a
    ret nz

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
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
    ld de, $a1b9
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  call DiagnosticRAMTest + OS_WINDOW_FROM_6000
    ld d, e
    push de
    inc sp
    call ReportDiagnosticResult + OS_WINDOW_FROM_6000
    inc sp
    call DiagnosticRestoreSaveRAM + OS_WINDOW_FROM_6000
    ld d, e
    push de
    inc sp
    call ReportDiagnosticResult + OS_WINDOW_FROM_6000
    inc sp
  call DiagnosticSDTest + OS_WINDOW_FROM_6000
    ld d, e
    push de
    inc sp
    call ReportDiagnosticResult + OS_WINDOW_FROM_6000
    inc sp
  call DiagnosticRTCTest + OS_WINDOW_FROM_6000
    ld d, e
    push de
    inc sp
    call ReportDiagnosticResult + OS_WINDOW_FROM_6000
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $000c
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    ld c, e
    ld b, d
    inc bc
    inc bc
    ld a, [bc]
    or a
    jr z, jr_004_60fa

  call DiagnosticROMTest + OS_WINDOW_FROM_6000
    ld d, e
    push de
    inc sp
    call ReportDiagnosticResult + OS_WINDOW_FROM_6000
    inc sp
  call DiagnosticCopyTest + OS_WINDOW_FROM_6000

jr_004_60fa:
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
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
    ld de, $a1b9
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    call $a2fa
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
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
    ld de, DiagnosticSeparatorText + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
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
    ld de, DiagnosticPressKeyText + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0036
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001e
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    ld e, $00
    ret
DiagnosticTitleText::
  DB "EverDrive diagnostic", $00
DiagnosticSeparatorText::
  DB "--------------------", $00
    nop
DiagnosticPressKeyText::
  DB "Press any key", $00
ReportDiagnosticResult::
; Format the diagnostic return code.
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $002a
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
    ld hl, sp+$02
    ld a, [hl]
    or a
    jp z, $a20e

    ld de, DiagnosticErrorText + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $002e
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]

jr_004_61fe:
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$02
    ld a, [hl]
    push af
    inc sp
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    inc sp
    ret


    ld de, $a221
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ret
DiagnosticErrorText::
  DB "ERROR:", $00
    ld c, a

jr_004_6222:
    ld c, e
    nop
DiagnosticDumpSaveRAM::
; Copy cartridge save RAM to /GBCSYS/ramdump01.srm.
    add sp, -$80
    add sp, -$67
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
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
    ld de, DiagnosticDumpRAMText + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0036
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0048
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
    ld hl, sp+$00
    ld a, l
    ld d, h
    ld hl, $00e5
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0100
    push hl
    push de
    ld hl, $a2e4
    push hl
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $06
    ld a, e
    or a
    jr z, jr_004_629a

    ld e, a
    jp $a2cb


jr_004_629a:
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0006
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, $00e6
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0000
    push hl
    push de
    ld l, c
    ld h, b
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $04
    ld a, e
    or a
    jr z, jr_004_62c9

    ld e, a
    jr jr_004_62cb

jr_004_62c9:
    ld e, $00

jr_004_62cb:
    add sp, $7f
    add sp, $68
    ret
DiagnosticDumpRAMText::
  DB "Copy RAM to file...", $00
    cpl
    ld b, a
    ld b, d
    ld b, e
    ld d, e
    ld e, c
    ld d, e
    cpl
    ld [hl], d
    ld h, c
    ld l, l
    ld h, h
    ld [hl], l
    ld l, l
    ld [hl], b
  jr nc, @ + 51

    ld l, $73
    ld [hl], d
    ld l, l
    nop
    add sp, -$80
    add sp, -$67
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
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
    ld de, DiagnosticLoadRAMText + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0036
    add hl, bc

jr_004_6328:
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0048
    add hl, bc
    ld c, l
    ld b, h

jr_004_6343:
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld hl, sp+$00
    ld a, l
    ld d, h

jr_004_634e:
    ld hl, $00e5
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0000
    push hl
    push de
    ld hl, $a3ba
    push hl
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $06
    ld a, e
    or a
    jr z, jr_004_6370

    ld e, a
    jp $a3a1


jr_004_6370:
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0008
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld c, a
    inc de
    ld a, [de]
    ld b, a
    ld hl, $00e6
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0000
    push hl
    push de
    ld l, c
    ld h, b
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $04
    ld a, e
    or a
    jr z, jr_004_639f

    ld e, a
    jr jr_004_63a1

jr_004_639f:
    ld e, $00

jr_004_63a1:
    add sp, $7f
    add sp, $68
    ret
DiagnosticLoadRAMText::
  DB "Copy file to RAM...", $00
    cpl
    ld b, a
    ld b, d
    ld b, e
    ld d, e
    ld e, c
    ld d, e
    cpl
    ld [hl], d
    ld h, c
    ld l, l
    ld h, h
    ld [hl], l
    ld l, l
    ld [hl], b
    jr nc, jr_004_63fc

    ld l, $73
    ld [hl], d
    ld l, l
    nop
DiagnosticRestoreSaveRAM::
; Copy the RAM-dump file back to cartridge save RAM.
    add sp, -$09
  ld hl, sp + $01
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
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
  ld de, DiagnosticRAMTestText + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]

jr_004_63fc:
    ld hl, $0036
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a

jr_004_6406:
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    ld hl, $bc01
    dec hl

jr_004_6412:
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0018
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
  ld hl, sp + $04
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0014
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
  ld hl, sp + $04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
    push hl
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  ld hl, sp + $04
    ld a, [hl]
    ld de, $be00
    ld [de], a
    inc [hl]
    jr nz, jr_004_6458

    inc hl
    inc [hl]

jr_004_6458:
  ld hl, sp + $04
    ld a, [hl]
    sub $00
    inc hl
    ld a, [hl]
    sbc $01
    jp c, $a42e

  ld hl, sp + $04
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0014
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
  ld hl, sp + $04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
    push hl
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld de, $be00
    ld a, [de]
    ld d, a
    ld e, $00
  ld hl, sp + $04
    ld a, [hl]
    sub d
    jr nz, jr_004_649b

    inc hl
    ld a, [hl]
    sub e
    jr z, jr_004_64a1

jr_004_649b:
  ld hl, sp + $01
    ld a, [hl]
    set 0, a
    ld [hl], a

jr_004_64a1:
  ld hl, sp + $04
    inc [hl]
    jr nz, jr_004_64a8

    inc hl
    inc [hl]

jr_004_64a8:
  ld hl, sp + $04
    ld a, [hl]
    sub $00
    inc hl
    ld a, [hl]
    sbc $01
  jp c, $a46e

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0014
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
    ld hl, $0000
    push hl
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  ld hl, sp + $04
    ld [hl], $00
    inc hl
    ld [hl], $00
  ld hl, sp + $05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
    ld hl, $be00
    add hl, de
    ld c, l
    ld b, h
  ld hl, sp + $04
    ld a, [hl]
    ld [bc], a
  ld e, [hl]
  inc hl
  ld d, [hl]
    ld hl, $0100
    add hl, de
    ld c, l
    ld b, h
    ld hl, $be00
    add hl, bc
    ld c, l
    ld b, h
  ld hl, sp + $04
    ld a, [hl]
    xor $ff
    ld d, a
    inc hl
    ld e, [hl]
    ld a, d
    ld [bc], a
    dec hl
    inc [hl]
    jr nz, jr_004_6504

    inc hl
    inc [hl]

jr_004_6504:
  ld hl, sp + $04
    ld a, [hl]
    sub $00
    inc hl
    ld a, [hl]
    sbc $01
  jp c, $a4e0
  ld hl, sp + $04
    ld [hl], $00
    inc hl
    ld [hl], $00
  ld hl, sp + $05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
    ld hl, $be00
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld d, a
    ld e, $00
  ld hl, sp + $04
    ld a, [hl]
    sub d
    jr nz, jr_004_652e

    inc hl
    ld a, [hl]
    sub e
    jr z, jr_004_6534

jr_004_652e:
  ld hl, sp + $01
    ld a, [hl]
    set 1, a
    ld [hl], a

jr_004_6534:
  ld hl, sp + $05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
    ld hl, $0100
    add hl, de
    ld c, l
    ld b, h
    ld hl, $be00
    add hl, bc
    ld c, l
    ld b, h
    ld a, [bc]
    ld b, a
  ld hl, sp + $04
    ld a, [hl]
    xor $ff
    ld d, a
    inc hl
    ld e, [hl]
    ld c, $00
    ld a, d
    sub b
    jr nz, jr_004_6556

    ld a, e
    sub c
    jr z, jr_004_655c

jr_004_6556:
  ld hl, sp + $01
    ld a, [hl]
    set 1, a
    ld [hl], a

jr_004_655c:
  ld hl, sp + $04
    inc [hl]
    jr nz, jr_004_6563

    inc hl
    inc [hl]

jr_004_6563:
  ld hl, sp + $04
    ld a, [hl]
    sub $00
    inc hl
    ld a, [hl]
    sbc $01
  jp c, $a522
  ld hl, sp + $00
    ld [hl], $aa
    ld bc, $0000

jr_004_6576:
  ld hl, sp + $00
    ld a, [hl]
    xor $ff
    ld [hl], a
    ld de, $be00
    ld a, [hl]
    ld [de], a
    ld de, $be00
    ld a, [de]
  ld hl, sp + $08
  ld [hl], a
  ld hl, sp + $00
  ld a, [hl]
  ld hl, sp + $08
    sub [hl]
    jr z, jr_004_6591
  ld hl, sp + $01
    ld a, [hl]
    set 2, a
    ld [hl], a

jr_004_6591:
    inc bc
    ld a, b
    sub $08
    jr c, jr_004_6576
  ld hl, sp + $06
    ld [hl], $00
    inc hl
    ld [hl], $be
  ld hl, sp + $04
    ld [hl], $00
    inc hl
    ld [hl], $00
  ld hl, sp + $00
    inc [hl]
  ld hl, sp + $07
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  ld hl, sp + $00
    ld l, [hl]
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
  ld hl, sp + $00
    ld a, [hl]
    ld [bc], a
  ld hl, sp + $07
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  ld hl, sp + $00
    ld l, [hl]
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld d, a
  ld hl, sp + $00
    ld a, [hl]
    sub d
    jr z, jr_004_65d6
  ld hl, sp + $01
    ld a, [hl]
    set 3, a
    ld [hl], a

jr_004_65d6:
  ld hl, sp + $00
    ld a, [hl]
    inc a
    jr nz, jr_004_65e3
  ld hl, sp + $06
    inc [hl]
    jr nz, jr_004_65e3

    inc hl
    inc [hl]

jr_004_65e3:
  ld hl, sp + $04
    inc [hl]
    jr nz, jr_004_65ea

    inc hl
    inc [hl]

jr_004_65ea:
  ld hl, sp + $04
    ld a, [hl]
    sub $00
    inc hl
    ld a, [hl]
    sbc $08
  jp c, $a5bd
  ld hl, sp + $01
    ld e, [hl]
    add sp, $09
    ret
DiagnosticRAMTestText::
  DB "RAM test...", $00
DiagnosticRAMTest::
; Save-RAM test; displayed as RAM test.
    add sp, -$0b
  ld hl, sp + $07
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
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
  ld de, DiagnosticROMTestText + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0036
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0016
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
  ld hl, sp + $04
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0014
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b

jr_004_6675:
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
  ld hl, sp + $04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
    push hl
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld de, $be00
  ld hl, sp + $04
    ld a, [hl]
    ld [de], a
    inc de
    inc hl
    ld a, [hl]
    ld [de], a
    dec hl
    inc [hl]
    jr nz, jr_004_6695

    inc hl
    inc [hl]

jr_004_6695:
  ld hl, sp + $04
    ld a, [hl]
    sub $00
    inc hl
    ld a, [hl]
    sbc $3f
  jp c, $a67e
  ld hl, sp + $04
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0014
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
  ld hl, sp + $04
  ld a, [hl+]
  ld h, [hl]
  ld l, a
    push hl
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld de, $be00
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
  ld hl, sp + $04
    ld a, [hl]
    sub b
    jr nz, jr_004_66d9

    inc hl
    ld a, [hl]
    sub c
    jr z, jr_004_66df

jr_004_66d9:
  ld hl, sp + $07
    ld a, [hl]
    set 0, a
    ld [hl], a

jr_004_66df:
  ld hl, sp + $04
    inc [hl]
    jr nz, jr_004_66e6

    inc hl
    inc [hl]

jr_004_66e6:
  ld hl, sp + $04
    ld a, [hl]
    sub $00
    inc hl
    ld a, [hl]
    sbc $3f
  jp c, $a6c3

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0014
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
    ld hl, $0000
    push hl
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  ld hl, sp + $04
    ld [hl], $00
    inc hl
    ld [hl], $00
  ld hl, sp + $05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
    ld hl, $be00
    add hl, de
    ld c, l
    ld b, h
  ld hl, sp + $04
    ld a, [hl]
    ld [bc], a
  ld e, [hl]
  inc hl
  ld d, [hl]
    ld hl, $0100
    add hl, de
    ld c, l
    ld b, h
    ld hl, $be00
    add hl, bc
    ld c, l
    ld b, h
  ld hl, sp + $04
    ld a, [hl]
    xor $ff
    ld d, a
    inc hl
    ld e, [hl]
    ld a, d
    ld [bc], a
    dec hl
    inc [hl]
    jr nz, jr_004_6742

    inc hl
    inc [hl]

jr_004_6742:
  ld hl, sp + $04
    ld a, [hl]
    sub $00
    inc hl
    ld a, [hl]
    sbc $01
  jp c, $a736
  ld hl, sp + $04
    ld [hl], $00
    inc hl
    ld [hl], $00
  ld hl, sp + $05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
    ld hl, $be00
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld d, a
    ld e, $00
  ld hl, sp + $04
    ld a, [hl]
    sub d
    jr nz, jr_004_676c

    inc hl
    ld a, [hl]
    sub e
    jr z, jr_004_6772

jr_004_676c:
  ld hl, sp + $07
    ld a, [hl]
    set 1, a
    ld [hl], a

jr_004_6772:
  ld hl, sp + $05
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
    ld hl, $0100
    add hl, de
    ld c, l
    ld b, h
    ld hl, $be00
    add hl, bc
    ld c, l
    ld b, h
    ld a, [bc]
    ld b, a
  ld hl, sp + $04
    ld a, [hl]
    xor $ff
    ld d, a
    inc hl
    ld e, [hl]
    ld c, $00
    ld a, d
    sub b
    jr nz, jr_004_6794

    ld a, e
    sub c
    jr z, jr_004_679a

jr_004_6794:
  inc hl
  inc hl
    ld a, [hl]
    set 1, a
    ld [hl], a

jr_004_679a:
  ld hl, sp + $04
    inc [hl]
    jr nz, jr_004_67a1

    inc hl
    inc [hl]

jr_004_67a1:
  ld hl, sp + $04
    ld a, [hl]
    sub $00
    inc hl
    ld a, [hl]
    sbc $01
  jp c, $a778
  ld hl, sp + $06
    ld [hl], $aa
    ld bc, $0000

jr_004_67b4:
  ld hl, sp + $06
    ld a, [hl]
    xor $ff
    ld [hl], a
    ld de, $be00
    ld a, [hl]
    ld [de], a
    ld de, $be00
    ld a, [de]
    ld hl, sp+$0a
    ld [hl], a
  ld hl, sp + $06
    ld a, [hl]
    ld hl, sp+$0a
    sub [hl]
    jr z, jr_004_67d4
  ld hl, sp + $07
    ld a, [hl]
    set 2, a
    ld [hl], a

jr_004_67d4:
    inc bc
    ld a, b
    sub $08
    jr c, jr_004_67b4

    ld hl, sp+$08
    ld [hl], $00
    inc hl
    ld [hl], $be
  ld hl, sp + $04
    ld [hl], $00
    inc hl
    ld [hl], $00
  ld hl, sp + $06
    inc [hl]
  ld hl, sp + $09
  dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  ld hl, sp + $06
    ld l, [hl]
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
  ld hl, sp + $06
    ld a, [hl]
    ld [bc], a
  ld hl, sp + $09
  dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  ld hl, sp + $06
    ld l, [hl]
    ld h, $00
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    ld d, a
  ld hl, sp + $06
    ld a, [hl]
    sub d
    jr z, jr_004_6815
  ld hl, sp + $07
    ld a, [hl]
    set 3, a
    ld [hl], a

jr_004_6815:
  ld hl, sp + $06
    ld a, [hl]
    inc a
    jr nz, jr_004_6822

    ld hl, sp+$08
    inc [hl]
    jr nz, jr_004_6822

    inc hl
    inc [hl]

jr_004_6822:
  ld hl, sp + $04
    inc [hl]
    jr nz, jr_004_6829

    inc hl
    inc [hl]

jr_004_6829:
  ld hl, sp + $04
    ld a, [hl]
    sub $00
    inc hl
    ld a, [hl]
    sbc $08
  jp c, $a813
  ld hl, sp + $07
    ld e, [hl]
    add sp, $0b
    ret
DiagnosticROMTestText::
  DB "ROM test...", $00
DiagnosticROMTest::
; ROM-buffer test; displayed as ROM test.
    add sp, -$33
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
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
  ld de, DiagnosticRTCTestText + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0036
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001c
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
  ld hl, sp + $00
    ld a, l
    ld d, h
  ld hl, sp + $2b
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $000a
    push hl
    xor a
    push af
    inc sp
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $05
    ld hl, $bc01
    dec hl

jr_004_68b4:
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0076
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
  ld hl, sp + $2c
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  ld hl, sp + $2b
    ld a, [hl+]
    ld e, [hl]
  ld hl, sp + $31
    ld [hl+], a
    ld [hl], e
  ld hl, sp + $14
    ld [hl], $00
  ld hl, sp + $2c
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld c, a
    or a
  jp nz, $a962

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0040
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0074
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
    ld hl, sp+$32
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  ld hl, sp + $14
    inc [hl]
    ld a, $3f
    sub [hl]
  jp nc, $a90d

    ld e, $01
  jp $aef3
  ld b, $00


    ld hl, sp+$2b
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp + $31
  ld [hl+], a
  ld [hl], e
  ld hl, sp + $14
  ld [hl], $00
  ld hl, sp + $2c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  dec a
  jp nz, $a9c5
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0040
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
  ld l, b
  ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0074
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
  ld hl, sp + $32
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld l, b
  ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, sp + $14
  inc [hl]
  ld b, [hl]
  ld a, $3f
  sub [hl]
  jp nc, $a970
  ld e, $01
  jp $aef3
  ld a, b
  sub $3b
  jr nc, @ + 7
  ld e, $02
  jp $aef3
  ld hl, sp + $31
  ld [hl], $00
  ld hl, sp + $2b
  ld a, [hl+]
  ld e, [hl]
  inc hl
  ld [hl+], a
  ld [hl], e
  dec hl
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0005
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $29
  ld [hl+], a
  ld [hl], d
  ld hl, sp + $14
  ld [hl], $00
  ld hl, sp + $2a
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  ld hl, sp + $26
  ld [hl], a
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, sp + $26
  ld a, [hl]
  sub $02
  jp nz, $aa51
  ld hl, $0040
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
  ld l, b
  ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0074
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
  ld hl, sp + $2e
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld l, b
  ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, sp + $14
  inc [hl]
  push hl
  ld a, [hl]
  ld hl, sp + $33
  ld [hl], a
  pop hl
  ld a, $3f
  ld hl, sp + $14
  sub [hl]
  jp nc, $a9ee
  ld e, $01
  jp $aef3
  ld hl, sp + $31
    ld a, [hl]
    sub $3b
    jr nc, jr_004_6a2e

    ld e, $03
  jp $aef3


jr_004_6a2e:
    ld hl, $001c
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
  ld hl, sp + $2c
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $000a
    push hl
    xor a
    push af
    inc sp
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $05
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0076
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
  ld hl, sp + $2c
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0074
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
  ld hl, sp + $2c
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  ld hl, sp + $2c
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, sp+$25
    ld [hl], $00

jr_004_6a9e:
    ld a, [bc]
    inc bc
    or a
    jr z, jr_004_6aa8

    ld e, $04
  jp $aef3


jr_004_6aa8:
    ld hl, sp+$25
    inc [hl]
    ld a, [hl]
    sub $0a
    jr c, jr_004_6a9e

  ld hl, sp + $2b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $3b
  ld hl, sp + $2c
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0001
    add hl, de
    ld a, l
    ld d, h
  ld hl, sp + $29
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $3b
  ld hl, sp + $2c
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0002
    add hl, de
    ld a, l
    ld d, h
  ld hl, sp + $2d
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $17
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0076
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
  ld hl, sp + $2c
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  ld hl, sp + $2b
    ld a, [hl+]
    ld e, [hl]
  ld hl, sp + $31
    ld [hl+], a
    ld [hl], e
  ld hl, sp + $2c
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld b, a
    sub $3b
    jr nz, jr_004_6b3e

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0074
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
  ld hl, sp + $32
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  jp $ab3c


jr_004_6b3e:
    ld a, b
    or a
  jp nz, $ab9e
  ld hl, sp + $2a
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    or a
    jr nz, jr_004_6b6f

  ld hl, sp + $2e
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    or a
    jr nz, jr_004_6b6f

    dec hl
    dec hl
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0003
    add hl, de
    ld a, l
    ld d, h
  ld hl, sp + $31
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    dec a
    jr z, jr_004_6b74

jr_004_6b6f:
    ld e, $05
  jp $aef3


jr_004_6b74:
  ld hl, sp + $2b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $3b
  ld hl, sp + $29
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $3b
  ld hl, sp + $2d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $17
    ld hl, sp+$31
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $ff
  ld hl, sp + $2c
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0004
    add hl, de
    ld a, l
    ld d, h
  ld hl, sp + $27
    ld [hl+], a
    ld [hl], d
    dec hl
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $01
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0076
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
  ld hl, sp + $2c
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  ld hl, sp + $2b
    ld a, [hl+]
    ld e, [hl]
  ld hl, sp + $2f
    ld [hl+], a
    ld [hl], e
  ld hl, sp + $2c
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld b, a
    sub $3b
    jr nz, jr_004_6c01

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0074
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
  ld hl, sp + $30
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  jp $abff


jr_004_6c01:
    ld a, b
    or a
  jp nz, $ac5e
  ld hl, sp + $2a
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    or a
    jr nz, jr_004_6c2f

  ld hl, sp + $2e
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    or a
    jr nz, jr_004_6c2f

  ld hl, sp + $32
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    or a
    jr nz, jr_004_6c2f

  ld hl, sp + $28
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    sub $80
    jr z, jr_004_6c34

jr_004_6c2f:
    ld e, $06
  jp $aef3


jr_004_6c34:
  ld hl, sp + $2b
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld [hl], $01
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0076
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
  ld hl, sp + $2c
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  ld hl, sp + $2b
    ld a, [hl+]
    ld e, [hl]
  ld hl, sp + $2f
    ld [hl+], a
    ld [hl], e
  ld hl, sp + $2c
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    dec a
  jr nz, @ + 39

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0074
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
    ld hl, sp+$30
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  jp $ac94
  ld hl, sp + $2b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $01
  ld hl, sp + $29
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $02
  ld hl, sp + $2d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $03
  ld hl, sp + $31
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $04
  ld hl, sp + $27
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $00
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $007e
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
  ld hl, sp + $2c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld l, b
  ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $007c
  add hl, bc
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $2f
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  ld hl, sp + $0a
  ld c, l
  ld b, h
  ld e, c
  ld d, b
  push bc
  push de
  ld hl, sp + $33
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
  add sp, $02
  pop bc
  ld hl, sp + $2b
  ld d, [hl]
  inc hl
  ld e, [hl]
  ld hl, sp + $2f
  ld [hl], d
  inc hl
  ld [hl], e
  ld hl, sp + $25
  ld [hl], $00
    ld hl, sp+$30
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
  ld hl, sp + $27
  ld [hl], a
  ld hl, sp + $2f
  inc [hl]
  jr nz, @ + 4
  inc hl
  inc [hl]
  ld a, [bc]
  ld hl, sp + $26
  ld [hl], a
  inc bc
  inc hl
  ld a, [hl-]
  sub [hl]
  jr z, @ + 7
  ld e, $07
  jp $aef3
  ld hl, sp + $25
  inc [hl]
  ld a, [hl]
  sub $0a
  jr c, @ - 38
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $001c
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
  ld hl, sp + $2c
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  ld hl, $000a
  push hl
  xor a
  push af
  inc sp
  push de
  ld l, b
  ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
  add sp, $05
  ld hl, sp + $2b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $3c
  ld hl, sp + $29
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $3c
  ld hl, sp + $2d
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], $18
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0076
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
  ld hl, sp + $2c
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
  push de
  ld l, b
  ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
  add sp, $02
  ld hl, $bc01
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  ld hl, $0074
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
  ld hl, sp + $2c
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  ld l, b
  ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
  add sp, $02


jr_004_6df2:
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0078
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
  ld hl, sp + $15
    ld a, l
    ld d, h
  ld hl, sp + $2f
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  ld hl, sp + $30
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
  ld hl, sp + $27
    ld [hl], a
  ld hl, sp + $2f
    ld a, [hl+]
    ld e, [hl]
  ld hl, sp + $29
    ld [hl+], a
    ld [hl], e
  ld hl, sp + $14
    ld [hl], $00
  ld hl, sp + $30
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld b, a
  ld hl, sp + $27
    ld a, [hl]
    sub b
  jp nz, $ae7f

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0040
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0078
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
  ld hl, sp + $2a
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  ld hl, sp + $14
    inc [hl]
    ld a, $3f
    sub [hl]
  jp nc, $ae27

    ld e, $10
  jp $aef3


    ld hl, sp+$25
    ld [hl], b
    ld b, $00
  ld hl, sp + $2f
    ld a, [hl+]
    ld e, [hl]
  ld hl, sp + $27
    ld [hl+], a
    ld [hl], e
  ld hl, sp + $14
    ld [hl], $00
  ld hl, sp + $30
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld c, a
    ld hl, sp+$25
    ld a, [hl]
    sub c
  jp nz, $aee8

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0040
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0078
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
  ld hl, sp + $28
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
  ld hl, sp + $14
    inc [hl]
    ld b, [hl]
    ld a, $3f
    sub [hl]
  jp nc, $ae90

    ld e, $10
    jr jr_004_6efc

    ld a, b
    sub $3b
    jr nc, jr_004_6efa

    ld e, $11
    jr jr_004_6efc

jr_004_6efa:
    ld e, $00

jr_004_6efc:
    add sp, $33
    ret
DiagnosticRTCTestText::
  DB "RTC test...", $00
DiagnosticRTCTest::
; RTC test.
    add sp, -$80
    add sp, -$71
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
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
  ld de, DiagnosticSDTestText + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0036
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0048
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
  ld hl, $00ef
    add hl, sp
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
  ld hl, sp + $04
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    push bc
    ld hl, $0040
    push hl
    push de
  ld hl, DiagnosticSDTestPathText + OS_WINDOW_FROM_6000
    push hl
  ld hl, $00f7
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $06
    ld a, e
    pop bc
    ld e, a
    or a
  jp nz, $b147

    ld hl, $bc00
    ld a, [hl+]
    ld e, [hl]
  ld hl, $00ef
    add hl, sp
    ld [hl+], a
    ld [hl], e
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0016
    add hl, de
    ld a, l
    ld d, h
  ld hl, $00ef
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    dec hl
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    push bc
  ld hl, $00f1
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    pop bc
    ld hl, $bc00
    ld a, [hl+]
    ld e, [hl]
  ld hl, $00ef
    add hl, sp
    ld [hl+], a
    ld [hl], e
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $004c
    add hl, de
    ld a, l
    ld d, h
  ld hl, $00ef
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    dec hl
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    push bc
    ld a, $01
    push af
    inc sp
    ld hl, $0040
    push hl
    ld l, $00
    push hl
  ld hl, $00f6
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $05
    ld a, e
    pop bc
    or a
    jr z, jr_004_6ff9

    ld e, a
  jp $b147


jr_004_6ff9:
    ld hl, $bc00
    ld a, [hl+]
    ld e, [hl]
  ld hl, $00ef
    add hl, sp
    ld [hl+], a
    ld [hl], e
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0048
    add hl, de
    ld a, l
    ld d, h
  ld hl, $00ef
    add hl, sp
    ld [hl+], a
    ld [hl], d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    dec hl
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
  ld de, DiagnosticSDTestPathText + OS_WINDOW_FROM_6000
    ld hl, $0000
    push hl
    push bc
    push de
  ld hl, $00f5
    add hl, sp
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $06
    ld a, e
    or a
    jr z, jr_004_703b

    ld e, a
  jp $b147


jr_004_703b:
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0018
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
  ld hl, sp + $01
    ld [hl], $00
    inc hl
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $004a
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
  ld hl, sp + $01
    ld e, l
    ld d, h
    xor a
    push af
    inc sp
    ld hl, $0040
    push hl
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $05
    ld a, e
    or a
    jr z, jr_004_708a

    ld e, a
  jp $b147


jr_004_708a:
  ld hl, $00ef
    add hl, sp
    ld [hl], $00
    inc hl
    ld [hl], $00
  ld hl, sp + $00
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0014
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
  ld hl, sp + $00
    ld e, [hl]
    ld d, $00
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld bc, $be00
  ld hl, sp + $03
    ld [hl], $00
  ld hl, $00f0
    add hl, sp
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
  ld hl, $00ed
    add hl, sp
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0002
    add hl, de
    ld a, l
    ld d, h
  ld hl, $00e9
  add hl, sp
  ld [hl+], a
  ld [hl], d
  ld e, c
  ld d, b
  ld a, [de]
  inc hl
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  inc bc
  inc bc
  inc hl
  ld a, [hl-]
  dec hl
  sub [hl]
  jr nz, @ + 11
  ld hl, $00ee
  add hl, sp
  ld a, [hl-]
  dec hl
  sub [hl]
  jr z, @ + 7
  ld e, $01
  jp $b147
  ld hl, $00ea
  add hl, sp
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  inc hl
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  dec hl
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0002
  add hl, de
  ld a, l
  ld d, h
  ld hl, $00ef
  add hl, sp
    ld [hl+], a
    ld [hl], d
    ld e, c
    ld d, b
    ld a, [de]
  ld hl, $00ed
    add hl, sp
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    inc bc
    inc bc
    ld hl, $00eb
    add hl, sp
  ld a, [hl+]
  inc hl
    sub [hl]
  jr nz, jr_004_714d
    dec hl
  ld a, [hl+]
    inc hl
    sub [hl]
    jr z, jr_004_7151

jr_004_714d:
    ld e, $01
    jr jr_004_7165

jr_004_7151:
  ld hl, sp + $03
    inc [hl]
    ld a, [hl]
    sub $80
  jp c, $b0b6
  ld hl, sp + $00
    inc [hl]
    ld a, [hl]
    sub $40
  jp c, $b08e

    ld e, $00

jr_004_7165:
    add sp, $7f
    add sp, $72
    ret
DiagnosticSDTestText::
  DB "SDC test...", $00
DiagnosticSDTestPathText::
  DB "/GBCSYS/tstfile01.bin", $00
DiagnosticSDTest::
; SD-card test using /GBCSYS/tstfile01.bin.
    add sp, -$0e
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
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
  ld de, DiagnosticCopyTestText + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0036
    add hl, bc

jr_004_71b8:
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld b, a
    inc de
    ld a, [de]
    ld c, a
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0016
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
  ld hl, sp + $00
    ld [hl], $04

jr_004_71e3:
    inc hl
    ld [hl], $00
  ld hl, sp + $05
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0014
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
  ld hl, sp + $05
    ld e, [hl]
    ld d, $00
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001a
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
  pop de
  push de
    ld hl, $0200
    push hl
    ld h, $be
    push hl
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $06
  pop de
  push de
    ld hl, $0200
    add hl, de
  inc sp
  inc sp
  push hl
  ld hl, sp + $05
    inc [hl]
    ld a, [hl]
    sub $20
  jp c, $b1cc

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0018
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
  ld hl, sp + $00
    ld [hl], $02
    inc hl
    ld [hl], $00
  ld hl, sp + $05
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0014
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
  ld hl, sp + $05
    ld e, [hl]
    ld d, $00
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $001a
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
  pop de
  push de
    ld hl, $0200
    push hl
    ld h, $be
    push hl
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $06
  pop de
  push de
    ld hl, $0200
    add hl, de
  inc sp
  inc sp
  push hl
  ld hl, sp + $05
    inc [hl]
    ld a, [hl]
    sub $20
  jp c, $b248

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0016
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    ld hl, sp+$08
    ld [hl], $04
    inc hl
    ld [hl], $00
  ld hl, sp + $05
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0014
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
  ld hl, sp + $05
    ld e, [hl]
    ld d, $00
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld bc, $be00
  ld hl, sp + $04
    ld [hl], $00
    ld hl, sp+$09
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
  ld hl, sp + $06
    ld [hl+], a
    inc de
    ld a, [de]
  ld [hl+], a
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0002
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$0c
    ld [hl+], a
    ld [hl], d
    ld e, c
    ld d, b
    ld a, [de]
  ld hl, sp + $0a
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    inc bc
    inc bc
  ld hl, sp + $06
  ld a, [hl]
    ld hl, sp+$0a
    sub [hl]
    jr nz, jr_004_7356
  ld hl, sp + $07
  ld a, [hl]

    ld hl, sp+$0b
    sub [hl]
    jr z, jr_004_735b

jr_004_7356:
    ld e, $01
  jp $b444


jr_004_735b:
    ld hl, sp+$0d
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
  ld hl, sp + $0a
    ld [hl+], a
    inc de
    ld a, [de]
  ld [hl+], a
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0002
    add hl, de
    ld a, l
    ld d, h
    ld hl, sp+$08
    ld [hl+], a
    ld [hl], d
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$0c
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    inc bc
    inc bc
  ld hl, sp + $0a
  ld a, [hl+]
  inc hl
    sub [hl]
    jr nz, jr_004_7393
  dec hl
  ld a, [hl+]
  inc hl
    sub [hl]
    jr z, jr_004_7398

jr_004_7393:
    ld e, $01
  jp $b444


jr_004_7398:
  ld hl, sp + $04
    inc [hl]
    ld a, [hl]
    sub $80
  jp c, $b2ec
  inc hl
    inc [hl]
    ld a, [hl]
    sub $20
  jp c, $b2c4

    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0018
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
  ld hl, sp + $0a
    ld [hl], $02
    inc hl
    ld [hl], $00
  ld hl, sp + $05
    ld [hl], $00
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0014
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
  ld hl, sp + $05
    ld e, [hl]
    ld d, $00
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld bc, $be00
  ld hl, sp + $04
  ld [hl], $00
  ld hl, sp + $0b
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld a, [de]
  inc hl
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl-], a
  dec hl
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
  ld e, c
  ld d, b
  ld a, [de]
  ld hl, sp + $06
  ld [hl+], a
  inc de
  ld a, [de]
  ld [hl], a
  inc bc
  inc bc
  ld hl, sp + $0c
  ld a, [hl]
  ld hl, sp + $06
  sub [hl]
  jr nz, @ + 10
  ld hl, sp + $0d
  ld a, [hl]
  ld hl, sp + $07
  sub [hl]
  jr z, @ + 7
  ld e, $02
  jp $b444
    ld hl, sp+$03
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    ld hl, sp+$0c
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
  ld hl, sp + $03
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0002
    add hl, de
    ld a, l
    ld d, h
  ld hl, sp + $0a
    ld [hl+], a
    ld [hl], d
    ld e, c
    ld d, b
    ld a, [de]
  ld hl, sp + $06
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl], a
    inc bc
    inc bc
  ld hl, sp + $0c
  ld a, [hl]
  ld hl, sp + $06
    sub [hl]
  jr nz, jr_004_7465

    ld hl, sp+$0d
  ld a, [hl]
  ld hl, sp + $07
    sub [hl]
    jr z, jr_004_7469

jr_004_7465:
    ld e, $02
    jr jr_004_747d

jr_004_7469:
  ld hl, sp + $04
    inc [hl]
    ld a, [hl]
    sub $80
  jp c, $b3ba
  inc hl
    inc [hl]
    ld a, [hl]
    sub $20
  jp c, $b392

    ld e, $00

jr_004_747d:
    add sp, $0e
    ret
DiagnosticCopyTestText::
  DB "CPY test...", $00
DiagnosticCopyTest::
; Copy test displayed as CPY test.
    add sp, -$14
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0078
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
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
  ld de, DiagnosticDateText + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $002e
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$12
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    dec hl
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0006
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    push af
    inc sp

jr_004_74f9:
    ld hl, sp+$13
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $002a
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
  ld de, $b657
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $002e
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$12
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    dec hl
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0005
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    push af
    inc sp
    ld hl, sp+$13
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $002a
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
  ld de, $b657
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $002e
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$12
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    dec hl
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld hl, $0004
    add hl, de
    ld c, l
    ld b, h
    ld a, [bc]
    push af
    inc sp
    ld hl, sp+$13
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0022
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
  ld de, DiagnosticTimeText + OS_WINDOW_FROM_6000
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $002e
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$12
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    dec hl
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    inc bc
    ld a, [bc]
    push af
    inc sp
    ld hl, sp+$13
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $002a
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
  ld de, $b660
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $002e
    add hl, bc
    ld c, l
    ld b, h
    ld e, c
    ld d, b
    ld a, [de]
    ld hl, sp+$12
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl-], a
    dec hl
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    inc bc
    ld a, [bc]
    push af
    inc sp
    ld hl, sp+$13
    ld a, [hl+]
    ld h, [hl]
    ld l, a
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $002a
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
  ld de, $b660
    push de
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $02
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $002e
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
    ld hl, sp+$11
    dec hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld a, [de]
    push af
    inc sp
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    inc sp
    ld hl, $bc01
    dec hl
    ld c, [hl]
    inc hl
    ld b, [hl]
    ld hl, $0036
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
    ld l, b
    ld h, c
  call DiagnosticCallHL + OS_WINDOW_FROM_6000
    add sp, $14
    ret
DiagnosticDateText::
  DB "date: 20", $00

jr_004_7690:
    cpl
    nop
DiagnosticTimeText::
  DB "time: ", $00

jr_004_7699:
    ld a, [hl-]
    nop
DiagnosticCallHL::
; Indirect-call trampoline: CALL here pushes a return address; JP HL enters the target.
    jp hl


  DS 36, $ff ; unused file padding

jr_004_76c0:
  DS 2368, $ff ; unused file padding
