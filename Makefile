BUILD_DIR = .\bin
SRC_DIR = .\src

QEMU_WIN = c:\Users\alexn\_creativity\applications\qemu\qemu-system-x86_64.exe

all: clean
	nasm -f bin $(SRC_DIR)\bootloader.asm -o $(BUILD_DIR)\bootloader.bin 
	nasm -f bin $(SRC_DIR)\kernel.asm -o $(BUILD_DIR)\kernel.bin 

	copy /b $(BUILD_DIR)\bootloader.bin + $(BUILD_DIR)\kernel.bin $(BUILD_DIR)\os.img

clean:
	if exist ".\bin" rmdir /s /q .\bin
	mkdir .\bin

run: all
	$(QEMU_WIN) -drive file=.\bin\os.img,format=raw
