.data
	
	resultado1 : 	.word 1
	resultado2 : 	.word 2
	resultado3 : 	.word 3
	resultado4 : 	.word 4
	resultado5 : 	.word 5
	

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
	bgt	$s4, $s3 , print5 #  branch to target if  $s4 > $s3
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
	
	
	
	
	
