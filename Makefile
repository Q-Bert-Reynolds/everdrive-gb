IMAGE_DEPS = gfx/font.1bpp

all: GBCOS.bin

	cp GBCOS.bin GBCOS.gb
ifeq ($(OS), Windows_NT)
	start "GBCOS.gb"
else
	open GBCOS.gb
endif

%.2bpp: %.png
	rgbgfx -o $@ $<

%.1bpp: %.png
	rgbgfx -d 1 -o $@ $<

GBCOS.o: GBCOS.asm bank_*.asm $(IMAGE_DEPS)
	rgbasm  -o GBCOS.o GBCOS.asm

GBCOS.bin: GBCOS.o
	rgblink -n GBCOS.sym -m GBCOS.map -o $@ $<
	rgbfix -v -p 255 $@

	md5 $@

clean:
	rm -f GBCOS.o GBCOS.bin GBCOS.sym GBCOS.map
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' \) -exec rm {} +