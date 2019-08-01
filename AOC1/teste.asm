#yan lucas damasceno dias 
#cpf 8373166

.data
    String1: .asciiz "digite os numeros "
    cpf0: .word 8
    cpf1: .word 3
    cpf2: .word 7
    cpf3: .word 3
    cpf4: .word 1
    cpf5: .word 6
    cpf6: .word 6

.text
    li $v0,4
    la $a0,String1
    syscall

    lw $t0,cpf0
    lw $t1,cpf1
    lw $t2,cpf2
    lw $t3,cpf3
    lw $t4,cpf4
    lw $t5,cpf5
    lw $t6,cpf6

    li $s0,5
    syscall
    li $s1,5
    syscall
    li $s2,5
    syscall
    li $s3,5
    syscall
    li $s4,5
    syscall
    li $s5,5
    syscall
    li $s6,5
    syscall