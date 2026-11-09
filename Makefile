IMAGE_DEPS = gfx/font.1bpp gfx/font_original.1bpp
# Track every included assembly unit, including the extracted bank 0 modules.
SOURCES = $(shell find src -type f \( -name '*.asm' -o -name '*.inc' \))
BUILD_DIR := build

# Feature toggles (1 = on, 0 = off), See options.inc.
COLORS ?= 1
FONT ?= 1
ASMFLAGS = -D CUSTOM_COLORS=$(COLORS) -D CUSTOM_FONT=$(FONT)

# md5 of the stock GBC-OS-v1.06.BIN
ORIGINAL_MD5 = f200a1c6417323274e30ddf6ce5ec263

all: $(BUILD_DIR)/GBCOS.BIN
	cp $(BUILD_DIR)/GBCOS.BIN $(BUILD_DIR)/GBCOS.gb
ifeq ($(OS), Windows_NT)
	start "$(BUILD_DIR)/GBCOS.gb"
else
	gearboy $(BUILD_DIR)/GBCOS.gb
endif

# Unmodified v1.06, byte for byte
original: $(BUILD_DIR)/GBCOS_original.BIN

.PHONY: all original clean FORCE

%.2bpp: %.png
	rgbgfx -o $@ $<

%.1bpp: %.png
	rgbgfx -d 1 -o $@ $<

$(BUILD_DIR):
	mkdir -p $@

# FORCE: always reassemble so changing a toggle takes effect
$(BUILD_DIR)/GBCOS.o: $(SOURCES) $(IMAGE_DEPS) FORCE | $(BUILD_DIR)
	rgbasm $(ASMFLAGS) -o $@ src/GBCOS.asm

$(BUILD_DIR)/GBCOS.BIN: $(BUILD_DIR)/GBCOS.o | $(BUILD_DIR)
	rgblink -p 0xff -n $(BUILD_DIR)/GBCOS.sym -m $(BUILD_DIR)/GBCOS.map -o $@ $<
	rgbfix -Wno-overwrite -v -p 255 $@

	md5sum $@

$(BUILD_DIR)/GBCOS_original.o: $(SOURCES) $(IMAGE_DEPS) | $(BUILD_DIR)
	rgbasm -D CUSTOM_COLORS=0 -D CUSTOM_FONT=0 -o $@ src/GBCOS.asm

# No rgbfix: the header checksums are already in the source, and the stock
# ROM's global checksum is wrong, so `rgbfix -v` would change it.
$(BUILD_DIR)/GBCOS_original.BIN: $(BUILD_DIR)/GBCOS_original.o | $(BUILD_DIR)
	rgblink -p 0xff -n $(BUILD_DIR)/GBCOS_original.sym -m $(BUILD_DIR)/GBCOS_original.map -o $@ $<
	@md5sum $@ | grep -q $(ORIGINAL_MD5) \
		&& echo "$@ matches GBC-OS-v1.06.BIN" \
		|| (echo "$@ does NOT match GBC-OS-v1.06.BIN" && false)

clean:
	rm -rf $(BUILD_DIR)
	find . \( -iname '*.1bpp' -o -iname '*.2bpp' \) -exec rm {} +
