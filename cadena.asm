.model small
.stack
.data

input db 10 dup(""), "$"

.code

main proc
mov ax, @data
mov ds, ax

mov ah, 3fh
mov bx, 00h
mov cx,10
mov dx, offset[input]
int 21h

mov ah,02h
mov dl, 10
int 21h

mov ah, 09h
mov dl, offset[input]
int 21h

mov ah, 01
int 21h

mov ah, 4ch
int 21h



main endp

end main
