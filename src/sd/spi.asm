SECTION "SD Card SPI Low-Level Routines", ROM0[$02c8]
; Send byte in [sp+$02] over SPI, wait for completion, and return received byte in E
SD_SPI_TransferByte::
  ld hl, sp+$02
  ld a, [hl]
  ld [sSPIData], a; Write to SPI data register

.wait:
  ld a, [sSPIControl]
  and $80              ; Bit 7 = SPI busy flag
  jr nz, .wait

  ld a, [sSPIData]; Read received byte from SPI data register
  ld e, a
  ret


; Write byte in [sp+$02] to SPI, then immediately read back into E (no busy polling)
SD_SPI_WriteReadByte::
  ld hl, sp+$02
  ld a, [hl]
  ld [sSPIData], a
  ld a, [sSPIData]
  ld e, a
  ret


; Write byte in [sp+$02] to SPI (fire-and-forget, no read)
SD_SPI_WriteByte::
  ld hl, sp+$02
  ld a, [hl]
  ld [sSPIData], a
  ret


; Assert SD Chip Select (CS active low: clear bit 0 of $BD01)
SD_AssertCS::
  ld a, [sSPIControl]
  and $fe              ; Clear bit 0
  ld [sSPIControl], a
  ret


; Deassert SD Chip Select (CS inactive high: set bit 0 of $BD01)
SD_DeassertCS::
  ld a, [sSPIControl]
  or $01               ; Set bit 0
  ld [sSPIControl], a
  ret


; Set slow SPI clock (~400 kHz) for SD initialization (set bit 1 of $BD01)
SD_SetSPISlow::
  ld a, [sSPIControl]
  or $02               ; Set bit 1
  ld [sSPIControl], a
  ret


; Set fast SPI clock (full speed) for data transfers (clear bit 1 of $BD01 & bit 0 of $BD06)
SD_SetSPIFast::
  ld a, [sSPIControl]
  and $fd              ; Clear bit 1
  ld [sSPIControl], a
  ld a, [sStreamingConfig]
  and $fe              ; Clear bit 0
  ld [sStreamingConfig], a
  ret


; Disable auto-read SPI streaming mode (clear bit 2 of $BD01 & bit 0 of $BD06)
SD_DisableAutoRead::
  ld a, [sSPIControl]
  and $fb              ; Clear bit 2
  ld [sSPIControl], a
  ld a, [sStreamingConfig]
  and $fe              ; Clear bit 0
  ld [sStreamingConfig], a
  ret


; Enable auto-read SPI streaming mode (set bit 2 of $BD01 & bit 0 of $BD06)
; In this mode, reading $BD00 automatically clocks the next byte over SPI.
SD_EnableAutoRead::
  ld a, [sSPIControl]
  or $04               ; Set bit 2
  ld [sSPIControl], a
  ld a, [sStreamingConfig]
  or $01               ; Set bit 0
  ld [sStreamingConfig], a
  ret


; Increment 512-byte sector buffer window pointer ($BD02)
Cart_IncSectorPointer::
  ld a, [sBufferSectorLow]
  inc a
  ld [sBufferSectorLow], a
  ret


; Set 512-byte sector buffer window pointer ($BD02/$BD03) from [HL]
Cart_SetSectorPointer::
  ld a, [hl+]
  ld [sBufferSectorLow], a
  ld a, [hl]
  ld [sBufferSectorHigh], a
  ret


; Read C sectors into the cartridge 512-byte buffer window at $BE00
; Stack arguments: sector pointer, sector count C
SD_ReadSectorsToBufferWindow::
  pop de
  pop hl
  pop bc
  push bc
  push hl
  push de
  call Cart_SetSectorPointer
  call SD_EnableAutoRead
  ld de, sSPIData

jr_000_035a:
  ld a, [de]
  call SD_WaitForDataToken ; Wait for $FE data start token
  ld hl, sBufferWindow
  ld b, $40                ; 64 iterations * 8 bytes = 512 bytes

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

  ld a, [de]               ; Read CRC byte
  call Cart_IncSectorPointer
  dec c
  jr nz, jr_000_035a

  call SD_DisableAutoRead
  ld e, $00
  ret


; Read C sectors (512 bytes each) directly into RAM buffer pointed by HL
SD_ReadSectorsToRAM::
  pop de
  pop hl
  pop bc
  push bc
  push hl
  push de
  call SD_EnableAutoRead
  ld de, sSPIData
  ld b, $00

jr_000_0389:
  ld a, [de]
  call SD_WaitForDataToken ; Wait for $FE data start token

jr_000_038d:
  ld a, [de]               ; Auto-clock read next byte
  ld [hl+], a
  ld a, [de]
  ld [hl+], a
  dec b                    ; 256 * 2 = 512 bytes
  jr nz, jr_000_038d

  ld a, [de]               ; Read CRC byte
  dec c
  jr nz, jr_000_0389

  call SD_DisableAutoRead
  ld e, $00
  ret


; Write C sectors from cartridge buffer window ($BE00) to SD
SD_WriteSectorsFromBufferWindow::
  pop de
  pop hl
  pop bc
  push bc
  push hl
  push de
  call Cart_SetSectorPointer
  ld hl, sBufferWindow

jr_000_03aa:
  call SD_WriteSingleBlock
  ld a, e
  cp $00
  jp nz, Jump_000_0439

  ld hl, sBufferWindow
  call Cart_IncSectorPointer
  dec c
  jr nz, jr_000_03aa

  jr SD_SendStopTransferToken


; Write C sectors from RAM buffer [HL] to SD
SD_WriteSectorsFromRAM::
  pop de
  pop hl
  pop bc
  push bc
  push hl
  push de

jr_000_03c4:
  call SD_WriteSingleBlock
  ld a, e
  cp $00
  jp nz, Jump_000_0439

  dec c
  jr nz, jr_000_03c4

  jr SD_SendStopTransferToken


; Write a single 512-byte block from [HL] to SD card via SPI
; Returns E = 0 on success, or error code in E ($D5, $D6, $D7)
SD_WriteSingleBlock::
  ld b, $00
  ld de, sSPIData
  ld a, $ff
  ld [de], a
  ld [de], a
  ld a, $fc                ; Start Block Token for Multiple Block Write (CMD25)
  ld [de], a

jr_000_03de:
  ld a, [hl+]
  ld [de], a
  ld a, [hl+]
  ld [de], a
  dec b                    ; 256 * 2 = 512 bytes
  jr nz, jr_000_03de

  ld a, $ff
  ld [de], a               ; Dummy CRC byte 1
  ld [de], a               ; Dummy CRC byte 2
  ld [de], a
  ld a, [de]               ; Data response token
  and $1f
  cp $05                   ; 0x05 = Data accepted
  jr nz, SD_DataTokenError

  ld de, $0000

jr_000_03f4:
  ld a, $ff
  ld [sSPIData], a
  ld a, [sSPIData]
  cp $ff                   ; Busy line held low; 0xFF = ready
  jr z, jr_000_0408

  dec d
  jr nz, jr_000_03f4

  dec e
  jr nz, jr_000_03f4

  jr SD_WaitTimeoutError

jr_000_0408:
  ld e, $00
  ret

; Send Stop Tran token ($FD) after multi-block write
SD_SendStopTransferToken:
  ld a, $fd                ; Stop Tran token
  ld [sSPIData], a
  ld a, $ff
  ld [sSPIData], a
  ld de, $0000

jr_000_0418:
  ld a, $ff
  ld [sSPIData], a
  ld a, [sSPIData]
  and $01
  cp $00
  jr nz, jr_000_042e

  inc d
  jr nz, jr_000_0418

  inc e
  jr nz, jr_000_0418

  jr SD_StopTransferTimeoutError

jr_000_042e:
  ld e, $00
  ret

SD_DataTokenError:
  ld e, $d5                ; Error $D5: Write data token error
  ret

SD_WaitTimeoutError:
  ld e, $d6                ; Error $D6: Write wait timeout
  ret

SD_StopTransferTimeoutError:
  ld e, $d7                ; Error $D7: Stop tran timeout
Jump_000_0439:
  ret


; Wait for Start Block Token ($FE) from SD card
; Returns with A = $FE on success; times out with E = $D3 on failure
SD_WaitForDataToken::
  push bc
  ld bc, $0000

jr_000_043e:
  ld a, [sSPIData]
  cp $fe                   ; 0xFE = Data start block token
  jr z, jr_000_0451

  dec c
  jr nz, jr_000_043e

  dec b
  jr nz, jr_000_043e

  call SD_DisableAutoRead
  pop bc
  ld e, $d3                ; Error $D3: Read data token timeout

jr_000_0451:
  pop bc
  ret


SECTION "SD Utils", ROM0[$239d]

; Calculate 7-bit CRC for SD command packet
SD_CalculateCRC7::
  add sp, -$05
  ld hl, sp + $01
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp+$07
  ld a, [hl+]
  ld e, [hl]
  ld hl, sp+$03
  ld [hl+], a
  ld [hl], e
  ld hl, sp + $00
  ld [hl], $05

Jump_000_238a:
  ld hl, sp + $00
  ld b, [hl]
  dec [hl]
  ld a, b
  or a
  jp z, Jump_000_23c5
  ld hl, sp + $04
  dec hl
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
  ld hl, sp + $01
  ld a, [hl]
  xor d
  ld [hl+], a
  ld a, [hl]
  xor e
  ld [hl], a
  ld bc, $0008

jr_000_23ac:
  ld hl, sp + $01
  sla [hl]
  inc hl
  rl [hl]
  bit 0, [hl]
  jr z, jr_000_23bd

  ld hl, sp + $01
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
  ld hl, sp + $01
  ld e, [hl]
  res 0, e
  ld d, $00
  add sp, $05
  ret


; Send 6-byte SD SPI command packet with calculated CRC7
; Arguments: command (1 byte), 32-bit argument (4 bytes)
; Returns: R1 response byte in E
SD_SendCmd_CRC::
  add sp, -$19
  ld hl, sp+$01
  ld a, l
  ld d, h
  ld hl, sp + $0f
  ld [hl+], a
  ld [hl], d
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, sp+$1b
  ld a, [hl]
  ld [de], a
  ld hl, sp + $10
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  push af
  ld hl, sp + $1e
  ld a, [hl]
  ld hl, sp + $13
  ld [hl], a
  ld hl, sp + $1f
  ld a, [hl]
  ld hl, sp + $14
  ld [hl], a
  ld hl, sp + $20
  ld a, [hl]
  ld hl, sp + $15
  ld [hl], a
  ld hl, sp + $21
  ld a, [hl]
  ld hl, sp + $16
  ld [hl], a
  pop af
  ld a, $18
  ld hl, sp + $14
  srl [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec a
  jr nz, @ - 14
  ld a, [hl]
  ld hl, sp + $07
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp + $07
  ld a, [hl]
  ld [bc], a
  ld hl, sp + $10
  dec hl
  ld c, [hl]
  inc hl
  ld b, [hl]
  inc bc
  inc bc
  push af
  ld hl, sp + $1e
  ld a, [hl]
  ld hl, sp + $09
  ld [hl], a
  ld hl, sp + $1f
  ld a, [hl]
  ld hl, sp + $0a
  ld [hl], a
  ld hl, sp + $20
  ld a, [hl]
  ld hl, sp + $0b
  ld [hl], a
  ld hl, sp + $21
  ld a, [hl]
  ld hl, sp + $0c
  ld [hl], a
  pop af
  ld a, $10
  ld hl, sp + $0a
  srl [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec hl
  rr [hl]
  dec a
  jr nz, @ - 14
  ld a, [hl]
  ld hl, sp + $15
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp + $15
  ld a, [hl]
  ld [bc], a
  ld hl, sp + $10
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
  ld a, $08

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
  ld hl, sp + $0b
  ld [hl+], a
  ld [hl], $00
  inc hl
  ld [hl], $00
  inc hl
  ld [hl], $00
  ld hl, sp + $0b
  ld a, [hl]
  ld [bc], a
  ld hl, sp + $10
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  ld hl, $0004
  add hl, de
  ld a, l
  ld d, h
  ld hl, sp + $0b
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
  ld hl, sp + $0b
  ld a, [hl+]
  ld h, [hl]
  ld l, a
  ld [hl], b
  ld hl, sp + $10
  dec hl
  ld e, [hl]
  inc hl
  ld d, [hl]
  push de
  call SD_CalculateCRC7
  add sp, $02
  ld a, e
  set 0, a
  ld hl, sp + $06
  ld [hl], a
  call SD_AssertCS
  ld a, $ff
  push af
  inc sp
  call SD_SPI_TransferByte
  inc sp
  ld hl, sp+$1b
  ld a, [hl]
  push af
  inc sp
  call SD_SPI_TransferByte
  inc sp
  ld hl, sp+$11
  ld d, [hl]
  push de
  inc sp
  call SD_SPI_TransferByte
  inc sp
  ld hl, sp + $07
  ld d, [hl]
  push de
  inc sp
  call SD_SPI_TransferByte
  inc sp
  ld hl, sp + $15
  ld d, [hl]
  push de
  inc sp
  call SD_SPI_TransferByte
  inc sp
  ld hl, sp+$1c
  ld d, [hl]
  push de
  inc sp
  call SD_SPI_TransferByte
  inc sp
  ld hl, sp + $06
  ld a, [hl]
  push af
  inc sp
  call SD_SPI_TransferByte
  inc sp
  ld a, $ff
  push af
  inc sp
  call SD_SPI_TransferByte
  inc sp
  ld a, $ff
  push af
  inc sp
  call SD_SPI_TransferByte
  inc sp
  ld hl, sp + $00
  ld [hl], e
  ld bc, $0000

jr_000_253c:
  ld hl, sp + $00
  ld a, [hl]
  inc a
  jr nz, jr_000_2560

  push bc
  ld a, $ff
  push af
  inc sp
  call SD_SPI_TransferByte
  inc sp
  pop bc
  ld hl, sp + $00
  ld [hl], e
  ld hl, sp + $0b
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
  call SD_DeassertCS
  ld hl, sp + $00
  ld e, [hl]
  add sp, $19
  ret


; Send SD command packet without CRC7 (used after init when CRC is disabled)
; Arguments: command (1 byte), 32-bit argument (4 bytes)
; Returns: R1 response byte in E
SD_SendCmd_Fast::
Call_000_2569::
  add sp, -$03
  call SD_AssertCS
  ld a, $ff
  push af
  inc sp
  call SD_SPI_WriteByte
  inc sp
  ld hl, sp+$05
  ld a, [hl]
  push af
  inc sp
  call SD_SPI_WriteByte
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
  call SD_SPI_WriteByte
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
  call SD_SPI_WriteByte
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
  call SD_SPI_WriteByte
  inc sp
  ld hl, sp+$06
  ld d, [hl]
  push de
  inc sp
  call SD_SPI_WriteByte
  inc sp
  ld a, $ff
  push af
  inc sp
  call SD_SPI_WriteByte
  inc sp
  ld a, $ff
  push af
  inc sp
  call SD_SPI_WriteByte
  inc sp
  ld a, $ff
  push af
  inc sp
  call SD_SPI_WriteReadByte
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
  call SD_SPI_WriteReadByte
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
  call SD_DeassertCS
  ld hl, sp+$00
  ld e, [hl]
  add sp, $03
  ret


; ==============================================================================
; SD Card Initialization & High-Level Sector Transfer Routines
; ==============================================================================

; Initialize SD card:
; 1. Set slow SPI clock (~400 kHz) and deassert CS
; 2. Send 128 bytes of $FF (>74 clock pulses for card power-up)
; 3. Send CMD0 (software reset), expect R1 = 0x01
; 4. Send CMD8 (check voltage range & interface condition)
; 5. Loop CMD55 + ACMD41 with HCS bit until card is ready (response 0x00)
; 6. Send CMD58 (read OCR) to check CCS bit for SDHC/SDXC support
; 7. Switch to fast SPI clock
; Returns: E = 0 on success, or error code in E ($C0-$CA)
SD_Init::
  add sp, -$05
  ld hl, $c2be ; wSDCardInitialized
  ld [hl], $00
  ld hl, $c2b9 ; wSDCardFlags
  ld [hl], $00
  xor a
  ld hl, $c2ba ; wSDCurrentSector
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  call SD_SetSPISlow   ; Slow SPI clock for init
  call SD_DeassertCS   ; CS high
  ld bc, $0000

jr_000_2649:
  push bc
  ld a, $ff
  push af
  inc sp
  call SD_SPI_TransferByte
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
  call SD_SendCmd_CRC
  add sp, $05
  ld hl, sp+$02
  ld [hl], e
  ld bc, $0000

jr_000_2680:
  push bc
  ld a, $ff
  push af
  inc sp
  call SD_SPI_TransferByte
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

  ld hl, $c2b9
  ld a, [hl]
  set 1, a
  ld [hl], a

jr_000_26ac:
  ld hl, $c2b9
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
  ld hl, rIE
  push hl
  ld a, $77
  push af
  inc sp
  call SD_SendCmd_CRC
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
  call SD_SendCmd_CRC
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
  call SD_SendCmd_CRC
  add sp, $05
  inc e
  jr nz, jr_000_2734

  ld e, $c5
  jp Jump_000_2876


jr_000_2734:
  call SD_AssertCS
  ld a, $ff
  push af
  inc sp
  call SD_SPI_TransferByte
  inc sp
  ld hl, sp+$03
  ld [hl], e
  ld bc, $0000

jr_000_2745:
  push bc
  ld a, $ff
  push af
  inc sp
  call SD_SPI_TransferByte
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

  ld hl, $c2b9
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
  call SD_SendCmd_CRC
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
  call SD_SendCmd_CRC
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
  call SD_SendCmd_CRC
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
  call SD_SendCmd_CRC
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
  call SD_SendCmd_CRC
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
  call SD_SetSPIFast
  ld hl, $c2ba
  ld [hl], $01
  xor a
  inc hl
  ld [hl+], a
  ld [hl+], a
  ld [hl], a
  ld hl, $c2be
  ld [hl], $01
  ld bc, $0000

jr_000_284a:
  push bc
  ld a, $ff
  push af
  inc sp
  call SD_SPI_WriteByte
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
  ld hl, $c2b9
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
  call SD_AssertCS
  ld e, $00
  ret


SD_ReadBlocksToRAM:
  add sp, -$04
  ld b, $00
  ld hl, sp+$06
  ld a, [hl]
  ld hl, $c2ba
  sub [hl]
  jr nz, jr_000_28df

  ld hl, sp+$07
  ld a, [hl]
  ld hl, $c2bb
  sub [hl]
  jr nz, jr_000_28df

  ld hl, sp+$08
  ld a, [hl]
  ld hl, $c2bc
  sub [hl]
  jr nz, jr_000_28df

  ld hl, sp+$09
  ld a, [hl]
  ld hl, $c2bd
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
  ld hl, $c2ba
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
  ld hl, $c2bb
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
  ld hl, $c2bb
  ld [hl-], a
  ld [hl], e
  ld hl, $c2bd
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
  ld hl, $c2bd
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
  call SD_ReadSectorsToRAM
  add sp, $03
  ld a, e
  or a
  jr z, jr_000_296a

  push de
  call SD_DeassertCS
  pop de

Jump_000_296a:
jr_000_296a:
  add sp, $04
  ret


SD_ReadBlocksToCartridge:
  add sp, -$04
  ld b, $00
  ld hl, sp+$06
  ld a, [hl]
  ld hl, $c2ba
  sub [hl]
  jr nz, jr_000_2996

  ld hl, sp+$07
  ld a, [hl]
  ld hl, $c2bb
  sub [hl]
  jr nz, jr_000_2996

  ld hl, sp+$08
  ld a, [hl]
  ld hl, $c2bc
  sub [hl]
  jr nz, jr_000_2996

  ld hl, sp+$09
  ld a, [hl]
  ld hl, $c2bd
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
  ld hl, $c2ba
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
  ld hl, $c2bb
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
  ld hl, $c2bb
  ld [hl-], a
  ld [hl], e
  ld hl, $c2bd
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
  ld hl, $c2bd
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
  call SD_ReadSectorsToBufferWindow
  add sp, $03
  ld a, e
  or a
  jr z, jr_000_2a21

  push de
  call SD_DeassertCS
  pop de

Jump_000_2a21:
jr_000_2a21:
  add sp, $04
  ret


Call_000_2a24:
  ld hl, $c2ba
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
  call SD_DeassertCS
  ld hl, $0000
  push hl
  ld hl, $0000
  push hl
  ld a, $4c
  push af
  inc sp
  call Call_000_2569
  add sp, $05
  ld hl, $c2ba
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  inc hl
  ld [hl], $ff
  ret


Call_000_2a5f:
  ld hl, $c2b9
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
  call SD_AssertCS
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
  call SD_WriteSectorsFromRAM
  add sp, $03
  push de
  call SD_DeassertCS
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
  call SD_WriteSectorsFromBufferWindow
  add sp, $03
  push de
  call SD_DeassertCS
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

  ld hl, $c2be
  ld a, [hl]
  or a
  jr nz, jr_000_2b18

  ld e, a
  jp Jump_000_2b58


jr_000_2b18:
  call Call_000_2a24
  ld hl, $c2be
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
  call SD_SendCmd_CRC
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

