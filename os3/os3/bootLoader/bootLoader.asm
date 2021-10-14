;tell the asembler to offset the labels
BOOT_SECTOR_START equ 0x7c00
[ org BOOT_SECTOR_START ]
mov bp, BOOT_SECTOR_START
mov sp, BOOT_SECTOR_START
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;this is the boot drive
mov [BOOT_DRIVE], dl



mov bx, myStr
call printStr

call readDisk


jmp PROGRAM_SPACE ;jump to extended program space


myStr:
db 'John Xina', 10, 13, 'Free social credit os.', 10, 13, 0


%include "bootLoader/basicUtility.asm"
%include "bootLoader/loadDisk.asm"


;end of boot sector
times 510 - ($-$$) db 0
dw 0xAA55