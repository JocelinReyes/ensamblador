CR EQU 13 ; constate cr (Retorno de acarreo) en decimal o
LF EQU 10 ;  Constante LF (Salto de linea) en hex es igual
DATOS SEGMENT ;DECALARAMOS LOS DATOS A IMPRIMIR
    LINEA1 DB CR,LF,'Jocelin Reyes Rodriguez', CR,LF,'$'
    LINEA2 DB CR,LF,'Tecnologico de estudios superiores de Jilotepec', CR,LF,'$'
    LINEA3 DB CR,LF,'Ingeneria en sistemas computacionales', CR,LF,'$'
    LINEA4 DB CR,LF,'Yoshi', CR,LF,'$'
DATOS ENDS ; CERRAMOS LA DECLARACIONN DE LOS DATOS
PILA SEGMENT STACK 
    DB 64 DUP('PILA');inicializacion de la pila
PILA ENDS
CODIGO SEGMENT
    LN PROC FAR
    ASSUME CS:CODIGO,DS:DATOS,SS:PILA
    MOV AX,DATOS ; ax= direccion del segmento de datos
    MOV DS,AX ; ds=ax indicar el segmento de datos
    LEA DX, LINEA1 ;ds : dx= direccion del mensaje
    CALL ESCRIBE ;llamar al procedimiento Escribe
    LEA DX,LINEA2
    CALL ESCRIBE
    LEA DX, LINEA3
    CALL ESCRIBE
    LEA DX, LINEA4
    CALL ESCRIBE
    MOV AX,4C00H ; Funcion para terminal el programa 
    INT 21H ; y volver al DOS
    LN ENDP
ESCRIBE PROC
    MOV AH,9
    INT 21H
    RET
ESCRIBE ENDP
CODIGO ENDS
END LN