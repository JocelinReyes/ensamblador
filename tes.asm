.model small
.stack
.data
mensaje db "Tecnologico de estudios superiores de jilotepec", "$"
.code
main proc
mov ax, SEG @data
mov ds, ax
mov ah, 09
lea dx, mensaje
int 21h
mov ax, 4c00h
int 21h
main endp
end main