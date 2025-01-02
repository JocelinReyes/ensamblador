.model small
.stack 64

.data  ; Secci?n de datos
numero1 db 0
numero2 db 0
suma db 0
resta db 0

mensaje1 db 10, 13, "Ingresa el primer numero (0-9): $"
mensaje2 db 10, 13, "Ingresa el segundo numero (0-9): $"
mensaje3 db 10, 13, "La suma es: $"
mensaje4 db 10, 13, "La resta es: $"

.code  ; Secci?n de c?digo
begin proc far

    mov ax, @data
    mov ds, ax

    ; Pedir el primer n?mero
    mov ah, 09h
    lea dx, mensaje1
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h  ; Convertir de ASCII a n?mero
    mov numero1, al

    ; Pedir el segundo n?mero
    mov ah, 09h
    lea dx, mensaje2
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h  ; Convertir de ASCII a n?mero
    mov numero2, al

    ; Calcular la suma
    mov al, numero1
    add al, numero2
    mov suma, al

    ; Calcular la resta
    mov al, numero1
    sub al, numero2
    mov resta, al

    ; Mostrar la suma
    mov ah, 09h
    lea dx, mensaje3
    int 21h
    
    ; Manejar la suma
    mov al, suma
    call MostrarNumero

    ; Mostrar la resta
    mov ah, 09h  
    lea dx, mensaje4
    int 21h
    
    ; Manejar la resta
    mov al, resta
    cmp al, 0
    jl mostrar_negativo
    call MostrarNumero
    jmp fin

mostrar_negativo:
    ; Mostrar el signo negativo
    mov dl, '-'
    mov ah, 02h
    int 21h
    ; Mostrar el valor absoluto de la resta
    mov al, resta
    neg al          ; Negar el resultado para obtener el valor absoluto
    call MostrarNumero
    jmp fin

; Procedimiento para mostrar un n?mero (de 0 a 18)
MostrarNumero proc
    ; Comprobar si el n?mero es mayor que 9
    cmp al, 9
    jg mostrar_dos_digitos

    ; Mostrar un solo d?gito
    add al, 30h      ; Convertir a ASCII
    mov ah, 02h
    int 21h
    ret

mostrar_dos_digitos:
    ; Para dos d?gitos, primero imprimir el primer d?gito
    mov bl, 10       ; Divisor para separar d?gitos
    xor ah, ah       ; Limpiar ah para la divisi?n
    div bl           ; Dividir al entre 10
    add al, 30h      ; Convertir a ASCII
    mov ah, 02h
    int 21h          ; Mostrar primer d?gito

    ; Mostrar segundo d?gito
    mov al, ah       ; El resto es el segundo d?gito
    add al, 30h      ; Convertir a ASCII
    mov ah, 02h
    int 21h          ; Mostrar segundo d?gito
    ret
MostrarNumero endp

fin:
    ; Salir del programa
    mov ax, 4c00h
    int 21h

endp ; Termina el procedimiento
end begin ; Fin del programa







