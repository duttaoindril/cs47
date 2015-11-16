#======================================
#$t0 is general use number
#======================================
#$t1 is var_a
#======================================
#$s1 & $s2 are arguments for GCD & LCM
#======================================
#$s3 is length of var_a, var_m
#======================================
#$s4 is the last LCM
#======================================
#$a1 & $a2 are arguments for GCD & LCM
#======================================
#$a3 is index of var_a
#======================================
#$v1 & $s4 are outputs from GCD & LCM
#======================================

.include "cs47_macro.asm"

.data
.align 2
var_a: .word 2 3 5 5 5 6 7 8 8 10 11 14 15 17 17 18 20 
var_m: .word 17
gcdstr: .asciiz "GCD of array is: "
lcmstr: .asciiz "LCM of array is: "
newl:  .asciiz "\n"

.text
.globl main
main:
	add $a3, $zero, 0 #index of var_a
	lw $s3, var_m #length of var_a

	la  $a1, var_a #Load var_a array into $a1.
	mul $t0, $a3, 4 #Get pointer reference by mult index $a3 by 4.
	add $t0, $a1, $t0 #Go to the index from pointer in array.
	lw  $s4, ($t0) #Get value from index in var_a, store into $a1
gcd_lcm_set:
	sub $t0, $s3, $a3 #If index of a < length of a...
	bge $t0, 2, looproutine #Jump to second check, else...
	j bbye #Since array is empty, exit.
looproutine:
	la  $a1, var_a #Load var_a array into $a1.
	mul $t0, $a3, 4 #Get pointer reference by mult index $a3 by 4.
	add $t0, $a1, $t0 #Go to the index from pointer in array.
	lw  $a1, ($t0) #Get value from index in var_a, store into $a1
	#Loaded val of var_b at current index of $a2 into $t2

	move $s1, $a1 #Store $a1, first element, into $s1
	
	add $a3, $a3, 1 #Increase the index to get the next element

	la  $a2, var_a #Load var_a array into $t1.
	mul $t0, $a3, 4 #Get pointer reference by mult index by 4.
	add $t0, $a2, $t0 #Go to the index from pointer in array.
	lw  $a2, ($t0) #Get value from index in var_a, store into $t1.
	#Loaded val of var_a at current index of $a1 into $t1

	move $s2, $a2 #Store $a1, first element, into $s2
gcd:
	sub $t0, $a1, $a2
	beqz $t0, gcdA
	bgtz $t0, gcdB
	bltz $t0, gcdC
gcdA:
	move $s4, $a1
	j lcm
gcdB:
	sub $a1, $a1, $a2
	j gcd
gcdC:
	sub $a2, $a2, $a1
	j gcd
lcm:
	add $v1, $s4, $zero
	div $t0, $s4, $s4
	mul $v1, $v1, $t0
	div $t0, $s2, $s4
	mul $v1, $v1, $t0
	move $s4, $v1
replaceina:
	la  $t1, var_a
	mul $t0, $a3, 4
	add $t0, $t1, $t0
	sw $s4, 0($t0)
	j gcd_lcm_set
bbye:
	print_str(gcdstr)
	print_reg_int($s4)
	print_str(newl)
	print_str(lcmstr)
	print_reg_int($v1)
	print_str(newl)
	li $v0, 10
	syscall
