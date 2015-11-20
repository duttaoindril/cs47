#======================================
#$t0 is general use number
#======================================
#$v0 & $v1 are returns for functions
#$a0 & $a1 are arguments for functions
#======================================

.include "cs47_macro.asm"

.data
.align 2
var_a: .word 2 3 5 5 5 6 7 8 8 10 11 14 15 17 17 18 20
#var_a: .word 15 18 21
var_m: .word 17
#var_m: .word 3
gcdstr: .asciiz "GCD of array is: "
lcmstr: .asciiz "LCM of array is: "
newl:  .asciiz "\n"

.text
.globl main
main:
	add $a0, $zero, $zero #index of var_a
	lw $a1, var_m #length of var_a

	jal gcd_lcm_set
	move $t0, $v0
	move $t1, $v1

	print_str(gcdstr)
	print_reg_int($t0)
	print_str(newl)
	print_str(lcmstr)
	print_reg_int($t1)
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
# $s4 is the value at current index of array

# $s6 is the call save for GCD_LCM_SET
# $s7 is the call save for LCM
#------------------------------------------------------------------------------
gcd_lcm_set:
	move $s6, $ra
	move $s0, $a0
	move $s1, $a1
	la  $s2, var_a #Load var_a array into $a1.
	mul $t0, $s0, 4 #Get pointer reference by mult index $a3 by 4.
	add $t0, $s2, $t0 #Go to the index from pointer in array.
	lw  $s2, ($t0) #Get value from index in var_a, store into $a1
	move $s3, $s2
loopcheck:
	addi $s0, $s0, 1

	sub $t0, $s1, $s0 #If index of a < length of a...
	bgtz $t0, looproutine #Jump to second check, else...

	move $v0, $s2 #Since array is empty...
	move $v1, $s3 #Move values into correct position...

	jr $s6 #And exit.

looproutine:
	la  $s4, var_a #Load var_a array into $s7.
	mul $t0, $s0, 4 #Get pointer reference by mult index $s0 by 4.
	add $t0, $s4, $t0 #Go to the index from pointer in array.
	lw  $s4, ($t0) #Get value from index in var_a, store into $s7
	#Loaded val of var_a at current index of $s0 into $s7

	move $a0, $s2 #Put last GCD into arg 1
	move $a1, $s4 #Put new array num into arg 2
	jal gcd
	move $s2, $v0 #Put new GCD into last GCD

	move $a0, $s3 #Put last LCM into arg 1
	move $a1, $s4 #Put new array num into arg 2
	jal lcm
	move $s3, $v0 #Put new GCD into last GCD
	j loopcheck

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
	beqz $t0, gcdA
	bgtz $t0, gcdB
	bltz $t0, gcdC
gcdA:
	move $v0, $a0
	jr $ra
gcdB:
	sub $a0, $a0, $a1
	j gcd
gcdC:
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
# $t2 is a hold for n1
# $t3 is a hold for n2
# $t4 is a hold for gcd(n1, n2)
#------------------------------------------------------------------------------
lcm:
	move $s7, $ra
	move $t2, $a0
	move $t3, $a1
	jal gcd
	move $t4, $v0
	mul $t2, $t2, $t3
	div $t2, $t2, $t4
	move $v0, $t2
	jr $s7