@echo off

nasm bootLoader.asm -f bin -o bootloader.bin
nasm extendedProgram.asm -f bin -o extendedProgram.bin

copy /b bootLoader.bin+extendedProgram.bin bootloader.flp 

bochsrc.bxrc