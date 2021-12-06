org 0x7C00
bits 16

mov ah, 0x0
mov al, 0x13
int 0x10

mov bx,0x7c00 ; Stack location
cli
mov ss,bx
mov sp,bx ; stack pointer
mov bp,bx ; base pointer
sti

cld
clc

xor ah,ah
int 0x13 ; Reset drive system
; mov bx,0x07E0
; mov es,bx
; xor bx,bx
xor bx, bx
mov es, bx
mov ah,0x2 ;function
mov al,0x2 ;sectors to read
mov ch,0x0 ;cylinder
mov cl,0x2 ;sector
mov dh,0x0 ;head
mov bx, 0x7e00 ; offset
int 0x13
jc disk_error

xor ax, ax
mov ds, ax
mov es, ax
; mov ss, ax

jmp bx
nop

; mov ax,0x4c00
; mov ds,ax
; mov es,ax

disk_error:
    xor bx,bx
    mov ax,0xa000
    mov es,ax
    mov ah,0x40 ;colour
    mov al,' ' ;character
    .red:
        cmp bx,0x0FA0
        je .end
        mov WORD [es:bx], ax
        inc bx
        jmp .red
    .end:
        cli
        hlt

times 510 - ($ - $$) db 0
db 0x55
db 0xaa