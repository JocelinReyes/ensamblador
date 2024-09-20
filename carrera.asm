.model small
.stack
.data
mensaje db "Tecnologico de estudios superiores de jilotepec", "$"
mensaje2 db 10,13, "Ingeneria en sustemas computacionales" , "$"
.code
main proc
mov ax, SEG @data
mov ds, ax
mov ah, 09
lea dx, mensaje
int 21h
mov ah, 09
lea dx, mensaje2
int 21h
mov ax, 4c00h
int 21h
main endp
end main