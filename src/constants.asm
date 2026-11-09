DEF EDGB_UNLOCK_KEY   EQU $a5 

;SRAM
DEF sSPIData           EQU $bd00 ; SPI byte transfer register
DEF sSPIControl        EQU $bd01 ; SPI control/CS clock mode register
DEF sBufferSectorLow   EQU $bd02 ; 512-byte sector pointer low byte
DEF sBufferSectorHigh  EQU $bd03 ; 512-byte sector pointer high byte

; Launch/game configuration registers
DEF sGameROMMask       EQU $bd04 ; ROM bank mask for the launched game
DEF sGameRAMMask       EQU $bd05 ; RAM bank mask for the launched game
DEF sStreamingConfig   EQU $bd06 ; streaming and OS-mode config bits
DEF sCartMapperMode    EQU $bd07 ; cartridge mapper mode for the target game
DEF sCurrentBank       EQU $bd08 ; current SRAM bank in the windowed OS map
DEF sCartSwitch        EQU $bd09 ; cart-switch / resume-reboot latch bits
DEF sEDGBUnlock        EQU $bd0a ; EverDrive unlock key register
DEF sExtraControl      EQU $bd0b ; spare control register / reserved slot

; I2C / RTC expansion registers
DEF sI2CInterfaceC    EQU $bd0c ; I2C bus control/status
DEF sI2CInterfaceD    EQU $bd0d ; I2C bus data register
DEF sI2CInterfaceE    EQU $bd0e ; I2C bus status / scratch register
DEF sI2CInterfaceF    EQU $bd0f ; I2C bus scratch register

DEF sRegBD20          EQU $bd20;new in v1.06
DEF sBufferWindow     EQU $be00;$be00 - $bfff ; 512-byte SRAM window used by the OS snapshot routines
DEF sIO               EQU $bf00;$bf00 - $bf32... overlaps with buffer window ; shadowed IO register window
DEF sGBCFlags         EQU $bf4d ; GBC detection / speed flags

; The code sometimes calls into the OS runtime helper area in RAM, not a ROM routine.
; These are SDCC-generated stubs / helper entry points and their exact addresses drift as
; the OS is rebuilt, so the current build exposes them at $a13b, $a306, $a309, $b81d, and $b8b5.
; The old "$b805" note is stale and does not match the current disassembly.
DEF sSDCCRuntimeBranch  EQU $a13b ; helper branch target in the RAM runtime area
DEF sSDCCRuntimeCall    EQU $a306 ; indirect-call / trampoline helper in RAM
DEF sSDCCRuntimeHelper  EQU $a309 ; SDCC runtime helper entry used by generated code
DEF sSDCCSharedHelperA  EQU $b81d ; common SDCC helper in the RAM runtime window
DEF sSDCCSharedHelperB  EQU $b8b5 ; second common SDCC helper in the RAM runtime window

;VBlank save/restore snapshot addresses
DEF sSavedSP             EQU $0620 ; stack pointer saved before the OS snapshot
DEF sSavedMapperRegs     EQU $bd14 ; cart mapper registers saved in SRAM during a pause
DEF sSaveStateWindow     EQU $3e40 ; save sector window used for resumed game state
DEF sSavedScreenState    EQU $3e62 ; first block copied back during restore

; Snapshot sector numbers, selected through sBufferSectorLow/High, not CPU addresses.
; $BD06 bit 1 selects game save RAM; clear selects the snapshot/PSRAM buffer.
DEF SNAPSHOT_FIRST_SECTOR EQU $3e40
DEF SAVE_SLOT_FIRST_SECTOR EQU $0040
DEF SNAPSHOT_SECTOR_COUNT EQU $00a4 ; 82 KiB, copied through a 512-byte stack buffer
DEF SNAPSHOT_HEADER_SECTOR EQU $40 ; low byte; high byte stays $3e during capture
DEF SNAPSHOT_DISPLAY_SECTOR EQU $41
DEF SNAPSHOT_CART_RAM_SECTOR EQU $62
DEF SNAPSHOT_CGB_SECTOR EQU $a2
DEF SNAPSHOT_STACK_TOP EQU $066e ; temporary stack in writable OS memory
DEF OS_STACK_TOP EQU $dfff

; Fields visible at $BE00 when the snapshot header sector is selected.
DEF sSnapshotSavedSP EQU sBufferWindow + 4
DEF sSnapshotMapperRegs EQU sBufferWindow + 6 ; RAMG, mode, RAM bank, ROM bank
DEF sSnapshotHRAM EQU $bf80 ; HRAM shadow in the OAM/IO snapshot sector

; Stack-local menu descriptors end in a word <= $000f instead of a string pointer.
DEF MENU_FLAG_MESSAGE EQU $0001 ; dismiss on any button; return initial selection
DEF MENU_FLAG_COMPACT EQU $0004 ; single-spaced rows
DEF INGAME_ACTION_SAVE EQU 0
DEF INGAME_ACTION_LOAD EQU 1
DEF INGAME_ACTION_EXIT EQU 2
DEF MENU_ACTION_CANCEL EQU $ff

;WRAM
DEF wMenuScreenBuffer EQU $c145 ; 20 x 18 tile shadow screen
DEF wMenuTextPointer EQU $c2ad ; word: next destination in the shadow screen
DEF wMenuCursorOffset EQU $c2af ; word: x + 20*y in the shadow screen
DEF wMenuTextMode EQU $c2b2 ; ORed into character tiles ($80 for unselected text)
DEF wMenuRowOverride EQU $d7d6 ; $ff = center dialog vertically
DEF wDisplaySystemType EQU $c2b3 ; 1 = DMG, 2 = SGB, 3 = CGB
DEF wInputRandomState EQU $c2b4 ; word: also mixed by NextRandomWord
DEF wInputRepeatCounter EQU $c2b6
DEF wRandomSequence EQU $c2b7 ; word

; Registry in WRAM. The last word is an additive checksum of the first $0108 bytes.
DEF wOSSystemType EQU $c001
DEF wSystemDirectoryCluster EQU $c027 ; dword
DEF wRegistry EQU $c02b
DEF REGISTRY_SIZE EQU $010a
DEF REGISTRY_CHECKSUM_SIZE EQU $0108
DEF REGISTRY_SIGNATURE EQU $1234
DEF wRegistrySwapAB EQU $c02e
DEF wGameMetadata EQU $c032
DEF wGameMapper EQU wGameMetadata
DEF wGameROMMask EQU wGameMetadata + 1
DEF wGameRAMMask EQU wGameMetadata + 2
DEF wGameHasBattery EQU wGameMetadata + 3
DEF wGameSGBFlag EQU wGameMetadata + 4
DEF wGameCGBMode EQU wGameMetadata + 5
DEF wGameHasRTC EQU wGameMetadata + 6
DEF wGameROMSectors EQU wGameMetadata + 7 ; word
DEF wGameRAMSectors EQU wGameMetadata + 9 ; word
DEF wGameTitle EQU wGameMetadata + 11 ; 16 bytes
DEF wPreparedGameEntry EQU $c04d ; expanded directory entry, $e5 bytes
DEF wPreparedGameValid EQU $c132
DEF wRegistryChecksum EQU $c133

; FAT32 volume, directory caches, and the single active file cursor.
DEF wFATEntryCapacity EQU $c2bf ; dword: FAT sectors * 128 entries/sector
DEF wFATStartSector EQU $c2c3 ; dword: absolute LBA
DEF wPartitionStartSector EQU $c2c7 ; dword
DEF wDirectoryCacheSector EQU $c2cb ; dword: absolute LBA, $ffffffff = invalid
DEF wFATCacheSector EQU $c2cf ; dword: sector offset within the FAT
DEF wFATSectorCount EQU $c2d3 ; dword
DEF wRootDirectorySector EQU $c2d7 ; dword; mount assumes root cluster 2
DEF wDataStartSector EQU $c2db ; dword
DEF wDirectoryCluster EQU $c2df ; dword: argument passed to ReadDirectoryIndex
DEF wReservedSectorCount EQU $c2e3 ; word
DEF wSectorsPerCluster EQU $c2e5
DEF wVolumeFATType EQU $c2e6 ; 0 = unknown, 1 = FAT16, 2 = FAT32
DEF wClusterSectorShift EQU $c2e7 ; log2(sectors per cluster)
DEF wAllocationCursor EQU $c2e8 ; dword
DEF wParentDirectoryCluster EQU $c2ec ; dword
DEF wDirectoryEntryCount EQU $c2f0 ; word, capped at 1000
DEF wDirectoryIsRoot EQU $c2f2
DEF wDirectorySectorBuffer EQU $c2f3 ; 512 bytes
DEF wFATSectorBuffer EQU $c4f3 ; 512 bytes
DEF wDirectoryEntryIDs EQU $c6f3 ; 1000 dwords: sector << 4 | entry index
DEF wFileCluster EQU $d693 ; dword
DEF wFileSector EQU $d697 ; dword: absolute LBA
DEF wFileByteSize EQU $d69b ; dword
DEF wFileSectorsRemaining EQU $d69f ; word, rounded up from byte size
DEF wFileWriteMode EQU $d6a1 ; zero = read-only; nonzero blocks ReadFileSectors
DEF wFileSectorInCluster EQU $d6a2
DEF wClusterToSectorTemp EQU $d6a3 ; dword
DEF wSectorToClusterTemp EQU $d6a7 ; dword

; Expanded directory entry fields used by the loader and filesystem.
DEF DIRECTORY_ENTRY_SIZE EQU $e5
DEF DIRECTORY_ENTRY_ID EQU $d4 ; first LFN entry, or short entry if no LFN
DEF DIRECTORY_ENTRY_SHORT_ID EQU $d8
DEF DIRECTORY_ENTRY_CLUSTER EQU $dc
DEF DIRECTORY_ENTRY_FILE_SIZE EQU $e0
DEF DIRECTORY_ENTRY_IS_DIRECTORY EQU $e4
DEF ROM_HEADER_TITLE EQU $0134
DEF ROM_HEADER_CGB_FLAG EQU $0143
DEF wGamepadState EQU $c2b1;$c2b0 in v1.04 (v1.06 inserts a byte before $c2ad)
  ;$c2b4 selected line?
  ;$c2b6 last button state?

