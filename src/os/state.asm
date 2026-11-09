; Flags stored in the cartridge's writable OS image, not Game Boy WRAM.
; Retained across the game's execution while the OS image remains resident.
SECTION "OS runtime state", ROM0[$01f0]

; Set before launch when the OS must back up save RAM on the next OS entry.
; InitializeStorageAndSettings clears it before invoking the save backup helper.
OSSaveBackupPending: DB 0

; Copied into $c004 and cleared by the first storage initialization.
; This records the first initialization of this OS image, not a hardware register.
OSInitializationPending: DB 1

; In-game "Back to menu" sets this; EntryPoint clears it and writes $BD06=$10.
OSReturnToMenuRequested: DB 0

; Boolean, not a page count. GetSnapshotCartRAMChunkCount returns C=1 for 0,
; C=4 otherwise: one or four 8 KiB chunks of game save RAM in the snapshot.
; LaunchPreparedGame sets it according to whether wGameRAMMask is nonzero.
SnapshotUse32KiBCartRAM: DB 0

; $01f4-$01ff: shipped as $ff. No actual accesses identified in this pass.
; Old "Writable01f5" references were stack offsets followed by ADD HL,SP.
OSStateReserved: DS 12, $ff

ASSERT @ == $0200
