; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.


; Inicializa o fatorial como 1
movw $1, %D  ; Armazena o valor 1 em %D

; Armazena o valor do fatorial em memória (RAM[1])
leaw $1, %A  ; Endereço de memória onde o fatorial será armazenado
movw %D, (%A)  ; Armazena o valor inicial do fatorial em memória

; Inicia o loop para calcular o fatorial
LOOP:
    ; Carrega o valor atual do número em %D
    leaw $0, %A  ; Endereço de memória do número atual
    movw (%A), %D  ; Carrega o valor atual do número em %D

    ; Verifica se o número atual é zero
    je %D
    nop  ; Se o número atual for zero, termina o loop

    ; Inicializa o multiplicador como 1
    movw $1, %A  ; Armazena o valor 1 em %A (multiplicador)

    ; Inicializa o resultado da multiplicação como 1
    movw $1, %D  ; Armazena o valor 1 em %D (resultado da multiplicação)

    ; Verifica se o multiplicador é maior que zero
    jle %D
    nop  ; Se o multiplicador for menor ou igual a zero, termina o loop de multiplicação

    ; Multiplica o valor atual do fatorial pelo multiplicador e armazena em %D
    movw %D, %A  ; Move o valor atual do fatorial para %A
    addw %D, %A, %D  ; Dobra o valor de %A e armazena em %D (fatorial * 2)
    decw %A  ; Decrementa %A em 1 (fatorial * 2 - 1)

    ; Decrementa o multiplicador em 1
    decw %A  ; Decrementa o multiplicador em 1

    ; Pula de volta para o início do loop de multiplicação
    jmp
    nop


    ; Armazena o resultado da multiplicação em memória (RAM[1])
    leaw $1, %A  ; Endereço de memória onde o fatorial está armazenado
    movw %D, (%A)  ; Armazena o resultado da multiplicação em memória

    ; Decrementa o número atual em 1
    decw (%A)  ; Decrementa o valor do número atual em memória

    ; Pula de volta para o início do loop
    jmp
    nop