This is a disassembly of Krikzz's [Everdrive GBC-OS v1.06](http://krikzz.com/pub/support/everdrive-gb/x-series/OS/GBC-OS-v1.06.zip)

Initial disassembly was done with [mgbdis v1.5](https://github.com/mattcurrie/mgbdis). It was originally made from v1.04, which is tagged `v1.04` in this repository.

See [BANK_0.md](notes/BANK_0.md) for the bank 0 module map and named entry points,
and [OS_INTERFACE.md](notes/OS_INTERFACE.md) for the runtime flags and function table.
See [MEMORY_LAYOUT.md](notes/MEMORY_LAYOUT.md) for the fixed OS region, banked
8 KiB pages, and the rough bank 1-4 module map.

To change colors, edit the RGB values (0 to 31) in [colors.asm](src/colors.asm).

To change the font, edit [font.png](gfx/font.png).

## Build options

The custom colors and custom font support can each be turned off (see [options.inc](src/options.inc)):

```
make                # everything on
make COLORS=0       # custom colors off
make original       # all off: GBCOS_original.bin, byte-identical to GBC-OS-v1.06.bin
```
