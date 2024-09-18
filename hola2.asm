CR EQU 13; constate cr (Retorno de acarreo) en decimal o
LF EQU 10;  Constante LF (Salto de linea) en hex es igual
Datos Segment
    Mensaje db CR,LF, 'Hola Mundo! (con Funcion o Procedimiento)', CR,LF,'$'
Datos Ends
Pila Segment Stack
    db 64 DUP('PILA') ;inicializacion de la pila
Pila ends
Codigo Segment
    holam3 proc far
    Assume CS:Codigo, DS:Datos, SS:Pila
    mov ax,Datos; ax= direccion del segmento de datos
    mov ds,ax ; ds=ax indicar el segmento de datos
    lea dx, Mensaje ;ds : dx= direccion del mensaje
    call Escribe ;llamar al procedimiento Escribe
    mov ax, 4c00h ; Funcion para terminal el programa 
    int 21h; y volver al DOS
    holam3 endp
Escribe proc; Inicio procesamiento Escribe
    mov ah,9; funcion dos para escribir texto en pantalla 
    int 21h ; llamar a la interrupcion del dos
    ret ; colver a retornar
Escribe endp; Fin del procedimiento Escribe

Codigo Ends
End holam3