.model small
.stack 64

.data
numero1 db 0
numero2 db 0
resultado db 0

mensaje1 db 10, 13, "Ingresa el primer numero (0-99): $"
mensaje2 db 10, 13, "Ingresa el segundo numero (0-99): $"
mensaje3 db 10, 13, "La multiplicacion es: $"
mensaje4 db 10, 13, "La division es: $"
mensaje5 db 10, 13, "El modulo es: $"
error_div db 10, 13, "Error: Division por cero.$"

.code
begin proc far
    mov ax, @data
    mov ds, ax

    ; Leer el primer n?mero
    mov ah, 09h
    lea dx, mensaje1
    int 21h
    call LeerNumero
    mov numero1, al

    ; Leer el segundo n?mero
    mov ah, 09h
    lea dx, mensaje2
    int 21h
    call LeerNumero
    mov numero2, al

    ; Calcular la multiplicaci?n
    mov al, numero1
    mov bl, numero2
    mul bl
    call MostrarResultado, mensaje3

    ; Calcular la divisi?n
    mov al, numero1
    xor ah, ah
    mov bl, numero2
    cmp bl, 0
    je .division_error
    div bl
    mov resultado, al
    call MostrarResultado, mensaje4
    jmp .fin

.division_error:
    ; Mostrar error de divisi?n
    mov ah, 09h
    lea dx, error_div
    int 21h

.fin:
    ; Salir del programa
    mov ax, 4c00h
    int 21h
endp

LeerNumero proc
    xor ax, ax
    ; Leer primer d?gito
    mov ah, 01h
    int 21h
    sub al, 30h
    mov bl, al

    ; Leer segundo d?gito si hay
    mov ah, 01h
    int 21h
    cmp al, 13
    je .fin
    sub al, 30h
    mov bh, al

    ; Reconstruir el n?mero
    mov ax, 0
    mov al, bl
    mov cx, 10
    mul cx
    add ax, bh

.fin:
    ret
LeerNumero endp

MostrarResultado proc
    ; Muestra el mensaje y el resultado
    mov ah, 09h
    lea dx, [mensaje]
    int 21h

    ; Mostrar n?mero
    mov al, resultado
    call MostrarNumero
    ret
MostrarResultado endp

MostrarNumero proc
    ; Mostrar n?mero en AL
    xor cx, cx
    xor dx, dx

    cmp al, 0
    je .zero

.next_digit:
    xor dx, dx
    mov bx, 10
    div bx
    push dx
    inc cx
    test ax, ax
    jnz .next_digit

.zero:
    cmp cx, 0
    je .display_zero

.display_digits:
    pop dx
    add dl, 30h
    mov ah, 02h
    int 21h
    loop .display_digits
    ret

.display_zero:
    mov dl, '0'
    mov ah, 02h
    int 21h
    ret
MostrarNumero endp

end begin



