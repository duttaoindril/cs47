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
#$v0 & $v1 are returns for functions
#$a0 & $a1 are arguments for functions
#======================================
#$a3 is index of var_a
#======================================
#$s5 & $s6 are outputs from GCD & LCM
#======================================

.include "cs47_macro.asm"

.data
.align 2
var_a: .word 2 3 5 5 5 6 7 8 8 10 11 14 15 17 17 18 20 
var_m: .word 17
gcdstr: .asciiz "GCD of array is: "
lcmstr: .asciiz "LCM of array is: "
lcmthing: .asciiz "Doing LCM calcs:\n"
newl:  .asciiz "\n"

.text
.globl main
main:
	add $a0, $zero, $zero #index of var_a
	lw $a1, var_m #length of var_a
	
	jal gcd_lcm_set
	
	print_str(gcdstr)
	print_reg_int($v0)
	print_str(newl)
	print_str(lcmstr)
	print_reg_int($v1)
	print_str(newl)
	li $v0, 10
	syscall

	
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
	move $s6, $a1
	j lcm
gcdB:
	sub $a1, $a1, $a2
	j gcd
gcdC:
	sub $a2, $a2, $a1
	j gcd
lcm:
	move $s5, $s6
	div $t0, $s4, $s6
	mul $s5, $s5, $t0
	div $t0, $s2, $s6
	mul $s5, $s5, $t0
	move $s4, $s5
replaceina:
	la  $t1, var_a
	mul $t0, $a3, 4
	add $t0, $t1, $t0
	sw $s6, ($t0)
	j gcd_lcm_set
bbye:
	print_str(gcdstr)
	print_reg_int($s6)
	print_str(newl)
	print_str(lcmstr)
	print_reg_int($s4)
	print_str(newl)
	li $v0, 10
	syscall

#------------------------------------------------------------------------------
# Function: gcd_lcm_set
# Argument:
#	$a0 : +ve integer number n1, beginning of array
#	$a1 : +ve integer number n2, number of elements of array
# Returns
#	$v0 : gcd of array from n1 to n2
#	$v1 : lcm of array from n1 to n2
#
# Purpose: Implementing the recursive gcd function to
#	   get the Greatest Common Divisor of n1 and n2
#
# $s0 is the index of the array
# $s1 is the length of the array
# $s2 is the latest GCD of the array
# $s3 is the latest LCM of the array
# $s7 is the value at current index of array
#------------------------------------------------------------------------------
gcd_lcm_set:
	move $s0, $a0
	move $s1, $a1
	
	la  $s2, var_a #Load var_a array into $a1.
	mul $t0, $s0, 4 #Get pointer reference by mult index $a3 by 4.
	add $t0, $s2, $t0 #Go to the index from pointer in array.
	lw  $s2, ($t0) #Get value from index in var_a, store into $a1
	
	la  $s3, var_a #Load var_a array into $a1.
	mul $t0, $s0, 4 #Get pointer reference by mult index $a3 by 4.
	add $t0, $s3, $t0 #Go to the index from pointer in array.
	lw  $s3, ($t0) #Get value from index in var_a, store into $a1
	
loopcheck:
	addi $s0, $s0, 1
	sub $t0, $s1, $s0 #If index of a < length of a...
	bgtz $t0, looproutine #Jump to second check, else...
	
	move $v0, $s2 #Since array is empty...
	move $v1, $s3 #Move values into correct position...
	
	jr $ra #And exit.

looproutine:
	la  $s7, var_a #Load var_a array into $s7.
	mul $t0, $s0, 4 #Get pointer reference by mult index $s0 by 4.
	add $t0, $s7, $t0 #Go to the index from pointer in array.
	lw  $s7, ($t0) #Get value from index in var_a, store into $s7
	#Loaded val of var_a at current index of $s0 into $s7
	
	move $a0, $s2 #Put last GCD into arg 1
	move $a1, $s7 #Put new array num into arg 2
	jal gcd
	move $v0 $s2 #Put new GCD into last GCD
	
	move $a0, $s3 #Put last LCM into arg 1
	move $a1, $s7 #Put new array num into arg 2
	jal lcm
	move $v0 $s3 #Put new GCD into last GCD
	j loopcheck
	
Implement another procedure 'gcd_lcm_set' which takes two argument $a0 as address to the start
of array var_a and $a1 as number of elements in the array. It returns GCD of the set of numbers
in $v0 and LCM of the set of the number in $v1. The 'main' program prints GCD and LCM value of
the given array of integer numbers in var_a. Name the program as gcd_lcm_arr.asm.
#------------------------------------------------------------------------------
# Function: gcd
# Argument:
#	$a0 : +ve integer number n1
#	$a1 : +ve integer number n2
# Returns
#	$v0 : gcd(n1, n2)
#
# Purpose: Implementing the recursive gcd function to
#	   get the Greatest Common Divisor of n1 and n2
#------------------------------------------------------------------------------
gcd:
	sub $t0, $a0, $a1
	bgtz $t0, gcdA
	bltz $t0, gcdB
	move $v0, $a0
	jr ra
gcdA:
	sub $a0, $a0, $a1
	j gcd
gcdB:
	sub $a1, $a1, $a0
	j gcd
	
#------------------------------------------------------------------------------
# Function: lcm
# Argument:
#	$a0 : +ve integer number n1
#	$a1 : +ve integer number n2
# Returns
#	$v0 : lcm(n1, n2)
#
# Purpose: Implementing the iterative lcm function to
#	   get the Least Common Multiple of n1 and n2
# 
# $s4 is a hold for n1
# $s5 is a hold for n2
# $s6 is a hold for gcd(n1, n2)
#------------------------------------------------------------------------------
lcm:
	move $s4, $a0
	move $s5, $a1
	jal gcd
	move $s6, $v0
	mul $s4, $s4, $s5
	div $s4, $s4, $s6
	move $v0, $s4
	jr $ra