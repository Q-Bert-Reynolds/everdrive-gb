; 512-byte cartridge window transfers

SECTION "512-byte cartridge window transfers", ROM0[$0965]

CopyEndOfSRAMtoHL::;hl = address, c = count
  ld de, sBufferWindow;last 512 bytes of _SRAM
  call Copy512FromDEtoHL
  call IncrementBD02
  dec c
  jr nz, CopyEndOfSRAMtoHL

  ret


CopyDEtoEndOfSRAM::;de = address, c = count
  ld hl, sBufferWindow
  call Copy512FromDEtoHL
  call IncrementBD02
  dec c
  jr nz, CopyDEtoEndOfSRAM

  ret


IncrementBD02:
  ld a, [sBufferSectorLow]
  inc a
  ld [sBufferSectorLow], a
  ret


Copy512FromDEtoHL:
.first256BytesLoop:
    ld a, [de]
    ld [hl+], a
    inc e
  jr nz, Copy512FromDEtoHL
  inc d
.secondPage:
    ld a, [de]
    ld [hl+], a
    inc e
    jr nz, .secondPage
  inc d
  ret


Copy256FromDEtoHL:
    ld a, [de]
    ld [hl+], a
    inc e
    jr nz, Copy256FromDEtoHL
  ret


CopySRAMtoIO:
  ld hl, SRAMtoIOMap
  ld bc, _IO
  ld de, sIO;last 256 bytes of _SRAM
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

ClearBufferWindow:
  ld hl, sBufferWindow
  ld a, $ff
  ld c, $80

.fill:
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  ld [hl+], a
  dec c
  jr nz, .fill

  ret
