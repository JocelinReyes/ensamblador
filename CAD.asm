.model small
.stack
.data

mensaje1 db 10,13,"Ingrese mensaje: ",10,13,"$"
salto_linea db 10,13,"$"  ; Salto de l?nea
cadena db 100 dup(" "), "$"

.code
main proc
    ; Inicializar segmento de datos
    mov ax, @data
    mov ds, ax

    ; Mostrar mensaje para el usuario
    mov ah, 09h
    lea dx, mensaje1
    int 21h

    ; Leer cadena desde teclado
    mov ah, 3Fh    ; Funci?n para leer entrada
    mov bx, 00h    ; Manejar entrada est?ndar (teclado)
    mov cx, 10     ; Leer 10 caracteres
    lea dx, cadena ; Direcci?n de almacenamiento
    int 21h

    ; Imprimir salto de l?nea antes de la cadena
    mov ah, 09h
    lea dx, salto_linea ; Cargar direcci?n del salto de l?nea
    int 21h

    ; Mostrar la cadena le?da
    mov ah, 09h    ; Funci?n para mostrar salida
    lea dx, cadena ; Direcci?n de la cadena
    int 21h

    ; Terminar programa
    mov ax, 4C00h  ; Terminar con c?digo de salida 0
    int 21h

main ENDP
end main