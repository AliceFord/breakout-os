org 0x7C00
bits 16

mov ah, 0x0
mov al, 0x13
int 0x10

xor ax,ax
mov ds,ax
mov es,ax

mov bx,0x8000
cli
mov ss,bx
mov sp,ax
sti

cld
clc

; xor ah,ah
; int 0x13
; mov bx,0x07E0
; mov es,bx
; xor bx,bx
mov ah,0x2 ;function
mov al,0x5 ;sectors to read
mov ch,0x0 ;track
mov cl,0x2 ;sector
mov dh,0x0 ;head
int 0x13


jmp $+10

; error:
;     xor bx,bx
;     mov ax,0xa000
;     mov es,ax
;     mov ah,0x40 ;colour
;     mov al,' ' ;character
;     .red:
;         cmp bx,0x0FA0
;         je .end
;         mov WORD [es:bx], ax
;         inc bx
;         jmp .red
;     .end:
;         jmp $+10
;         cli
;         hlt

times 0x1FE - ($ - $$) db 0x0
db 0x55
db 0xAA