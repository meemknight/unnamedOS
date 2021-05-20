
gdtBegin:

gdtNullDesc:
	dd 0
	dd 0

gdtCodeDesc:
	dw 0xFFFF	;entire span of memory
	dw 0x0000	;base, the beginning of the memory adress
	db 0x00		;base next part of base
	db 10011010b	;valid sector, 
					;highest privilege, 1 for code secment, 1 executable bit, 
	db 11001111b	;granularity(4kb blocks), size(32)
	db 0x00

gdtDataDesc:
	dw 0xFFFF	;entire span of memory
	dw 0x0000	;base, the beginning of the memory adress
	db 0x00		;base next part of base
	db 10010010b	;valid sector, 
					;highest privilege, 1 for code secment, 0 executable bit, 
	db 11001111b	;granularity(4kb blocks), size(32)
	db 0x00

gdtEnd:

gdtDescriptor:
	gdtSize:
		dw gdtEnd - gdtBegin - 1
		dd gdtNullDesc

codeSeg equ gdtCodeDesc - gdtBegin
dataSeg equ gdtDataDesc - gdtBegin