INCLUDE "keyboard/usb_hid_keys.asm";USB HID key codes
INCLUDE "keyboard/ps2_keys.asm";PS/2 keys codes

;kb_type
KB_TYPE_NONE EQU 0
KB_TYPE_PS2  EQU 1
KB_TYPE_IGKB EQU 2

;kb_mode
KB_MODE_NONE    EQU 0
KB_MODE_BUTTONS EQU 1
KB_MODE_TYPING  EQU 2

;kb_error
PS2_ERROR_TIMEOUT      EQU %100000
PS2_ERROR_UNKNOWN_CODE EQU %010000
PS2_ERROR_KEYBOARD     EQU %001000
PS2_ERROR_START_BIT    EQU %000100
PS2_ERROR_PARITY_BIT   EQU %000010
PS2_ERROR_FINISH_BIT   EQU %000001

KB_FLAG_RELEASE  EQU %00000001 ;$PS2 code $F0
KB_FLAG_EXTENDED EQU %00000010 ;$PS2 code $E0

;kb_modifiers
KB_MOD_SCROLL_LOCK EQU PS2_LED_SCROLL_LOCK;001
KB_MOD_NUM_LOCK    EQU PS2_LED_NUM_LOCK   ;010
KB_MOD_CAPS_LOCK   EQU PS2_LED_CAPS_LOCK  ;100
KB_MOD_SUPER       EQU %00001000
KB_MOD_ALT         EQU %00010000
KB_MOD_CTRL        EQU %00100000
KB_MOD_SHIFT       EQU %01000000
KB_MOD_FUNCTION    EQU %10000000

SECTION "Keyboard Vars", WRAM0[$cf00]
;PS/2 scan codes are 11 bits (S0123456 7PFxxxxx):
; - (S)tart (always 0)
; - Data Bits (0-7) in reverse order
; - Odd (P)arity Bit - if the sum of bits 1-A (data bits + parity) is even, error
; - (F)inish Bit (always 1)
;insideGadgets' USB scan codes are 8-bit
; - most data sent directly as ASCII, including shifted keys
; - some data comes through as USB HID codes
; - the rest are incorrectly converted ASCII codes that can sometimes be converted back to HID codes

kb_vars_start:
kb_scan_code:: DB
kb_scan_code_buffer:: DS 8;holds last 8 scan codes
kb_error_buffer:: DS 8;holds last 8 error codes
kb_buffer_write:: DB
kb_buffer_read:: DB
kb_interrupt_count:: DB
kb_error:: DB;xxTUKSPF - (T)imeout, (U)nknown Scan Code, (K)eyboard $00 or $FF, (S)tart Bit, (P)arity Bit, (F)inish Bit
kb_error_count:: DB
kb_modifiers:: DB ;FSCAUPNL - (F)unction, (S)hift, (C)trl, (A)lt, S(U)per, Ca(P)s Lock, (N)um Lock, Scro(L)l Lock
kb_flags:: DB;xxxxxxER - (E)xtended key flag, (R)elease key flag
kb_type:: DB
kb_mode:: DB
kb_detected:: DB
kb_vars_end:

SECTION "Keyboard Code Bank X", ROMX, BANK[1]
INCLUDE "keyboard/ps2_interrupt.asm"
INCLUDE "keyboard/kb_jump_table.asm"
INCLUDE "keyboard/kb_handlers.asm"
INCLUDE "keyboard/ps2_ascii_keymaps.asm"
INCLUDE "keyboard/ps2_handlers.asm"
INCLUDE "keyboard/igkb_handlers.asm"

SetupKeyboard::
  xor a
  ld c, kb_vars_end - kb_vars_start
  ld hl, kb_vars_start
.loop
    ld [hli], a
    dec c
    jr nz, .loop
  ld a, KB_MODE_BUTTONS
  ld [kb_mode], a
  jp SetInterrupts

USBDelay:
  ld a, 30
.loop
    push af
    .wait
      ld a, [rLY]
      cp a, 144
      jr nz, .wait
    pop af
    dec a
    jr nz, .loop
  ret

SerialInterrupt::
  push af
  push bc
  push de
  push hl
  call PS2KeyboardInterrupt
  pop hl
  pop de
  pop bc
  pop af
  reti

DetectKeyboard::
  ld a, [kb_detected]
  and a
  ret nz
  ld a, 1
  ld [kb_detected], a
  
  ei
  ld a, [rIE]
  or a, IEF_SERIAL
  ld [rIE], a

  ld a, KB_TYPE_PS2
  ld [kb_type], a;assume PS2 keyboard connected
  xor a
  ld [rSB], a
  ld a, SCF_TRANSFER_START | SCF_CLOCK_INTERNAL
  ld [rSC], a ;ask for byte using gb clock
  call USBDelay
  ld a, [kb_error]
  cp a, PS2_ERROR_TIMEOUT | PS2_ERROR_PARITY_BIT | PS2_ERROR_FINISH_BIT
  jr nz, .usePS2Clock;if magic error code not received, PS2 connected
  ld a, KB_TYPE_IGKB
  ld [kb_type], a
  ret
.usePS2Clock
  ld a, SCF_TRANSFER_START | SCF_CLOCK_EXTERNAL
  ld [rSC], a;ask for bits using keyboard clock 
  ret

ProcessKeyCodes::
  ld a, [kb_mode]
  and a
  ret z;exit early if KB_MODE_NONE
  ld a, [kb_type]
.processPS2
  cp a, KB_TYPE_PS2
  jr z, ProcessPS2KeyCodes
.processIGKB
  cp a, KB_TYPE_IGKB
  ret nz;unknown mode
  ;fall through to process IG key codes

ProcessIGKeyCodes:
  xor a
  ld [rSB], a
  ld a, SCF_TRANSFER_START | SCF_CLOCK_INTERNAL
  ld [rSC], a ;ask for byte using gb clock
  call USBDelay
  ld a, [rSB]
  and a
  ret z
  cp a, $FF
  ret z
  jp IGKBHandleCode

ProcessPS2KeyCodes:
  ld a, [kb_buffer_write]
  ld b, a;b = write index
  ld a, [kb_buffer_read]
  ld d, 0
  ld e, a;de = read index
  cp a, b
  ret z;if read == write, done

.loop
    ld hl, kb_error_buffer
    add hl, de;[hl] = current error
    ld a, [hl];error code
    and a;check for errors
    jr nz, .incrementReadIndex;if errors found, don't process keycode

  .processKeyCode
    ld hl, kb_scan_code_buffer
    add hl, de;[hl] = current scan code
    ld a, [hli];scan code
    push de;store read index
    push bc;store write index
    call PS2HandleKeycode
    pop bc;restore write index
    pop de;restore read index

  .incrementReadIndex
    ld a, e
    inc a
    and a, %00000111;read%8
    ld e, a;de = read index
    ld [kb_buffer_read], a

  .checkDone
    cp a, b;if read == write, done
    jp nz, .loop
  ret