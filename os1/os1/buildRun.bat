@echo off

nasm asm/bootLoader.asm -f bin -o bootloader.bin
nasm asm/extendedProgram.asm -f bin -o extendedProgram.bin
copy /b asm/bootLoader.bin+extendedProgram.bin asm/bootloader.flp 

bochsrc.bxrc