ASM=nasm
SRC=src
BUILD=build


#
# floppy disk
#
floppy_img: $(BUILD)/main_floppy.img

$(BUILD)/main_floppy.img: bootloader kernel
	dd if=/dev/zero of=$(BUILD)/main_floppy.img bs=512 count=2880
	mkfs.fat -F 12 -n "FTMOS" $(BUILD)/main_floppy.img
	dd if=$(BUILD)/boot.bin of=$(BUILD)/main_floppy.img conv=notrunc
	mcopy -i $(BUILD)/main_floppy.img $(BUILD)/kernel.bin "::kernel.bin"

#
# bootloader rule
#
bootloader: $(BUILD)/boot.bin

$(BUILD)/boot.bin: $(SRC)/bootloader/boot.asm
	$(ASM) $(SRC)/bootloader/boot.asm -f bin -o $(BUILD)/boot.bin


#
# kernel rule
#
kernel: $(BUILD)/kernel.bin

$(BUILD)/kernel.bin: $(SRC)/kernel/main.asm
	$(ASM) $(SRC)/kernel/main.asm -f bin -o $(BUILD)/kernel.bin



clean:
	rm -r $(BUILD)/*


.PHONY: clean bootloader kernel floppy_img
