.model small
.stack 64
.data
msg db "mensaje$"
.code
inicio:
    mov ax, @data
    mov ds, ax

    ; Imprimir la cadena en orden inverso (de atr?s hacia adelante)
    ; Calcular la longitud de la cadena (sin contar el '$')
    mov cx, 0          ; Inicializar el contador de longitud
    mov si, 0          ; Empezar desde el inicio de la cadena

contar_longitud:
    mov al, msg[si]
    cmp al, 24h        ; Verificar si el car?cter es '$'
    je longitud_obtenida
    inc si             ; Mover al siguiente car?cter
    inc cx             ; Incrementar el contador de longitud
    jmp contar_longitud

longitud_obtenida:
    ; Configurar SI al ?ltimo car?cter v?lido (antes del '$')
    dec si

imprimir_inverso:
    mov dl, msg[si]    ; Obtener el car?cter en orden inverso
    mov ah, 02
    int 21h            ; Mostrar el car?cter en pantalla

    ; Salto de l?nea para impresi?n vertical
    mov ah, 02
    mov dl, 0ah
    int 21h

    dec si             ; Ir al car?cter anterior
    loop imprimir_inverso ; Repetir hasta que cx llegue a 0
    
    mov ah,09h
    lea dx,msg
int 21h

    ; Salto de l?nea despu?s de imprimir la cadena inversa
    mov ah, 02
    mov dl, 0ah
    int 21h

    ; Imprimir la cadena en orden normal (de adelante hacia atr?s)
    mov si, 0          ; Reiniciar SI a 0 para el recorrido normal

    
ciclo:
    mov dl, msg[si]
    cmp dl, 24h        ; Comprobar si llegamos al final de la cadena ('$')
    je fuera_ciclo

    mov ah, 02
    int 21h            ; Imprimir el car?cter actual

    ; Salto de l?nea para impresi?n vertical
    mov ah, 02
    mov dl, 0ah
    int 21h

    inc si             ; Avanzar al siguiente car?cter
    jmp ciclo

fuera_ciclo:
    ; Terminar el programa
    mov ax, 4c00h
    int 21h

end inicio