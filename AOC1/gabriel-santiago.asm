# gabriel-santiago
# 11621BCC015

.data
    Num1: .asciiz "Digite o primeiro numero: "
    Num2: .asciiz "Digite o segundo numero: "
    RMul: .asciiz "Num1 x Num2 = "
    RDivInt: .asciiz "\nParte Inteira de Num1 / Num2 = "
    RResto: .asciiz "\nResto inteiro de Num1 / Num2 = " 

.text 
    # Operacoes de leitura para o Num1 
    li $v0,4
    la $a0,Num1
    syscall
    li $v0,5
    syscall
    move $t0, $v0

    # Operacoes de leitura para o Num2 
    li $v0,4
    la $a0,Num2
    syscall
    li $v0,5
    syscall
    move $t1,$v0

    # Multiplicacao
    mul  $t2, $t0, $t1

    # Divisao Inteira
    div $t0, $t1
    mflo $t3

    # Resto da Divisao
    div $t0, $t1
    mfhi $t4

    # Imprime Multiplicacao
    li $v0,4
    la $a0,RMul
    syscall
    li $v0,1
    move $a0, $t2
    syscall

    # Imprime Divisao
    li $v0,4
    la $a0,RDivInt
    syscall
    li $v0,1
    move $a0, $t3
    syscall

    # Imprime Resto Divisao
    li $v0,4
    la $a0,RResto
    syscall
    li $v0,1
    move $a0, $t4
    syscall
