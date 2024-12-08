.model small ;Se asigna el tama?o de memoria
.stack ;Modelo de Pila
.data ;Inicio de datos

.code ; inicio de codigo
main proc; inicia proceso principal
mov cx, 9
ciclo:

mov ah, 02
mov dx, cx
add dx, 30h
int 21h

loop ciclo

mov ax, 4c00h
int 21h
main endp
end main