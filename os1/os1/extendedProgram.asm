[org 0x7e00]

mov bx, successMessage
call printString

;;;;enter protected mode x8086
	call enableA20
	cli		;disable interupts
	lgdt [gdtDescriptor]
	mov eax, cr0
	or	eax, 1
	mov cr0, eax
	jmp codeSeg:startProtectedMode

;include shit;;;;;;;;;;;;;
%include "print.asm"
%include "gdt.asm"
;;;;;;;;;;;;;;;;;;;;;;;;;;

enableA20:
	in al, 0x92
	or al, 2
	out 0x92, al
	ret

;.data;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
successMessage: db 'Successfully loaded sectors', 10, 13, 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[bits 32]
startProtectedMode:
	
	mov ax, dataSeg
	mov ds, ax
	mov ss, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	;optionally move stack
	;mov ebp 0x90000
	;mov esp ebp

	mov [0xb8000], byte 'H' ;video memory

	jmp $


times 4096-($-$$)db 0