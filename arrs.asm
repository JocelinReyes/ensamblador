.model small
.stack 100h

quince equ 15
cero equ 0

.data
arreglo db 1, 2, 3, 4    ; Arreglo con valores 1, 2, 3, 4
cadena db "ISIC $", 0     ; Cadena para imprimir
var db 7                 ; No se usa en este c?digo, se puede eliminar si no es necesario
.code
main proc
    mov ax, seg @data     ; Inicializa el segmento de datos
    mov ds, ax            ; Carga el registro DS con el segmento de datos

    ; Imprime la cadena "ISIC"
    mov ah, 09h
    lea dx, cadena
    int 21h

    ; Imprime los valores del arreglo (1, 2, 3)
    mov al, arreglo[0]    ; Carga el primer valor del arreglo (1)
    mov ah, 02h
    add al, 30h           ; Convierte el n?mero a su c?digo ASCII
    mov dl, al
    int 21h

    mov al, arreglo[1]    ; Carga el segundo valor del arreglo (2)
    add al, 30h
    mov dl, al
    int 21h

    mov al, arreglo[2]    ; Carga el tercer valor del arreglo (3)
    add al, 30h
    mov dl, al
    int 21h

    mov al, arreglo[3]    ; Carga el tercer valor del arreglo (3)
    add al, 30h
    mov dl, al
    int 21h
    ; Finaliza el programa
    mov ah, 4Ch
    int 21h
main endp

end main
