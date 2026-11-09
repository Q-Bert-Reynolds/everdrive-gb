
SECTION "Writable ROM0", ROM0[$01f0]
Writable01f0:       DB 0
Writable01f1:       DB 1
CartSwitch:         DB 0
SaveStatePageCount: DB 0
Writable01f4:       DB $FF
Writable01f5:       DB $FF
  
  DS 10, $FF
  
  DB $84, $17, $59, $19, $B1, $12, $7B, $65, $E2, $65, $5F, $10, $CB, $1A, $CF, $1A
  DB $D3, $1A, $8F, $04, $BA, $04, $A8, $04, $B1, $04, $EF, $09, $02, $0A, $B5, $1F
  DB $C8, $1F, $9A, $21, $C0, $21, $0D, $22, $6B, $22, $2C, $20, $EF, $20, $61, $20
  DB $B1, $20, $C6, $20, $7A, $21, $CC, $09, $36, $22, $7C, $22, $95, $22, $9F, $22
  DB $C1, $09, $1F, $32, $A4, $58, $77, $3A, $7E, $40, $1C, $3D, $D2, $49, $A4, $36
  DB $75, $3F, $AC, $58, $B8, $58, $C4, $58, $A9, $57, $D1, $2B, $EB, $2B, $47, $2C
  DB $85, $2B, $F9, $67, $05, $6B, $22, $6B, $F1, $6B, $28, $6C, $45, $6C, $FB, $6A
  DB $C8, $58, $4F, $59, $74, $5C, $2C, $5B, $CD, $5A, $09, $5B, $8D, $5B, $17, $5C
