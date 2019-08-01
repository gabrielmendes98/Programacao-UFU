# Gabriel Mendes de Souza Santiago
# Matricula: 11621BCC015
# CPF usado: 092.294.754-81

.data
	Num1: .asciiz "Digite o primeiro numero: "
	Num2: .asciiz "Digite o segundo numero: "
	Num3: .asciiz "Digite o terceiro numero: "
	Num4: .asciiz "Digite o quarto numero: "
	Num5: .asciiz "Digite o quinto numero: "
	Num6: .asciiz "Digite o sexto numero: "
	Num7: .asciiz "Digite o setimo numero: "
	cpf0: .word 2
    	cpf1: .word 2
   	cpf2: .word 9
    	cpf3: .word 4
    	cpf4: .word 7
    	cpf5: .word 5
   	cpf6: .word 4
   	DigVer: .asciiz "\nO digito verificador eh = " 
   	num11: .word 11
   	num2: .word 2
	
.text
    lw $s0,cpf0
    lw $s1,cpf1
    lw $s2,cpf2
    lw $s3,cpf3
    lw $s4,cpf4
    lw $s5,cpf5
    lw $s6,cpf6
    lw $s7,num11

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
    move $t1, $v0
    
        # Operacoes de leitura para o Num3
    li $v0,4
    la $a0,Num3
    syscall
    li $v0,5
    syscall
    move $t2, $v0
    
        # Operacoes de leitura para o Num4
    li $v0,4
    la $a0,Num4
    syscall
    li $v0,5
    syscall
    move $t3, $v0
    
        # Operacoes de leitura para o Num5
    li $v0,4
    la $a0,Num5
    syscall
    li $v0,5
    syscall
    move $t4, $v0
    
        # Operacoes de leitura para o Num6
    li $v0,4
    la $a0,Num6
    syscall
    li $v0,5
    syscall
    move $t5, $v0
    
        # Operacoes de leitura para o Num7
    li $v0,4
    la $a0,Num7
    syscall
    li $v0,5
    syscall
    move $t6, $v0
    
    
    	# Multiplica sequencia por pesos
    mul $t7,$s0,$t0
    mul $t8,$s1,$t1
    add $t9,$t7,$t8
    
    mul $t8,$s2,$t2
    add $t7,$t8,$t9
    
    mul $t8,$s3,$t3
    add $t9,$t8,$t7
    
    mul $t8,$s4,$t4
    add $t7,$t8,$t9
    
    mul $t8,$s5,$t5
    add $t9,$t8,$t7
    
    mul $t8,$s6,$t6
    add $t7,$t8,$t9
    	
    	# divide produto por 11
    div $t7, $s7
    mfhi $t9
    	# atribui 2 para o registrador
    lw $s2,num2
    
    	# se t9 < s2, setar s3 para 0
    slt $s3,$t9,$s2
    	# se s3 == 0, vá para Else, se nao, subtraia 11 do resto
    bne $s3,$zero,Else
    sub $t7,$s7,$t9
    j Exit
    Else: sub $t7,$s7,$s2
    Exit:
    
    	# Imprime Digito verificador
    li $v0,4
    la $a0,DigVer
    syscall
    li $v0,1
    move $a0, $t7
    syscall
