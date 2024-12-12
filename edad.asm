.model small
.stack 100h
.data
    nombre1 db 20 dup(0)         ; Buffer para el nombre de la primera persona
    edad1 db 3 dup(0)            ; Buffer para la edad de la primera persona
    nombre2 db 20 dup(0)         ; Buffer para el nombre de la segunda persona
    edad2 db 3 dup(0)            ; Buffer para la edad de la segunda persona
    mensaje_mayor db 10, 13, "La primera persona es mayor.", "$"
    mensaje_menor db 10, 13, "La segunda persona es mayor.", "$"
    mensaje_igual db 10, 13, "Ambas personas tienen la misma edad.", "$"
    prompt_nombre1 db 10, 13, "Introduce el nombre de la primera persona: ", "$"
    prompt_edad1 db 10, 13, "Introduce la edad de la primera persona: ", "$"
    prompt_nombre2 db 10, 13, "Introduce el nombre de la segunda persona: ", "$"
    prompt_edad2 db 10, 13, "Introduce la edad de la segunda persona: ", "$"

.code
main proc
    ; Inicializar el segmento de datos
    mov ax, @data
    mov ds, ax

    ; Pedir el nombre de la primera persona
    mov ah, 09h
    lea dx, prompt_nombre1
    int 21h
    mov ah, 0Ah               ; Leer cadena de caracteres
    lea dx, nombre1
    int 21h

    ; Pedir la edad de la primera persona
    mov ah, 09h
    lea dx, prompt_edad1
    int 21h
    mov ah, 0Ah               ; Leer cadena de caracteres
    lea dx, edad1
    int 21h

    ; Pedir el nombre de la segunda persona
    mov ah, 09h
    lea dx, prompt_nombre2
    int 21h
    mov ah, 0Ah               ; Leer cadena de caracteres
    lea dx, nombre2
    int 21h

    ; Pedir la edad de la segunda persona
    mov ah, 09h
    lea dx, prompt_edad2
    int 21h
    mov ah, 0Ah               ; Leer cadena de caracteres
    lea dx, edad2
    int 21h

    ; Convertir la edad de la primera persona de ASCII a n?mero
    mov si, 1               ; Offset de la edad en edad1
    xor ax, ax              ; Limpiar AX

convertir_edad1:
    mov bl, [edad1 + si]    ; Cargar el car?cter de la edad
    cmp bl, 0Dh             ; Comprobar si es retorno
    je fin_convertir_edad1
    sub bl, '0'             ; Convertir de ASCII a n?mero
    mov cl, 10              ; Multiplicador para posici?n decimal
    mul cl                  ; Multiplicar AX por 10
    add ax, bx              ; Sumar el nuevo d?gito
    inc si                  ; Siguiente d?gito
    jmp convertir_edad1

fin_convertir_edad1:
    mov bx, ax              ; Guardar edad1 en BX

    ; Convertir la edad de la segunda persona de ASCII a n?mero
    mov si, 1               ; Offset de la edad en edad2
    xor ax, ax              ; Limpiar AX

convertir_edad2:
    mov bl, [edad2 + si]    ; Cargar el car?cter de la edad
    cmp bl, 0Dh             ; Comprobar si es retorno
    je fin_convertir_edad2
    sub bl, '0'             ; Convertir de ASCII a n?mero
    mov cl, 10              ; Multiplicador para posici?n decimal
    mul cl                  ; Multiplicar AX por 10
    add ax, bx              ; Sumar el nuevo d?gito
    inc si                  ; Siguiente d?gito
    jmp convertir_edad2

fin_convertir_edad2:
    cmp ax, bx              ; Comparar las edades
    je edades_iguales       ; Si son iguales, saltar
    jg edad1_mayor         ; Si edad1 es mayor, saltar
   
    ; Si la edad2 es mayor
    mov ah, 09h
    lea dx, mensaje_menor
    int 21h
    jmp fin

edad1_mayor:
    mov ah, 09h
    lea dx, mensaje_mayor
    int 21h
    jmp fin

edades_iguales:
    mov ah, 09h
    lea dx, mensaje_igual
    int 21h

fin:
    mov ax, 4C00h
    int 21h
main endp
end main

