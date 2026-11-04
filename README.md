This is a disassembly of Krikzz's [Everdrive GBC-OS v1.04](http://krikzz.com/pub/support/everdrive-gb/x-series/OS/GBC-OS-v1.04.zip) with added [PS/2](https://catskullelectronics.com/collections/game-boy/products/gameboy-color-ps-2-keyboard-cable) and [USB](https://shop.insidegadgets.com/product/gameboy-usb-keyboard-adapter/) keyboard support.

Initial disassembly was done with [mgbdis v1.5](https://github.com/mattcurrie/mgbdis).

To change colors, edit the RGB values (0 to 31) in [colors.asm](colors.asm).

To change the font, edit [font.png](gfx/font.png).

## Build options

The custom colors, custom font, and keyboard support can each be turned off (see [options.inc](options.inc)):

```
make                # everything on
make KEYBOARD=0     # any of COLORS, FONT, KEYBOARD can be set to 0
make original       # all off: GBCOS_original.bin, byte-identical to GBC-OS-v1.04.bin
```