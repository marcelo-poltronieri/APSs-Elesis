; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos



LOOP:
leaw $1 , %A
movw (%A),%D
leaw $0, %A
subw (%A),%D,%D
leaw $0, %A
movw %D, (%A)

leaw $2, %A
movw (%A), %D
incw %D
movw %D, (%A)

leaw $0, %A
movw (%A), %D
leaw $LOOP, %A
jge %D
nop

leaw $2, %A
movw (%A), %D
decw %D
movw %D, (%A)


