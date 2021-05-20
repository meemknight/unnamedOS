[org 0x7e00]

mov bx, successMessage
call printString

;;;;;;;; end of program ;;;
jmp $
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;include shit;;;;;;;;;;;;;
%include "print.asm"
;;;;;;;;;;;;;;;;;;;;;;;;;;

;.data;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
successMessage: db 'Successfully loaded sectors', 10, 13, 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

times 4096-($-$$)db 0