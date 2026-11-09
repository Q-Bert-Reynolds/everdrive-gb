
SECTION "RST $00", ROM0[$0000]
  jp EntryPoint

SECTION "RST $08", ROM0[$0008]
  reti

SECTION "RST $10", ROM0[$0010]
  reti

SECTION "RST $18", ROM0[$0018]
  reti

SECTION "RST $20", ROM0[$0020]
  reti

SECTION "RST $28", ROM0[$0028]
  reti

SECTION "RST $30", ROM0[$0030]
  reti

SECTION "RST $38", ROM0[$0038]
  reti

SECTION "VBlank", ROM0[$0040]
VBlankVector:
  jp VBLInterrupt

; Unused vectors are $FF (rst $38). The reti at $38 returns to the next $FF,
; and the chain continues until it reaches the reti at $0066.
SECTION "p1thru4", ROM0[$0060]
  DS 6, $ff
  reti

SECTION "Header", ROM0[$0100]
  jp EntryPoint
  DB $ff

  NINTENDO_LOGO
  DB "GBXOS"
  DS 6, $ff
  DB "KRKZ"
  DB CART_COMPATIBLE_DMG_GBC
  DB $ff, $ff
  DB CART_INDICATOR_SGB
  DB CART_ROM;cart size and type info don't reflect reality
  DB CART_ROM_32KB
  DB CART_SRAM_NONE
  DB CART_DEST_NON_JAPANESE
  DB $33
  DB 0
  DB $73;header checksum (valid for every build option)
  DB $e1, $7e;global checksum as shipped (same in v1.04-v1.06; incorrect, but unused by hardware)
             ;rgbfix -v overwrites this in modded builds; `make original` leaves it alone

SECTION "Bank 0 Code, A", ROM0[$0280]
EntryPoint:
  di
  ld sp, OS_STACK_TOP
  ld a, EDGB_UNLOCK_KEY
  ld [sEDGBUnlock], a; Unlock EverDrive FPGA hardware registers ($A5 is the unlock key)
  
.checkReturnToMenuRequest
  ld a, [OSReturnToMenuRequested]
  cp $00
  jr nz, HandleReturnToMenuRequest

InitializeCart::
  ld sp, OS_STACK_TOP;end of ram
  ld a, $00
  ldh [rSVBK], a
  ldh [rVBK], a
  ld [sCartMapperMode], a; Cartridge mapper mode
  ld a, $04
  ld [sCartSwitch], a
  call SetInterrupts
  call InitializeOS
  jr EntryPoint

SetInterrupts::;probably not the only thing this does
  ld a, $04
  ld [sStreamingConfig], a
  ld a, $00
  DB $ea
  DW rIE;ld [rIE], a (3-byte form) to disable all interrupts
  ld [sSPIControl], a; SPI Control: Assert CS (0), fast speed (0), auto-read disabled (0)
  ld a, OS_PAGE_FILE_BROWSER
  ld [sCurrentBank], a; Select OS page 4
  ret

HandleReturnToMenuRequest:
  ; "Back to menu" reaches here with OSReturnToMenuRequested=1. The $10 config write
  ; requests the cart's OS reboot; the CPU spins while the hardware acts.
  ld a, $00
  ld [OSReturnToMenuRequested], a
  ld a, $10
  ld [sStreamingConfig], a

LoopForever:
  jr LoopForever
