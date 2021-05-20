BOOT_DISK: db 0
PROGRAM_SPACE equ 0x7e00 ;compile time constant pointing to the end of the program
diskReadErrorString: db 'Failed to read disk', 0

readDisk:

	mov ah, 0x02			;bios function for reading the disk
	mov bx, PROGRAM_SPACE	;where to read from
	mov al, 8				;read 8 sectors from the disk
	mov dl, [BOOT_DISK]		;drive that we want to read from
	
	mov ch, 0x00 ; hard drive specific stuff
	mov dh, 0x00 ;
	mov cl, 0x02 ;

	int 0x13

	jc .diskReadFailed
	jmp .diskReadEnd

	.diskReadFailed:

		mov bx, diskReadErrorString
		call printString
		jmp $ ;just stall execution

	.diskReadEnd:
	ret

