.model small
.stack 64
.data
msg db "mensaje$"  ; Cadena original con terminaci?n de '$'
.code
inicio:
    mov ax, @data
    mov ds, ax

    ; Imprimir el mensaje original
    mov ah, 09
    mov dx, offset msg
    int 21h

    ; Salto de l?nea despu?s del mensaje original
    mov ah, 02
    mov dl, 0Ah
    int 21h

    mov ah, 02
    mov dl, 0Dh
    int 21h

    ; Encuentra la longitud de la cadena
    mov cx, 0  ; Usaremos CX para contar la longitud
    mov si, offset msg
cuenta:
    cmp byte ptr [si], '$'  ; Verifica el final de la cadena
    je imprime_al_reves
    inc si
    inc cx
    jmp cuenta

imprime_al_reves:
    dec si  ; Retrocede a la ?ltima letra (antes del '$')
ciclo_inverso:
    cmp cx, 0  ; Verifica si ya imprimi? todos los caracteres
    je fin

    mov dl, [si]  ; Mueve el car?cter actual a DL
    mov ah, 02
    int 21h       ; Imprime el car?cter

    ; Salto de l?nea despu?s de cada letra
    mov ah, 02
    mov dl, 0Ah
    int 21h
    mov ah, 02
    mov dl, 0Dh
    int 21h

    dec si        ; Mueve el puntero a la izquierda
    dec cx        ; Decrementa la longitud
    jmp ciclo_inverso

fin:
    ; Terminar el programa
    mov ax, 4c00h
    int 21h

end inicio
