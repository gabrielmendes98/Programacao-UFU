.data
	hello: .asciiz "hello world"
	
.text
	li $v0, 4	#carrega o serviço em v0, 4 printa string
	la $a0, hello	#carrega o argumento em a0
	syscall		#chama o sistema para executar