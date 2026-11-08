;Used for on-cart RTC and EEPROM/FRAM
SECTION "I2C Bus Routines", ROM0[$055b]

; Wait for I2C busy flag in $BD0C (bit 7) to clear
I2C_WaitBusy::
  ld a, [sI2CInterfaceC]
  and $80
  jr nz, I2C_WaitBusy

  ret


; Send I2C START condition
I2C_Start::
  ld a, $20
  ld [sI2CInterfaceC], a
  ld [sI2CInterfaceD], a
  call I2C_WaitBusy
  ld a, $11
  ld [sI2CInterfaceC], a
  ret


; Reset I2C bus
I2C_ResetBus::
  ld a, $30
  ld [sI2CInterfaceC], a
  ld [sI2CInterfaceD], a
  call I2C_WaitBusy
  ret


; Send I2C ACK
I2C_Ack::
  ld a, $10
  ld [sI2CInterfaceC], a
  ret


; Send I2C STOP condition
I2C_Stop::
  ld a, $11
  ld [sI2CInterfaceC], a
  ret


; Write byte [sp+$02] to I2C bus, wait for busy to clear, return ACK bit in E
I2C_WriteByte::
  ld hl, sp+$02
  ld a, [hl]
  ld [sI2CInterfaceD], a

jr_000_0592:
  ld a, [sI2CInterfaceC]
  and $80
  jr nz, jr_000_0592

  ld a, [sI2CInterfaceC]
  and $01
  ld e, a
  ret


  ld hl, sp+$02
  ld a, [hl]
  ld [sI2CInterfaceD], a
  call I2C_WaitBusy
  ld a, [sI2CInterfaceD]
  ld e, a
  ret


  ld a, [sI2CInterfaceC]
  and $01
  ld e, a
  ret


; Read DE bytes from I2C into buffer [HL]
I2C_ReadBytes::
  pop hl
  pop hl
  pop de
  ld bc, sI2CInterfaceD
  add sp, -$06

jr_000_05bd:
  ld a, $ff
  ld [bc], a
  dec de

jr_000_05c1:
  ld a, [sI2CInterfaceC]
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


; Write E bytes from buffer [HL] to I2C bus
I2C_WriteBytes::
  pop hl
  pop hl
  pop de
  ld bc, sI2CInterfaceC
  add sp, -$06

jr_000_05db:
  ld a, [hl+]
  ld [sI2CInterfaceD], a

jr_000_05df:
  ld a, [bc]
  and $80
  jr nz, jr_000_05df

  dec e
  jr nz, jr_000_05db

  ret


Call_000_05e8:
  ld a, [sI2CInterfaceE]
  ld e, a
  ret


Call_000_05ed:
  ld a, [sStreamingConfig]
  and $df
  ld [sStreamingConfig], a
  ret


Call_000_05f6:
  ld a, [sStreamingConfig]
  or $20
  ld [sStreamingConfig], a
  ret


Call_000_05ff:
  ld hl, sp + $02
  ld a, [hl]
  ld [sI2CInterfaceF], a
  ret