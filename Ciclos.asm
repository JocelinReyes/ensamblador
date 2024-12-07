.model small ;Se asigna el tama?o de memoria
.stack ;Modelo de Pila
.data ;Inicio de datos
mensaje db " Tecnologico de Estudios Superiores de Jilotepec ", "$";Se introduce cadena
mensaje2 db 10,13," Ingenieria en Sistemas Computacionales ","$"
mensaje3 db "                                            ","$"
.code ;Inicio del codigo
main proc ;Inicia proceso inicial
mov cx, 5
ciclo:
mov ax,SEG @data ;Se asigna la localizacion del segmento de datos
mov ds,ax ;Coloca los datos contenidos en ax en el segmento de datos
mov ah,09 ;Se imprime la cadena
lea dx,mensaje; Leer mensaje
int 21h ;Funcion de interrumpcion que invoca al DOS

mov ah,09

lea dx,mensaje3
int 21h

mov ah,09

lea dx,mensaje2

int 21h

loop ciclo

mov ax,4c00h ;Salir del programa
int 21h
main endp;Termina procedimiento
end main