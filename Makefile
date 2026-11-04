IMAGE_DEPS = gfx/font.1bpp gfx/font_original.1bpp
SOURCES = GBCOS.asm options.inc constants.asm colors.asm macros.inc hardware.inc bank_*.asm keyboard/*.asm

# Feature toggles (1 = on, 0 = off), e.g. `make KEYBOARD=0`. See options.inc.
COLORS ?= 1
FONT ?= 1
KEYBOARD ?= 1
ASMFLAGS = -D CUSTOM_COLORS=$(COLORS) -D CUSTOM_FONT=$(FONT) -D KEYBOARD=$(KEYBOARD)

# md5 of the stock GBC-OS-v1.06.bin
ORIGINAL_MD5 = f200a1c6417323274e30ddf6ce5ec263

all: GBCOS.bin

	cp GBCOS.bin GBCOS.gb
ifeq ($(OS), Windows_NT)
	start "GBCOS.gb"
else
	open GBCOS.gb
endif

# Unmodified v1.06, byte for byte
original: GBCOS_original.bin

.PHONY: all original clean FORCE

%.2bpp: %.png
	rgbgfx -o $@ $<

%.1bpp: %.png
	rgbgfx -d 1 -o $@ $<

# FORCE: always reassemble so changing a toggle takes effect
GBCOS.o: $(SOURCES) $(IMAGE_DEPS) FORCE
	rgbasm $(ASMFLAGS) -o GBCOS.o GBCOS.asm

GBCOS.bin: GBCOS.o
	rgblink -p 0xff -n GBCOS.sym -m GBCOS.map -o $@ $<
	rgbfix -Wno-overwrite -v -p 255 $@

	md5sum $@

GBCOS_original.o: $(SOURCES) $(IMAGE_DEPS)
	rgbasm -D CUSTOM_COLORS=0 -D CUSTOM_FONT=0 -D KEYBOARD=0 -o $@ GBCOS.asm

# No rgbfix: the header checksums are already in the source, and the stock
# ROM's global checksum is wrong, so `rgbfix -v` would change it.
GBCOS_original.bin: GBCOS_original.o
	rgblink -p 0xff -n GBCOS_original.sym -m GBCOS_original.map -o $@ $<
	@md5sum $@ | grep -q $(ORIGINAL_MD5) \
		&& echo "$@ matches GBC-OS-v1.06.bin" \
		|| (echo "$@ does NOT match GBC-OS-v1.06.bin" && false)

clean:
	rm -f GBCOS.o GBCOS.bin GBCOS.sym GBCOS.map
	rm -f GBCOS_original.o GBCOS_original.bin GBCOS_original.sym GBCOS_original.map
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' \) -exec rm {} +
