.model small
.stack 100h
.data
    mensaje1 db "Ingresa el primer digito (0-9): $"
    mensaje2 db 10, 13, "Ingresa el segundo digito (0-9): $"
    resultado_msg db 10, 13, "El resultado es: $"
    resultado db ?          ; Aqu? se almacenar? el resultado de la suma

.code
main proc
    ; Inicializar el segmento de datos
    mov ax, @data
    mov ds, ax

    ; Mostrar el mensaje y leer el primer d?gito
    mov ah, 09h
    lea dx, mensaje1
    int 21h
    mov ah, 01h            ; Leer un car?cter desde el teclado
    int 21h
    sub al, 30h            ; Convertir de ASCII a n?mero (0-9)
    mov bl, al             ; Almacenar el primer d?gito en BL

    ; Mostrar el mensaje y leer el segundo d?gito
    mov ah, 09h
    lea dx, mensaje2
    int 21h
    mov ah, 01h            ; Leer un car?cter desde el teclado
    int 21h
    sub al, 30h            ; Convertir de ASCII a n?mero (0-9)
    mov bh, al             ; Almacenar el segundo d?gito en BH

    ; Sumar los dos d?gitos
    add bl, bh             ; BL = primer_digito + segundo_digito
    mov al, bl             ; Mover el resultado a AL
    add al, 30h            ; Convertir de n?mero a ASCII
    mov resultado, al      ; Almacenar el resultado en la variable resultado

    ; Mostrar el mensaje de resultado
    mov ah, 09h
    lea dx, resultado_msg
    int 21h

    ; Mostrar el resultado en pantalla
    mov ah, 02h
    mov dl, resultado
    int 21h

    ; Salir del programa
    mov ax, 4C00h
    int 21h
main endp
end main