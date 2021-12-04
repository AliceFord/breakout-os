org 0x7C00
bits 16

error:
    xor bx,bx
    mov ax,0xa000
    mov es,ax
    mov ah,0x40 ;colour
    mov al,' ' ;character
    .red:
        cmp bx,0x1FA0
        je .end
        mov WORD [es:bx], ax
        inc bx
        jmp .red
    .end:
        cli
        jmp $
        hlt