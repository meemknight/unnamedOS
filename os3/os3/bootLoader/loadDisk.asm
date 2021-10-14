



readDisk:
	mov ah, 0x02; BIOS read sector function
	mov bx, PROGRAM_SPACE;where to read
	mov al, SECTORS_TO_READ;how much to read
	mov dl, [BOOT_DRIVE]
	mov ch, 0x00; 0 cylinder
	mov dh, 0x00; 0 track
	mov cl, 0x02; 2nd sector
	int 0x13

	jc diskReadFailLabl
	;cmp al, SECTORS_TO_READ
	;jne diskReadFailLabl

ret



;this is 512 bytes after 0x7c00 (so after the boot loader)
PROGRAM_SPACE equ 0x7e00
SECTORS_TO_READ equ 4

BOOT_DRIVE:
	db 0

DISK_READ_ERROR_STRING:
	db 'Disk read failed', 10, 13, 0

diskReadFailLabl:
	mov bx, DISK_READ_ERROR_STRING
	call printStr
	jmp $ ;hault execution

