;tell the asembler to offset the labels
PROGRAM_SPACE equ 0x7e00
[ org PROGRAM_SPACE ]
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;enter 32 bit protected mode

cli ;disable interupts
call enableA20Line ;enable a20 line
lgdt [gdt_descriptor] ;load gdt
mov eax, cr0 ;start 32 bit mode
or  eax, 0x1
mov cr0, eax
jmp CODE_SEG:protected_mode_start;flush cpu pipeline



enableA20Line:
	in al, 0x92
	or al, 2
	out 0x92, al
ret

%include "bootLoader/gtdDescriptor.asm"

[bits 32]
protected_mode_start:
mov ax, DATA_SEG
mov ds, ax
mov ss, ax
mov es, ax
mov fs, ax
mov gs, ax
mov ebp, 0x90000; stack
mov esp, ebp

mov [0xb8000], byte 'H'
mov [0xb8002], byte 'e'
mov [0xb8004], byte 'l'
mov [0xb8006], byte 'l'
mov [0xb8008], byte 'o'

jmp $ ;hault execution



times 2048-($-$$)db 0