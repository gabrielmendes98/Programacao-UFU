.data
	numero1: .word 1
	numero2: .word 2
	
.text
	lw $t0, numero1
	lw $t1, numero2
	lw $t2, numero1

	
	beq $t0,$t1,teste #se t0 = t1 va para teste, se nao continue
	
	add $t2, $t0, $t1
	li $v0, 1
	la $a0, ($t2)
	syscall
	j exit	#se chegar aqui va para saida para evitar que passe por teste
	
	teste: 	li $v0, 1
		la $a0, ($t2)
		syscall
		
	exit: