; Arquivo: Abs.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; faz uma subtracao binaria do valor de :  RAM[1] - RAM[0] gravando em RAM[2].


leaw $1,%A         ; Carrega a constante 1 em %A (endereço de RAM[1])
movw (%A),%D      ; Move o valor de RAM[1] para %D 
leaw $0,%A         ; Carrega a constante 0 em %A (endereço de RAM[0])
subw %D, (%A), %D  ; 
leaw $2, %A        ; Carrega a constante 2 em %A (endereço de RAM[2])
movw %D, (%A)      ; Copia o valor de %D para RAM[2]
