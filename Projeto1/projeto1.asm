.data
	
	entrada: .asciiz "\tEnter N\t" 
	resultado : .asciiz "Tribonacci(n) = \t"
	espaco : .asciiz " "
	resultado1 : 	.word 1
	resultado2 : 	.word 2
	resultado3 : 	.word 3
	resultado4 : 	.word 4
	resultado5 : 	.word 5
	arraytribo: .word   0 : 16      # "array" of 12 words to contain trib values
	size: .word  7   # size of "array" 
	

.text

main:
	addi $t0, $zero, 0
	addi $t1, $zero, 0
	addi $t2, $zero, 3
	addi $t3, $zero, 5
	addi $t4, $zero, 0
	addi $t5, $zero, 9
	addi $s0, $zero, 48
	addi $s1, $zero, 97
	addi $s2, $zero, 146
	addi $s3, $zero, 195
	
	mul $t0, $t0, $t3
	mul $t1, $t1, $t4
	mul $t2, $t2, $t5
	
	add $s4, $t0, $t1
	add $s4, $s4, $t2
	
	ble	$s4, $s0 , print1	#  branch to target if  $s4 <= $s0
	bgt	$s4, $s3 , print5       #  branch to target if  $s4 > $s3
	bgt	$s4, $s0 , checamaior48	#  branch to target if  $s4 > $s0
	bgt	$s4, $s1 , checamaior97	#  branch to target if  $s4 > $s1
	bgt	$s4, $s2 , checamaior146#  branch to target if  $s4 > $s2
	
	
	checamaior48:
	
	ble	$s4, $s1 , print2	#  branch to target if  $s4 <= $s1
	li $v0, 10
	syscall
	
	
	checamaior97:
	
	ble	$s4, $s2 , print3	#  branch to target if  $s4 <= $s2
	li $v0, 10
	syscall
	
	checamaior146:
	
	ble	$s4, $s3 , print4	#  branch to target if  $s4 <= $s3
	li $v0, 10
	syscall
	
	
	print1 :
	
	li $v0, 1
	lw $a0, resultado1
	syscall
	jal entradatribonacci
	li $v0, 10
	syscall
	
	print2 :
	
	li $v0, 1
	lw $a0, resultado2
	syscall
	li $v0, 10
	syscall
	
	print3 :
	
	li $v0, 1
	lw $a0, resultado3
	syscall
	li $v0, 10
	syscall
	
	print4 :
	
	li $v0, 1
	lw $a0, resultado4
	syscall
	li $v0, 10
	syscall
	
	print5 :
	
	li $v0, 1
	lw $a0, resultado5
	syscall
	li $v0, 10
	syscall
	
	
	entradatribonacci:
	li $v0, 4
	la $a0, entrada
	syscall
	li $v0, 5
	syscall
	la   $t0, arraytribo        # load address of array
	#mul $t5, $t5, 2
     	#la $v0, ($t5)
     	la   $t5, size        # load address of size variable
      	lw   $t5, 0($t5)      # load array size
      	li   $t2, 0           # 0 is first and second trib. number
      	add.d $f0, $f2, $f4
      	sw   $t2, 0($t0)      # F[0] = 0
      	sw   $t2, 4($t0)      # F[1] = F[0] = 0
      	li   $t2, 1           # 1 is first and second Fib. number
      	add.d $f0, $f2, $f4
      	sw   $t2, 8($t0)      # F[0] = 1
      	sw   $t2, 12($t0)      # F[1] = F[0] = 1
      	mul $t1, $t1, $zero
      	addi $t1, $t5, -4     # Counter for loop, will execute (size-4 times
loop: lw $t3, 4($t0)
 	lw   $t4, 8($t0)      # Get value from array F[n-1] 
      lw   $t5, 12($t0)      # Get value from array F[n]
      add  $t2, $t3, $t4    # $t2 = F[n] + F[n-1]
      add $t2, $t2, $t5     #$t2 = F[n] + F[n-1] + F[n-2]
      sw   $t2, 16($t0)      # Store F[n-3] = F[n] + F[n-1] in array
      addi $t0, $t0, 4      # increment address of Fib. number source
      addi $t1, $t1, -1     # decrement loop counter
      bgtz $t1, loop        # repeat if not finished yet.
      la   $a0, arraytribo       # first argument for print (array)
      add  $a1, $zero, $t5  # second argument for print (size)
      jal  print            # call print routine. 
      li   $v0, 10          # system call for exit
      syscall               # we are out of here.
      
print:add  $t0, $zero, $a0  # starting address of array
      add  $t1, $zero, $a1  # initialize loop counter to array size
      la   $a0, resultado       # load address of print heading
      li   $v0, 4           # specify Print String service
      syscall               # print heading
      #la $a0, 0($t2)
      
out:  lw   $a0, 0($t0)      # load fibonacci number for syscall
	li $v0, 1
	syscall
      la   $a0, espaco       # load address of spacer for syscall
      li   $v0, 4           # specify Print String service
      syscall               # output string
      addi $t0, $t0, 4      # increment address
      addi $t1, $t1, -1     # decrement loop counter
      bgtz $t1, out         # repeat if not finished
      jr   $ra              # return
      



	
	
	
	
	
	
	
	
	
