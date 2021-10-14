

;input bx
printHex:
	mov [HEX_OUT+2], word 0
	mov dx, bx
	mov cx, 4

	printHexLoop1:
		mov bh, 0
		mov bl, dl
		and bl, [BOTTOM_MASK]
		mov al, [bx + HEX_TABLE]
		mov bx, cx	
		mov [bx + 1 + HEX_OUT], al
		shr dx, 4
	loop printHexLoop1	

	mov bx, HEX_OUT
	call printStr

ret
HEX_OUT: db '0x1111', 10, 13, 0
HEX_TABLE: db '0123456789ABCDEF'
BOTTOM_MASK: db 0x0F

;input bx
printStr:
	mov ah, 0x0e
	printStrLoop1:
		cmp [bx], byte 0
		je printStrExit1 
		mov al, [bx]
		int 0x10
		inc bx
		jmp printStrLoop1
	printStrExit1:
ret