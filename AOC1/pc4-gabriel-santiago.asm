# Gabriel Mendes de Souza Santiago
# Matricula: 11621BCC015

.data
	mensagem: .asciiz "Entre com o numero para achar o fatorial: "
	resultadoMensagem: .asciiz "\nO fatorial do numero eh "
	numero: .word 0
	resposta: .word 0
	
.text
	.globl main
	main:
		# Le o numero do usuario.
		li $v0, 4
		la $a0, mensagem
		syscall
		
		li $v0, 5
		syscall
		
		sw $v0, numero
		
		# Chamada da funcao fatorial
		lw $a0, numero
		jal achaFatorial
		sw $v0, resposta
		
		# Mostra resultado
		li $v0, 4
		la, $a0, resultadoMensagem
		syscall
		
		li $v0, 1
		lw, $a0, resposta
		syscall
		
		# Finaliza
		li $v0, 10
		syscall

# Definindo funcao de achar fatorial	
.globl achaFatorial
achaFatorial:
		subu $sp, $sp, 8
		sw $ra, ($sp)
		sw $s0, 4($sp)
		
		# Caso base
		li $v0, 1
		beq $a0, 0, acabaFatorial
		
		# achaFatorial (numero - 1)
		move $s0, $a0
		sub $a0, $a0, 1
		jal achaFatorial
		
		# So chama essa parte quando a funcao acha o caso base e vai voltando (rebobinando)
		# Multiplica os numeros
		mul $v0, $s0, $v0
		
		acabaFatorial:
				lw $ra, ($sp)
				lw, $s0, 4($sp)
				addu $sp, $sp, 8
				
				jr $ra