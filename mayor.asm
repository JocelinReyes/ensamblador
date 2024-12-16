.model small ; se asigna tamano de memoria
.stack ;modelo de pila
.data ;nicio de datos
x db 10
y db 5
mensaje db 10, 13, 7, "Numero menor. ", "$"
mensaje2 db 10, 13, 7, "Numero Mayor. ", "$"
.code ;inicio de codigo

main proc ;inicia el proceso inicila
mov al,x
mov bl,y
cmp al,bl
jg mayor

mayor:
mov ax, SEG @data
mov ds,ax
mov ah,09h
lea dx,mensaje2
int 21h
jmp fin

menor:
mov ax, SEG @data
mov ds,ax
mov ah,09h
lea dx,mensaje 
int 21h
jmp fin

fin:
mov ax, 4c00h
int 21h
main endp
end main