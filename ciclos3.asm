.model small       ; Se asigna el tama?o de memoria
.stack             ; Se asigna espacio para la pila
.data              ; Inicio de datos   
.code              ; Inicio del c?digo
main proc          ; Inicia procedimiento principal
    mov cx, 9      ; Inicializamos CX en 9 (para que LOOP lo decrementa)
    mov bl, 1      ; Registro BL inicia en 1 para imprimir desde 1

ciclo:
    mov ah, 02h    ; Funci?n DOS para imprimir un car?cter
    mov dl, bl     ; Mueve el valor de BL (n?mero a imprimir) a DL
    add dl, 30h    ; Convierte el valor num?rico en car?cter ASCII
    int 21h        ; Interrupci?n para imprimir el n?mero

    inc bl         ; Incrementa BL para preparar el siguiente n?mero
    loop ciclo     ; Usa el bucle LOOP, CX se decrementa autom?ticamente

    mov ax, 4C00h  ; Salir del programa
    int 21h        ; Interrupci?n para terminar

main endp          ; Termina el procedimiento
end main