@echo off

nasm bootLoader.asm -f bin -o bootloader.bin

nasm extendedProgram.asm -f elf -o extendedProgram.o

wsl $WSLENV/x86_64-elf-gcc -ffreestanding -mno-red-zone -m64 "kernel.cpp" -o "kernel.o"

custom-ld -o kernel.tmp -Ttext 0x7e00 extendedProgram.o kernel.o

wsl objcopy -O binary kernel.tmp kernel.bin

copy /b bootLoader.bin+kernel.bin bootloader.flp 

pause