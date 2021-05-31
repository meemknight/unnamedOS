

printString16:    
    pusha

        mov bx, ax
        mov ah, 0x0e
        
        _loopPrintString16:

        cmp [bx], byte 0
        je _exitPrintString16 

        mov al, [bx]
        int 0x10
        inc bx
        
        jmp _loopPrintString16
        _exitPrintString16:

    popa
    ret