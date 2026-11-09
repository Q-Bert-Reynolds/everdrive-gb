# Path construction

`src/paths.asm` contains two routines. All arguments are 16-bit pointers on the
stack, listed below in increasing address order after the return address. Callers
push them in reverse order and remove them afterward. Both routines write a
NUL-terminated result into the caller's destination buffer.

## JoinPath — $3f36

Arguments: **destination, directory, name**.

Clear the destination, append the directory, append `/` unless the directory's
length is one, then append the name. The length-one exception handles root `/`.
This does not normalize separators: other trailing slashes produce `//`, and an
empty directory produces a leading slash.

## BuildPathWithExtension — $3f75–$407d

Arguments: **directory, name, extension, destination**. OS API slot 40 points here.
The save/restore callers in `src/game/saves.asm` pass the selected game's name at
`$c04d`, the save/snapshot directory, an extension, and a scratch output buffer.

First call `JoinPath(destination, directory, name)`. Then choose between two
representations based on the name length:

| Input representation | Extension replacement |
| --- | --- |
| Name length equals 11 | Treat the name as the FAT short-name field: eight base bytes followed by three extension bytes, including space padding. Locate the last three bytes of the joined path, skip one leading dot in the supplied extension, copy its bytes with bit 5 cleared, and terminate with NUL. |
| Other lengths | Scan the entire joined path for dots. If any exist, find the last dot by walking backward from the terminator; otherwise use the terminator. Replace everything from there with the supplied extension, inserting a dot if it does not already start with one. Preserve the supplied case. |

`ReadDirectoryEntry` in `src/sd/fat_directory.asm` copies the raw 11-byte FAT name
when no long name was decoded, then adds a NUL. This explains why the length-11
branch preserves spaces and does not insert a dot.

Examples (spaces inside quoted names are significant):

| Directory | Name | Extension | Result |
| --- | --- | --- | --- |
| `/GBCSYS/SAVE` | `TETRIS.GB` | `sav` | `/GBCSYS/SAVE/TETRIS.sav` |
| `/GBCSYS/SAVE` | `TETRIS.GB` | `.sav` | `/GBCSYS/SAVE/TETRIS.sav` |
| `/` | `demo` | `sav` | `/demo.sav` |
| `/GBCSYS/SAVE` | `"TETRIS  GB "` | `.sav` | `"/GBCSYS/SAVE/TETRIS  SAV"` |

These are code-derived examples, not hardware test results. The branch checks
length alone: an ordinary dotted name of exactly 11 characters also takes the
short-name path. In that path `AND $df` clears bit 5 unconditionally rather than
performing a general uppercase conversion, and the extension copy does not pad
or limit itself to three bytes. The routines use the low byte of string lengths.

For dotted names, the dot scan includes the directory. A dot in a directory can
therefore become the replacement position if the filename has no dot. An empty
extension produces a trailing dot for dotted names, but simply removes the last
three bytes for short names. No bounds checking or path normalization is added
by these routines.

## Section boundary and stack frame

The routine begins in ROM0 and continues at `$4000` in bank 1, the upper half of
the fixed 32 KiB OS region. Execution falls through normally; no page selection
or far call occurs at the boundary. `BuildPathWriteShortExtension` names this
continuation; `BuildPathReplaceDottedExtension` is the other branch at `$401d`.
Both reach `BuildPathExtensionReturn` at `$407b` to release the nine-byte frame.

| Frame offset | Use |
| --- | --- |
| +0 | Flag: a dot was found in the joined path |
| +1..2 | Original extension pointer |
| +3..4 | Destination pointer |
| +5..6 | Short-name extension read cursor, or dotted-name replacement position |
| +7..8 | Saved destination pointer |
| +$0b, +$0d, +$0f, +$11 | Directory, name, extension, destination arguments |

Offsets assume no temporary pushes. In the short-name branch, skipping a leading
dot updates the stack argument at +$0f; it does not modify the extension text.

The former `Bank1Data4030` label actually occupied `$4046`, the second byte of
`ld hl, sp+$05` at `$4045`. It was an unused disassembler artifact, not data or an
entry point, and has been removed. The former raw call operand `$2d7e` is now
`AppendString`. All continuation instructions retain their original bytes.
