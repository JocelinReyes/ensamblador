.model small
.stack 100h
.data
    mensaje1 db "Ingresa el primer digito (0-9): $"
    mensaje2 db 10, 13, "Ingresa el segundo digito (0-9): $"
    resultado_msg db 10, 13, "El resultado es: $"
    resultado db ?          ; Aqu? se almacenar? el resultado de la resta

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

    ; Realizar la resta de los dos d?gitos
    mov al, bl             ; Mover el primer d?gito a AL
    sub al, bh             ; AL = primer_digito - segundo_digito

    ; Verificar si el resultado es negativo
    cmp al, 0
    jge positivo           ; Si el resultado es >= 0, saltar a positivo

    ; Si es negativo, convertir a positivo para mostrar el valor absoluto
    neg al                 ; AL = -AL
    mov dl, '-'            ; Preparar el signo negativo para mostrar
    mov ah, 02h            ; Mostrar el signo negativo
    int 21h

positivo:
    ; Convertir el resultado a ASCII y almacenarlo en resultado
    add al, 30h
    mov resultado, al

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