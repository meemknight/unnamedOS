@echo off

nasm bootLoader/bootLoader.asm -f bin -o out/bootLoader.bin

nasm extendedMemory/extendedProgram.asm -f bin -o out/extendedProgram.bin

copy /b "out\bootLoader.bin"+"out\extendedProgram.bin" "out\bootLoader.flp"