.MODEL SMALL
   .STACK 64;16
.DATA
    ARRAY DB 1,2,3,4,5,6,7,8,9,0
.CODE
    mov ax,@data        ;Inicializar los registros.
    mov ds,ax
    mov cx,10
    Ciclo:
    lea dx,ARRAY        ;Coloca el array en el DX para quedar listo para ser impreso en pantalla.
    mov ah,09h           ;Servicio del video.
    int 21h                  ;Interrupcion del D.O.S
    LOOP Ciclo            ;Se supone decrementa el CX en 1
    RET  

.exit

end 