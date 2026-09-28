This is a disassembly of Krikzz's [Everdrive GBC-OS v1.04](http://krikzz.com/pub/support/everdrive-gb/x-series/OS/GBC-OS-v1.04.zip) with added [PS/2](https://catskullelectronics.com/collections/game-boy/products/gameboy-color-ps-2-keyboard-cable) and [USB](https://shop.insidegadgets.com/product/gameboy-usb-keyboard-adapter/) keyboard support.

Initial disassembly was done with [mgbdis v1.5](https://github.com/mattcurrie/mgbdis).

To change colors, edit the RGB values (0 to 31) in [colors.asm](colors.asm).

To change the font, edit [font.png](gfx/font.png).


EDGB Hardware Register Map:

$BD0A	    W   	Hardware Unlock	        
                    Writing $A5 unlocks access to all other cartridge registers.

$BD00	    R/W	    SPI Data Register	    
                    Writing a byte initiates an SPI transmission to the SD card. 
                    Reading returns the received byte.

$BD01	    R/W	    SPI Status & Control	
                    • Bit 7 (Read): Busy flag (1 = busy, 0 = transfer complete)
                    • Bit 2 (Write): Auto-Clock Streaming (1 = auto clock on read, 0 = manual)
                    • Bit 1 (Write): SPI Clock Speed (1 = Slow ~400 kHz for init, 0 = Fast / Full Speed)
                    • Bit 0 (Write): SD Chip Select / CS (0 = Assert/Active Low, 1 = Deassert/Inactive)

$BD06	    R/W	    Streaming / System Config	
                    • Bit 0: Set to 1 with $BD01.2 to enable high-speed sector streaming.

$BD02	    R/W	    Buffer Sector Pointer (Low)	
                    Selects the 512-byte sector mapped to $BE00–$BFFF.

$BD03	    R/W	    Buffer Sector Pointer (High)	
                    High byte for sector buffer selection.

$BE00–$BFFF	R/W	    512-Byte Sector Window	
                    512-byte hardware buffer window mapped into cart SRAM space.

$BD08	    R/W	    OS SRAM Bank	
                    Banks 8 KB RAM/ROM pages into $A000–$BFFF for the OS menu.

$BD0C–$BD0F	R/W	    I2C Interface	
                    Controls the on-cartridge RTC (Real-Time Clock) and EEPROM/FRAM.
