mov bx, successMessage
call printString

;set cursor
mov ah, 0x02
mov dl, 0x00
mov dl, 0x00
mov bh, 0x00
int 0x10

;;;;enter protected mode x8086
	call enableA20
	cli		;disable interupts
	lgdt [gdtDescriptor]
	mov eax, cr0
	or	eax, 1
	mov cr0, eax
	jmp codeSeg:startProtectedMode ;high jump to flush

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

;;;;;;;;;;;;;;;;;;;;;;;;;;
%include "cpuid.asm"
%include "paging.asm"
;;;;;;;;;;;;;;;;;;;;;;;;;;

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
	
	call detectCpuId
	call detectLongMode
	call setupIdentityPaging
	call editGDT

	jmp codeSeg : start64

[bits 64]
[extern _start]

start64:

	call clearScreen
	call _start
	jmp $
	

clearScreen:
	mov edi, 0xb8000
	mov rax, 0x0220022002200220
	mov ecx, 500
	rep stosq
	
	;mov ecx, 1200
	;.begClearTopScreen:
	;mov [0xb8000+2*ecx-2], byte ' ' ;video memory	
	;loop .begClearTopScreen

	ret


times 4096-($-$$)db 0
