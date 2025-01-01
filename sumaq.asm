.model small
.stack 100h

.data
arreglo_a db 1, 2, 3, 4      ; Arreglo A con los n?meros 1, 2, 3, 4
arreglo_b db 5, 6, 7, 8      ; Arreglo B con los n?meros 5, 6, 7, 8
cadena db "Resultado de la suma: $", 0 ; Mensaje a imprimir

.code
main proc
    ; Inicializar el segmento de datos
    mov ax, seg @data
    mov ds, ax

    ; Imprimir la cadena "Resultado de la suma: "
    mov ah, 09h
    lea dx, cadena
    int 21h

    ; Sumar los elementos de los arreglos A y B
    ; Para cada ?ndice del arreglo (0, 1, 2, 3)
    mov si, 0          ; SI es el ?ndice del arreglo

suma_loop:
    ; Cargar los elementos de arreglo_a y arreglo_b
    mov al, arreglo_a[si]   ; Cargar el valor de arreglo_a[si]
    mov bl, arreglo_b[si]   ; Cargar el valor de arreglo_b[si]
    
    ; Sumar los elementos
    add al, bl              ; Sumar al y bl (al = arreglo_a[si] + arreglo_b[si])

    ; Comprobar si el n?mero es menor que 10
    cmp al, 10
    jl print_single_digit    ; Si es menor que 10, imprimimos un solo d?gito

    ; Si el n?mero es mayor o igual que 10 (es un n?mero de dos d?gitos)
    ; Separamos el n?mero en decenas y unidades
    mov ah, 0               ; Limpiamos ah
    mov dl, al              ; Copiamos el n?mero al registro dl
    div byte ptr 10         ; Dividimos al (que contiene el n?mero) entre 10
                             ; AL contiene el cociente (decenas), DL contiene el residuo (unidades)
    
    ; Imprimir la decena (el valor en AL)
    add al, 30h             ; Convertir a ASCII
    mov dl, al
    mov ah, 02h
    int 21h                 ; Imprimir el primer d?gito (decena)

    ; Imprimir la unidad (el valor en DL)
    add dl, 30h             ; Convertir a ASCII
    mov ah, 02h
    int 21h                 ; Imprimir el segundo d?gito (unidad)

    jmp next_number         ; Continuamos con el siguiente n?mero

print_single_digit:
    ; Si el n?mero es menor que 10, solo imprimimos un d?gito
    add al, 30h             ; Convertir a ASCII
    mov dl, al
    mov ah, 02h
    int 21h                 ; Imprimir el n?mero

next_number:
    ; Imprimir un espacio para separar los resultados
    mov dl, ' '             ; Cargar el espacio en dl
    mov ah, 02h
    int 21h                 ; Mostrar el espacio

    ; Incrementar el ?ndice
    inc si
    cmp si, 4               ; Comparar si hemos procesado todos los elementos (4 elementos)
    jl suma_loop            ; Si no, continuar con el siguiente ?ndice

    ; Finalizar el programa
    mov ah, 4Ch
    int 21h
main endp

end main

