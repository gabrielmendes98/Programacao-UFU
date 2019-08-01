# Gabriel Mendes de Souza Santiago
# Matricula: 11621BCC015

.data
   NumeroLido: .asciiz "Digite um numero maior que zero: "
   Numero1: .word 1
   Numero2: .word 2
   Numero3: .word 3
   pontoEvirgula: .asciiz "; "
   ponto: .asciiz "."
   
.text
   main:
       addi $t0, $zero, 0
       while:
             # le numero
             li $v0,4
             la $a0,NumeroLido
    	     syscall
             li $v0,5
             syscall
             move $t0, $v0
             
             # se numero > 0 exit
             bgt $t0, 0, exit
             # se nao, jump para while
             j while
       
       exit:
          lw $t1,Numero1
          lw $t2,Numero2
          lw $t3,Numero3
          
       loop:
          # imprime o numero calculado
          li $v0, 1
          la $a0, ($t0)
          syscall
          
          # se for menor ou igual a 1, vai para fim
          ble $t0,$t1, fim
          
          # imprime o ponto e virgula
          li $v0,4
          la $a0,pontoEvirgula
    	  syscall
    	  
    	  # vai para a funcao verificaParImpar
          j verificaParImpar
          
       
   par:   # funcao para numero par
      div $t0,$t0,$t2
      j loop

   impar:   # funcao para numero impar
      mul $t0,$t0,$t3
      add $t0,$t0,$t1
      j loop
      
   verificaParImpar:   #verifica se é par ou impar
      div $t0,$t2
      mfhi $t4
      beq $t4, $zero,par
      j impar
      
   fim: #imprime o ponto final e sai do programa
      li $v0,4
      la $a0,ponto
      syscall
      
      li $v0, 10	# código para encerrar o programa
      syscall		# executa a chamada do SO para encerrar
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      