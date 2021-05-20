;configure stack;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
[org 0x7c00]			;set the origin of the program here so calculate offsets corectly
mov bp, 0x7c00			;here is the program loaded,
mov sp, bp				;so move the stack bellow it
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;.code

mov [BOOT_DISK], dl		;the disk number is moved in dl by the bios

mov bx, outputString
call printString

call readDisk


;go to disk;;;;;;;
jmp PROGRAM_SPACE
;;;;;;;;;;;;;;;;;;


;include shit;;;;;;;;;;;;;
%include "print.asm"
%include "diskRead.asm"
;;;;;;;;;;;;;;;;;;;;;;;;;;

;.data;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
outputString: db 'Hello from unnamed os', 10, 13, 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;make file bootable;;;;;;;;;;;;;;;;;;;;;;;
times 510-($-$$) db 0	;declare byte 0
dw 0xaa55				;bootable
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
