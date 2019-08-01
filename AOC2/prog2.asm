.data
	num1: .asciiz "digite um numero: "
	num2: .asciiz "digite outro numero: "
	
.text
	#printa o que esta escrito em num1
	li $v0, 4
	la $a0, num1
	syscall
	
	#le o numero e move para t0
	li $v0, 5	#carrega em v0, 5 é pra ler string
	syscall
	move $t0, $v0	#move o que o usuario digitou em v0 para t0
	
	li $v0, 4
	la $a0, num2
	syscall
	
	li $v0,5
	syscall
	move $t1, $v0
	
	add $t2, $t0, $t1
	
	li $v0, 1	#carrega em v0, 1 é pra printar inteiro
	la $a0, ($t2)	#carrega o valor de t2 para a0
	syscall