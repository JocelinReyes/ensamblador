.model small
.stack 100h
.data
    mensaje1 db "Ingresa el primer d?gito (0-9): $"
    mensaje2 db 10, 13, "Ingresa el segundo d?gito (0-9): $"
    mult_msg db 10, 13, "Multiplicaci?n: $"
    div_msg db 10, 13, "Divisi?n: $"
    mod_msg db 10, 13, "M?dulo: $"
    resultado db ?              ; Para almacenar un solo car?cter resultado
    resultado_mult db "00$"     ; Cadena para resultado de la multiplicaci?n (2 d?gitos + fin de cadena)

.code
main proc
    ; Inicializar el segmento de datos
    mov ax, @data
    mov ds, ax

    ; Leer el primer n?mero
    mov ah, 09h
    lea dx, mensaje1
    int 21h
    mov ah, 01h                ; Leer un car?cter desde el teclado
    int 21h
    sub al, 30h                ; Convertir de ASCII a n?mero (0-9)
    mov bl, al                 ; Guardar el primer d?gito en BL

    ; Leer el segundo n?mero
    mov ah, 09h
    lea dx, mensaje2
    int 21h
    mov ah, 01h                ; Leer un car?cter desde el teclado
    int 21h
    sub al, 30h                ; Convertir de ASCII a n?mero (0-9)
    mov bh, al                 ; Guardar el segundo d?gito en BH

    ; Multiplicaci?n
    mov al, bl                 ; Primer n?mero en AL
    mul bh                     ; AL = AL * BH (resultado en AX)
    
    ; Convertir el resultado de multiplicaci?n en AX a ASCII
    mov resultado_mult[0], ah  ; Guardar decenas en el primer lugar de resultado_mult
    mov resultado_mult[1], al  ; Guardar unidades en el segundo lugar de resultado_mult
    add resultado_mult[0], 30h ; Convertir decenas a ASCII
    add resultado_mult[1], 30h ; Convertir unidades a ASCII

    ; Mostrar el resultado de la multiplicaci?n
    mov ah, 09h
    lea dx, mult_msg
    int 21h
    lea dx, resultado_mult
    int 21h

    ; Divisi?n
    mov al, bl                 ; Primer n?mero en AL
    mov ah, 0                  ; Limpiar AH para la divisi?n
    div bh                     ; AX / BH, cociente en AL, residuo en AH
    add al, 30h                ; Convertir cociente a ASCII
    mov resultado, al

    ; Mostrar el resultado de la divisi?n
    mov ah, 09h
    lea dx, div_msg
    int 21h
    mov ah, 02h
    mov dl, resultado
    int 21h

    ; M?dulo
    mov dl, ah                 ; El residuo (m?dulo) est? en AH
    add dl, 30h                ; Convertir a ASCII
    mov resultado, dl

    ; Mostrar el resultado del m?dulo
    mov ah, 09h
    lea dx, mod_msg
    int 21h
    mov ah, 02h
    mov dl, resultado
    int 21h

    ; Salir del programa
    mov ax, 4C00h
    int 21h
main endp
end main