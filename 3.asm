.model small
.stack
.data

mensaje1 db 10,13,7,"Ingrese Mensaje: ", "$"
cadena db 100 dup(""), "$"
.code

main proc
mov ax, SEG @data
mov ds,ax

mov ah,09h
lea dx,mensaje1
int 21h

mov ah,3fh
mov bx,00
mov cx,10
mov dx,offset[cadena]
int 21h

mov ah,09h
mov dx,offset[cadena]
int 21h

mov ax,4c00h
int 21h

main endp
end main