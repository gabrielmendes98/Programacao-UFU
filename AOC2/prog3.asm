.data
	num1: .asciiz "digite o 1o numero: "
	num2: .asciiz "digite o 2o numero: "
	rmult: .asciiz "Mult = "
	pula: .asciiz "\n"
	rdiv: .asciiz "Div = "
	rsub: .asciiz "Sub = "
	
.text
	li $v0,4
	la $a0,num1
	syscall
	
	li $v0,5
	syscall
	move $t0, $v0
	
	li $v0, 4
	la $a0, num2
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0
	
	#multiplicacao
	mult $t0,$t1
	mflo $t2	#move o resultado para t2
	
	#divisao
	div $t0,$t1
	mflo $t3	#move o resultado da divisao inteira para t3
			## para pegar o resto, mfhi $t3 ##
	
	#subtracao
	sub $t4,$t0,$t1
	
	#printa tudo
	li $v0, 4
	la $a0, rmult
	syscall
	li $v0, 1
	la $a0, ($t2)
	syscall
	li $v0, 4
	la $a0, pula
	syscall
	
	
	li $v0, 4
	la $a0, rdiv
	syscall
	li $v0, 1
	la $a0, ($t3)
	syscall
	li $v0, 4
	la $a0, pula
	syscall
	
	li $v0, 4
	la $a0, rsub
	syscall
	li $v0, 1
	la $a0, ($t4)
	syscall
