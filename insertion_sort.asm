#======================================
#$t0 is general use number
#======================================
#$t1 is var_a
#$t2 is the previous val of var_a
#======================================
#$a1 is the sorted barrier of the sort
#======================================
#$s1 is length of var_a, var_m
#======================================
#$v1 is the temp value of var_a
#======================================

.macro	print_str($arg)
	li $v0, 4
	la $a0, $arg
	syscall
.end_macro

.macro print_reg_int($arg)
	li $v0, 1
	move $a0, $arg
	syscall
.end_macro

.data
.align 2
var_a: .word 8 6 11 17 20 3 2 3 5 5 20 5 6 7 8 15 8 10 11 14 15 17 1
var_m: .word 23
done:  .asciiz "Sorted!\n"
sepe:  .asciiz ": "
newl:  .asciiz "\n"

.text
.globl start
start:
	add $a1, $zero, 1 #sort barrier index of var_a
	lw $s1, var_m #length of var_a

loopcheck:
	blez $a1, begofarray

	sub $t0, $s1, $a1
	blez $t0, bbye

	la  $t1, var_a #Load var_a array into $t1.
	mul $t0, $a1, 4 #Get pointer reference by mult index $a1 by 4.
	add $t0, $t1, $t0 #Go to the index from pointer in array.
	lw  $t1, ($t0) #Get value from index in var_a, store into $t1
	#Loaded val of var_b at current index of $a1 into $t1

	add $a1, $a1, -1 #Decrease the index to get the previous element

	la  $t2, var_a #Load var_a array into $t2.
	mul $t0, $a1, 4 #Get pointer reference by mult index by 4.
	add $t0, $t2, $t0 #Go to the index from pointer in array.
	lw  $t2, ($t0) #Get value from index in var_a, store into $t2.
	#Loaded val of var_a at current index of $a1 into $t2

	sub $t0, $t2, $t1 #If num at a is greater than a-1...
	bgtz $t0, swap #Jump to swap, else...

	j moveup #Moveup to the next index to check
swap:
	la  $t3, var_a
	mul $t0, $a1, 4
	add $t0, $t3, $t0
	sw $t1, ($t0)

	addi $a1, $a1, 1

	la  $t3, var_a
	mul $t0, $a1, 4
	add $t0, $t3, $t0
	sw $t2, ($t0)

	addi $a1, $a1, -2
begofarray:
	addi $a1, $a1, -1
moveup:
	add $a1, $a1, 2
	j loopcheck
bbye:
	add $a1, $zero, $zero
	print_str(done)

print:
	sub $t0, $s1, $a1 #If sorted index of a < length of a...
	blez $t0, exit #Jump to second check, else...
	la  $a2, var_a #Load var_a array into $a2.
	mul $t0, $a1, 4 #Get pointer reference by mult index by 4.
	add $t0, $a2, $t0 #Go to the index from pointer in array.
	lw  $a2, ($t0) #Get value from index in var_a, store into $s2 as min.
	print_reg_int($a1)
	print_str(sepe)
	print_reg_int($a2)
	print_str(newl)
	add $a1, $a1, 1
	j print

exit:
	li $v0, 10
	syscall