# In-game menu in stock v1.06

This walkthrough follows `build/GBCOS_original.BIN`, verified against MD5
`f200a1c6417323274e30ddf6ce5ec263`. Addresses below are CPU addresses unless
explicitly called sector numbers. The source labels and symbolic operands preserve
the original bytes.

## Why the strings had no references

`ShowInGameMenu` at `$0a88` constructs this descriptor on the stack:

```c
uint16_t menu[] = {
    0x0cdf,  // InGameMenuText: "In Game Menu"
    0x0cec,  // SaveStateText:  "Save State"
    0x0cf7,  // LoadStateText:  "Load State"
    0x0d02,  // BackToMenuText: "Back to menu"
    0x0000   // flags / end of pointer list
};
```

The compiler emits each pointer as separate low/high byte stores, such as
`ld [hl], $df` followed by `ld [hl], $0c`. These are now expressed as
`LOW(InGameMenuText)` and `HIGH(InGameMenuText)`, so references are searchable
and track the label if it moves.

The second descriptor uses the same title, three pointers into the no-save
message, and flags `$0005`. Its lines are "there is no", "save data", and
"for current game". Bit 0 makes it dismiss on any button, and bit 2 packs the
rows together.

## Entry and snapshot capture

The OS's VBlank vector at `$0040` jumps to `VBLInterrupt` at `$0670`. That handler
does not read the physical cartridge button. The cartridge must arrange for the
CPU to execute this OS code while preserving the interrupted game's context.
Exactly how the button triggers that mapping change, and when the FPGA switches
back, cannot be established from this ROM alone. Gearboy's implementation is not
used as evidence for that hardware behavior.

The handler pushes AF/BC/DE/HL on the game's stack, unlocks the cartridge registers
with `$BD0A=$a5`, and saves SP at `$0620`. It then uses a temporary stack at `$066e`
in writable OS memory. It captures the game before reusing VRAM and WRAM for the
menu, then sets the menu stack to `$dfff` and jumps to `ShowInGameMenu`.

The snapshot uses the 512-byte `$BE00-$BFFF` window, selected by `$BD02/$BD03`:

| Snapshot sectors | Contents written by the capture routines |
| --- | --- |
| `$3e40` | `SAVE` signature, saved SP, four mapper bytes from `$BD14-$BD17` |
| `$3e41-$3e50` | VRAM bank 0 |
| `$3e51-$3e60` | WRAM `$c000-$dfff` |
| `$3e61` | `$fe00-$ffff`, including OAM, IO, and HRAM |
| `$3e62` onward | Game save RAM, copied in one or four 8 KiB chunks |
| `$3ea2` | CGB background and object palettes |
| `$3ea3-$3eb2` | CGB VRAM bank 1 |
| `$3eb3-$3ee2` | CGB WRAM banks 2-7 |

The CGB capture is skipped on DMG. The menu copies the fixed range
`$3e40-$3ee3` when saving/loading, including space not written on every capture.

## Drawing and input

`ShowInGameMenu` reserves `$021d` bytes of stack, including the two descriptors
and a 512-byte transfer buffer. It initializes the display and calls
`ShowMenuDialog` at bank 1 address `$67f9`, with initial selection 0.

`ShowMenuDialog` scans descriptor words until a value at most `$000f` appears;
that word contains flags, and earlier words point to the title and entries. It
measures the strings, draws a centered frame, and renders the labels through
`RenderMenuLabel` into the shadow screen at `$c145`. `DrawToScreen0` copies that
buffer into the background tilemap. Up/down move the selection, A returns it,
and B returns `$ff`. `GetInput` applies the configured A/B swap before this.

## Actions

After the dialog returns, the caller waits for buttons to be released and draws
"Loading...". It then dispatches the returned byte:

| Result | Behavior |
| --- | --- |
| `0`: Save State | Copy 164 sectors from snapshot `$3e40+i` to save RAM `$0040+i`, then resume |
| `1`: Load State | Check for `SAVE` at save RAM sector `$0040`; if present, copy those sectors back into the snapshot and resume |
| `2`: Back to menu | Set `CartSwitch` at `$01f2` to 1 and call `EntryPoint`; its switch path writes `$BD06=$10` and spins |
| `$ff`: B/cancel | Resume the captured game without copying the save slot |

`EnableStreaming` and `DisableStreaming` select the two backing stores through
bit 1 of `$BD06`: set selects cartridge save RAM, clear selects the temporary
snapshot backing store. Each sector copy passes through the stack buffer.
The slot is 164 × 512 = 83,968 bytes (82 KiB), beginning at byte offset `$8000`
in save RAM. The menu makes no SD calls; any later persistence to files is a
separate OS path and is outside this walkthrough.

If the load signature is absent, the no-save dialog waits for acknowledgment,
then restores the current snapshot. `CompareBytesEqual` returns 1 for a matching
four-byte signature, rather than the zero-for-equal convention of `memcmp`.

## Returning to the game

`RestoreSnapshotState` at `$07ce` restores the saved RAM/display/CGB context and
calls `RestoreMapperState`, which restores the saved SP and mapper registers.
`ResumeFromSavedCartState` pulses `$BD09` with 2 then 0, pops HL/DE/BC, waits for
a fresh VBlank, pops AF, and jumps to `$0040`. The cartridge must hand that vector
back to the game for this to resume correctly. This path does not return to the
menu caller; trailing cleanup instructions are not the normal exit.
