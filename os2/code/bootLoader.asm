BOOT_LOADER_BEGIN equ 0x7c00

[ org BOOT_LOADER_BEGIN ]
mov bp, BOOT_LOADER_BEGIN   ;here is the program loaded,
mov sp, bp		            ;so move the stack bellow it

mov ax, testString
call printString16


jmp $

;includes
%include "code/printString16.asm"

;data

testString:
db "Sus os", 0 

times 510 - ($-$$) db 0
dw 0xaa55