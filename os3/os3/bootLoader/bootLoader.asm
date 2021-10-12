;tell the asembler to offset the labels
BOOT_SECTOR_START equ 0x7c00
[ org BOOT_SECTOR_START ]
mov bp, BOOT_SECTOR_START
mov sp, BOOT_SECTOR_START


mov bx, myStr
call printStr

mov bx, 0xABCD
call printHex

jmp $ ;hault execution



myStr:
db 'John Xina', 10, 13, 'Free social credit os.', 10, 13, 0


%include "bootLoader/basicUtility.asm"


;end of boot sector
times 510 - ($-$$) db 0
dw 0xAA55