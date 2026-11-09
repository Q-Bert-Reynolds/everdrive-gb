; Fixed ABI used by OS code executing from banked cartridge SRAM.
; Each entry is a little-endian CPU function address, not a JP instruction.
; Slot addresses are stable even if implementations move.
SECTION "OS function pointer table", ROM0[$0200]

OSFunctionTable::
OSAPI_PrepareGame: DW PrepareGame ; slot 00, $0200 -> $1784
OSAPI_LaunchPreparedGame: DW LaunchPreparedGame ; slot 01, $0202 -> $1959
OSAPI_ReadGameMetadata: DW ReadGameMetadata ; slot 02, $0204 -> $12b1
OSAPI_WriteCartridgeBufferToFile: DW WriteCartridgeBufferToFile ; slot 03, $0206 -> $657b
OSAPI_ReadFileToCartridgeBuffer: DW ReadFileToCartridgeBuffer ; slot 04, $0208 -> $65e2
OSAPI_SaveRegistry: DW SaveRegistry ; slot 05, $020a -> $105f
OSAPI_GetOSGlobalsPointer: DW GetOSGlobalsPointer ; slot 06, $020c -> $1acb
OSAPI_GetRegistryPointer: DW GetRegistryPointer ; slot 07, $020e -> $1acf
OSAPI_FindRandomGame: DW FindRandomGame ; slot 08, $0210 -> $1ad3
OSAPI_CallPage: DW OS_CallPage ; slot 09, $0212 -> $048f
OSAPI_SetSectorPointer: DW Cart_SetSectorPointerFromStack ; slot 10, $0214 -> $04ba
OSAPI_SelectSnapshotBuffer: DW DisableStreaming ; slot 11, $0216 -> $04a8
OSAPI_SelectSaveRAM: DW EnableStreaming ; slot 12, $0218 -> $04b1
OSAPI_CopyMemory: DW CopyMemory ; slot 13, $021a -> $09ef
OSAPI_FillMemory: DW FillMemory ; slot 14, $021c -> $0a02
OSAPI_GetButtonDown: DW GetButtonDown ; slot 15, $021e -> $1fb5
OSAPI_GetInput: DW GetInput ; slot 16, $0220 -> $1fc8
OSAPI_RenderNextTextLine: DW LoadOSInitText ; slot 17, $0222 -> $219a
OSAPI_RenderMenuLabel: DW RenderMenuLabel ; slot 18, $0224 -> $21c0
OSAPI_AdvanceMenuRows: DW SetMenuCursor ; slot 19, $0226 -> $220d
OSAPI_GetMenuRow: DW GetSelectedMenuEntry ; slot 20, $0228 -> $226b
OSAPI_LoadText: DW LoadText ; slot 21, $022a -> $202c
OSAPI_RenderDecimal32: DW RenderDecimal32 ; slot 22, $022c -> $20ef
OSAPI_RenderHexByte: DW RenderHexByte ; slot 23, $022e -> $2061
OSAPI_RenderHexWord: DW RenderHexWord ; slot 24, $0230 -> $20b1
OSAPI_RenderHexDWord: DW RenderHexDWord ; slot 25, $0232 -> $20c6
OSAPI_ClearShadowScreen: DW ClearShadowScreen ; slot 26, $0234 -> $217a
OSAPI_UploadShadowScreen: DW DrawToScreen0 ; slot 27, $0236 -> $09cc
OSAPI_SetMenuCursor: DW SetMenuCursorAddress ; slot 28, $0238 -> $2236
OSAPI_RenderTextAtPosition: DW RenderTextAtPosition ; slot 29, $023a -> $227c
OSAPI_SetMenuTextMode: DW SetMenuTextMode ; slot 30, $023c -> $2295
OSAPI_FillMenuRectangle: DW FillMenuRectangle ; slot 31, $023e -> $229f
OSAPI_WaitVBlank: DW WaitVBL ; slot 32, $0240 -> $09c1
OSAPI_ReadDirectoryIndex: DW ReadDirectoryIndex ; slot 33, $0242 -> $321f
OSAPI_GetDirectoryEntryCount: DW GetDirectoryEntryCount ; slot 34, $0244 -> $58a4
OSAPI_OpenFileFromEntry: DW OpenFileForSectorIO ; slot 35, $0246 -> $3a77
OSAPI_OpenFileByPath: DW OpenFileByPath ; slot 36, $0248 -> $407e
OSAPI_ReadFileSectors: DW ReadFileSectors ; slot 37, $024a -> $3d1c
OSAPI_WriteFileSectors: DW WriteFileSectors ; slot 38, $024c -> $49d2
OSAPI_ReadDirectoryEntry: DW ReadDirectoryEntry ; slot 39, $024e -> $36a4
OSAPI_BuildPathWithExtension: DW BuildPathWithExtension ; slot 40, $0250 -> $3f75
OSAPI_GetParentDirectoryCluster: DW GetParentDirectoryCluster ; slot 41, $0252 -> $58ac
OSAPI_GetDirectoryCluster: DW GetDirectoryCluster ; slot 42, $0254 -> $58b8
OSAPI_GetDirectoryEntryIDs: DW GetDirectoryEntryIDs ; slot 43, $0256 -> $58c4
OSAPI_RemoveDirectoryEntryID: DW RemoveDirectoryEntryID ; slot 44, $0258 -> $57a9
OSAPI_StringLength: DW StringLength ; slot 45, $025a -> $2bd1
OSAPI_StringEndsWithIgnoreCase: DW StringEndsWithIgnoreCase ; slot 46, $025c -> $2beb
OSAPI_StringMatchesSuffixList: DW StringMatchesSuffixList ; slot 47, $025e -> $2c47
OSAPI_CompareBytesEqual: DW CompareBytesEqual ; slot 48, $0260 -> $2b85
OSAPI_ShowMenuDialog: DW ShowMenuDialog ; slot 49, $0262 -> $67f9
OSAPI_ResetStatusText: DW ResetStatusText ; slot 50, $0264 -> $6b05
OSAPI_AppendStatusText: DW AppendStatusText ; slot 51, $0266 -> $6b22
OSAPI_AppendStatusDecimal32: DW AppendStatusDecimal32 ; slot 52, $0268 -> $6bf1
OSAPI_AppendStatusHexByte: DW AppendStatusHexByte ; slot 53, $026a -> $6c28
OSAPI_AppendStatusHexWord: DW AppendStatusHexWord ; slot 54, $026c -> $6c45
OSAPI_SetDialogRow: DW SetDialogRow ; slot 55, $026e -> $6afb
OSAPI_ReadI2CBytes: DW ReadI2CBytes ; slot 56, $0270 -> $58c8
OSAPI_WriteI2CBytes: DW WriteI2CBytes ; slot 57, $0272 -> $594f
OSAPI_LatchAndReadGameRTC: DW LatchAndReadGameRTC ; slot 58, $0274 -> $5c74
OSAPI_WriteMapperRTCRegisters: DW WriteMapperRTCRegisters ; slot 59, $0276 -> $5b2c
OSAPI_ReadRTCClockRegisters: DW ReadRTCClockRegisters ; slot 60, $0278 -> $5acd
OSAPI_WriteRTCClockRegisters: DW WriteRTCClockRegisters ; slot 61, $027a -> $5b09
OSAPI_ReadSavedGameRTCShadow: DW ReadSavedGameRTCShadow ; slot 62, $027c -> $5b8d
OSAPI_ProgramGameRTC: DW ProgramGameRTC ; slot 63, $027e -> $5c17

OSFunctionTableEnd:
ASSERT OSFunctionTableEnd - OSFunctionTable == 64 * 2
ASSERT OSFunctionTableEnd == $0280
