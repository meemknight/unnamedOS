printString:
	mov ah, 0x0e

	.loopPrintString:
		cmp [bx], byte 0
		je .endPrintString	;end function

		mov al, [bx]		;value at bx adress move in al
		int 0x10			;print
		inc bx				
		jmp .loopPrintString
	.endPrintString:
	ret

