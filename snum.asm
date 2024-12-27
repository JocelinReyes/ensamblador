.model small
.stack
.data
 num1 db 0
 num2 db 0
 resultado db 0
 resultado_resta db 0       ; Variable para almacenar el resultado de la resta
 mensaje db 10, 13, "Primer numero (dos digitos): $"
 mensaje2 db 10, 13, "Segundo numero (dos digitos): $"
 mensaje3 db 10, 13, "La suma es: $"
 mensaje4 db 10, 13, "La resta es: $"
 nueva_linea db 10, 13, "$"
.code
main proc
 mov ax, @data
 mov ds, ax
 ; Solicitar primer n?mero de dos d?gitos
 mov ah, 09h
 lea dx, mensaje
 int 21h
 ; Leer el primer d?gito del primer n?mero
 mov ah, 01h
 int 21h
 sub al, 30h ; Convertir car?cter a n?mero
 mov bl, al ; Guardar el primer d?gito en bl
 ; Leer el segundo d?gito del primer n?mero
 mov ah, 01h
 int 21h
 sub al, 30h ; Convertir car?cter a n?mero
 mov bh, al ; Guardar el segundo d?gito en bh
 ; Calcular num1 = (primer_digito * 10) + segundo_digito
 mov al, bl
 mov ah, 0
 mov cl, 10
 mul cl ; Multiplicar por 10
 add al, bh ; Sumar el segundo d?gito
 mov num1, al ; Guardar el n?mero final en num1
 ; Solicitar segundo n?mero de dos d?gitos
 mov ah, 09h
 lea dx, mensaje2
 int 21h
 ; Leer el primer d?gito del segundo n?mero
 mov ah, 01h
 int 21h
 sub al, 30h ; Convertir car?cter a n?mero
 mov bl, al ; Guardar el primer d?gito en bl
 ; Leer el segundo d?gito del segundo n?mero
 mov ah, 01h
 int 21h
 sub al, 30h ; Convertir car?cter a n?mero
 mov bh, al ; Guardar el segundo d?gito en bh
 ; Calcular num2 = (primer_digito * 10) + segundo_digito
 mov al, bl
 mov ah, 0
 mul cl ; Multiplicar por 10
 add al, bh ; Sumar el segundo d?gito
 mov num2, al ; Guardar el n?mero final en num2

 ; Sumar num1 y num2
 mov al, num1
 add al, num2
 mov resultado, al ; Guardar la suma en resultado
 ; Mostrar el mensaje de la suma
 mov ah, 09h
 lea dx, mensaje3
 int 21h
 ; Preparar para mostrar el resultado
 mov al, resultado ; Cargar resultado en AL
 xor ah, ah ; Limpiar AH para que AX tenga solo el resultado
 cmp al, 0 ; Verificar si el resultado es cero
 je mostrar_cero
 ; Convertir a caracteres ASCII
 mov bx, 10 ; Divisor
 xor cx, cx ; Limpiar CX para contar los d?gitos
convertir:
 xor dx, dx ; Limpiar DX antes de dividir
 div bx ; Dividir AX entre 10
 push dx ; Guardar el residuo (d?gito)
 inc cx ; Incrementar el contador de d?gitos
 test ax, ax ; Verificar si AX es cero
 jnz convertir ; Repetir hasta que AX sea cero
 ; Mostrar los d?gitos en orden
mostrar_digitos:
 pop dx ; Obtener el d?gito
 add dl, 30h ; Convertir a ASCII
 mov ah, 02h
 int 21h ; Mostrar d?gito
 loop mostrar_digitos ; Repetir para todos los d?gitos

 ; Resta num1 - num2
 mov al, num1
 sub al, num2
 mov resultado_resta, al ; Guardar la resta en resultado_resta
 ; Mostrar el mensaje de la resta
 mov ah, 09h
 lea dx, mensaje4
 int 21h
 ; Preparar para mostrar el resultado de la resta
 mov al, resultado_resta ; Cargar resultado_resta en AL
 xor ah, ah ; Limpiar AH para que AX tenga solo el resultado
 cmp al, 0 ; Verificar si el resultado es cero
 je mostrar_cero_resta
 ; Convertir a caracteres ASCII
 mov bx, 10 ; Divisor
 xor cx, cx ; Limpiar CX para contar los d?gitos
convertir_resta:
 xor dx, dx ; Limpiar DX antes de dividir
 div bx ; Dividir AX entre 10
 push dx ; Guardar el residuo (d?gito)
 inc cx ; Incrementar el contador de d?gitos
 test ax, ax ; Verificar si AX es cero
 jnz convertir_resta ; Repetir hasta que AX sea cero
 ; Mostrar los d?gitos en orden
mostrar_digitos_resta:
 pop dx ; Obtener el d?gito
 add dl, 30h ; Convertir a ASCII
 mov ah, 02h
 int 21h ; Mostrar d?gito
 loop mostrar_digitos_resta ; Repetir para todos los d?gitos
 jmp fin

mostrar_cero_resta:
 ; Mostrar "0"
 mov dl, '0'
 mov ah, 02h
 int 21h

mostrar_cero:
 ; Mostrar "0"
 mov dl, '0'
 mov ah, 02h
 int 21h

fin:
 ; Nueva l?nea
 mov ah, 09h
 lea dx, nueva_linea
 int 21h
 ; Terminar el programa
 mov ax, 4C00h
 int 21h
main endp
end main