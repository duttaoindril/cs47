.include "./cs47_proj_macro.asm"
.text
#-----------------------------------------------
# C style signature 'printf(<format string>,<arg1>,
#			 <arg2>, ... , <argn>)'
#
# This routine supports %s and %d only
#
# Argument: $a0, address to the format string
#	    All other addresses / values goes into stack
#-----------------------------------------------
printf:
	#store RTE - 5 *4 = 20 bytes
	addi	$sp, $sp, -24
	sw	$fp, 24($sp)
	sw	$ra, 20($sp)
	sw	$a0, 16($sp)
	sw	$s0, 12($sp)
	sw	$s1,  8($sp)
	addi	$fp, $sp, 24
	# body
	move 	$s0, $a0 #save the argument
	add     $s1, $zero, $zero # store argument index
printf_loop:
	lbu	$a0, 0($s0)
	beqz	$a0, printf_ret
	beq     $a0, '%', printf_format
	# print the character
	li	$v0, 11
	syscall
	j 	printf_last
printf_format:
	addi	$s1, $s1, 1 # increase argument index
	mul	$t0, $s1, 4
	add	$t0, $t0, $fp # all print type assumes 
			      # the latest argument pointer at $t0
	addi	$s0, $s0, 1
	lbu	$a0, 0($s0)
	beq 	$a0, 'd', printf_int
	beq	$a0, 's', printf_str
	beq	$a0, 'c', printf_char
printf_int: 
	lw	$a0, 0($t0) # printf_int
	li	$v0, 1
	syscall
	j 	printf_last
printf_str:
	lw	$a0, 0($t0) # printf_str
	li	$v0, 4
	syscall
	j 	printf_last
printf_char:
	lbu	$a0, 0($t0)
	li	$v0, 11
	syscall
	j 	printf_last
printf_last:
	addi	$s0, $s0, 1 # move to next character
	j	printf_loop
printf_ret:
	#restore RTE
	lw	$fp, 24($sp)
	lw	$ra, 20($sp)
	lw	$a0, 16($sp)
	lw	$s0, 12($sp)
	lw	$s1,  8($sp)
	addi	$sp, $sp, 24
	jr $ra

# TBD: Complete your project procedures
# Needed skeleton is given
#####################################################################
# Implement au_logical
# Argument:
# 	$a0: First number
#	$a1: Second number
#	$a2: operation code ('+':add, '-':sub, '*':mul, '/':div)
# Return:
#	$v0: ($a0+$a1) | ($a0-$a1) | ($a0*$a1):LO | ($a0 / $a1)
# 	$v1: ($a0 * $a1):HI | ($a0 % $a1)
# Notes:
#####################################################################
au_logical:
# TBD: Complete it 
	

	beq $a2, 0x2B, addition
	beq $a2, 0x2D, subtraction
	beq $a2, 0x2A, multiplication
	beq $a2, 0x2F, division
	
	#----------------------#
	
addition:
	move $t0, $a0
	move $t1, $a1

LOOP:	
	xor $t2, $t0, $t1
	and $t3, $t0, $t1
	sll $t3, $t3, 1
	move $t0, $t2
	move $t1, $t3
	bnez $t1, LOOP
	
	move $v0, $t0
	j done
	
	#----------------------#
	
subtraction:
	not $t0, $a1
	move $t1, $zero
	ori $t1, 1
NEGATIVE:
	xor $t2, $t0, $t1
	and $t3, $t0, $t1
	sll $t3, $t3, 1
	move $t0, $t2
	move $t1, $t3
	bnez $t1, NEGATIVE
	 
	move $t1, $t0
	move $t0, $a0

SUB:	
	xor $t2, $t0, $t1
	and $t3, $t0, $t1
	sll $t3, $t3, 1
	move $t0, $t2
	move $t1, $t3
	bnez $t1, SUB
			
	move $v0, $t0
	j done
	
	#----------------------#
	
multiplication:
	
	# Using $t5 for HI and $t6 for LO
	# Set $t4 as our index for LO, which is 1, initially.
	# Set $t3 as our index for HI, which is 31, initially.
	ori $t4, $zero, 1
	ori $t3, $zero, 31
	
	# INITIAL ADDITION
	andi $t7, $a1, 1
	srl $a1, $a1, 1
	beqz $t7, MAIN_MULT
	or $t6, $t6, $a0
	beqz $a1, END_MULT
	
MAIN_MULT: # MAIN PROCEDURE
	andi $t7, $a1, 1 # Check if last digit of second number is 1, if so, continue.
	srl $a1, $a1, 1
	beqz $t7, END_MULT
	# We're using $s0 as our storage for shifted version of $a0 as C (either right or left)
	sllv $s0, $a0, $t4 # In this case, we're shifting left, for addition to LO
	
	move $s1, $s0 # Add C to LO
	move $s2, $t6
ADD_C_TO_LO: # LO = LO + C
	xor $s3, $s1, $s2
	and $s4, $s1, $s2
	sll $s4, $s4, 1
	move $s1, $s3
	move $s2, $s4
	bnez $s2, ADD_C_TO_LO
	
	bgeu $s1, $t6, SET_NEW_TOTAL # If new LO is less than old LO, we have overflow. Thus, add 1 to HI
	
	move $s2, $t5 # Adding to HI
	ori $s3, $zero, 1
ADD_ONE_TO_HI: 
	xor $s4, $s2, $s3 # Add one to HI for overflow
	and $s5, $s2, $s3
	sll $s5, $s5, 1
	move $s2, $s4
	move $s3, $s5
	bnez $s3, ADD_ONE_TO_HI
	
	or $t5, $zero, $s2
	
SET_NEW_TOTAL: 
	or $t6, $zero, $s1 # Setting LO for this loop
	
	srlv $s0, $a0, $t3 # Setting C again, shifting right for addition to HI
	
	move $s1, $s0 # Add C to HI
	move $s2, $t5
ADD_C_TO_HI: 
	xor $s3, $s1, $s2 # HI = HI + C
	and $s4, $s1, $s2
	sll $s4, $s4, 1
	move $s1, $s3
	move $s2, $s4
	bnez $s2, ADD_C_TO_HI
	
	or $t5, $zero, $s1
	
INCREMENT_POS:
	
	move $s1, $t4 # Increment our LO index by 1
	ori $s2, $zero, 1
INCREMENT_LO:
	xor $s3, $s1, $s2
	and $s4, $s1, $s2
	sll $s4, $s4, 1
	move $s1, $s3
	move $s2, $s4
	bnez $s2, INCREMENT_LO
	
	move $t4, $s1 # If index is 32, we are done
	bgt $s1, 31, END_MULT
	
	move $s1, $t3 # Decrement index for HI
	ori, $s2, $zero, -1
DECREMENT_HI:
	xor $s3, $s1, $s2
	and $s4, $s1, $s2
	sll $s4, $s4, 1
	move $s1, $s3
	move $s2, $s4
	bnez $s2, DECREMENT_HI
	
	move $t3, $s1
	j MAIN_MULT # Loop main function
	
END_MULT:
	move $v0, $t6 # Move answers to registers
	move $v1, $t5
	j done    
	
	#----------------------#
	
division:
	
	
	#----------------------#
	
done:
	jr 	$ra
	
#####################################################################
# Implement au_normal
# Argument:
# 	$a0: First number
#	$a1: Second number
#	$a2: operation code ('+':add, '-':sub, '*':mul, '/':div)
# Return:
#	$v0: ($a0+$a1) | ($a0-$a1) | ($a0*$a1):LO | ($a0 / $a1)
# 	$v1: ($a0 * $a1):HI | ($a0 % $a1)
# Notes:
#####################################################################
au_normal:
# TBD: Complete it
        beq $a2, 0x2B, add_normal
	beq $a2, 0x2D, sub_normal
	beq $a2, 0x2A, mult_normal
	beq $a2, 0x2F, div_normal
	
	#----------------------#
	
add_normal:
	
	add $v0, $a0, $a1
	j done_normal
	
	#----------------------#
	
sub_normal:
	
	sub $v0, $a0, $a1
	j done_normal
	
	#----------------------#
	
mult_normal:
	
	mul $v0, $a0, $a1
	mfhi $v1
	j done_normal    
	
	#----------------------#
	
div_normal:
	
	div $a0, $a1
	mflo $v0
	mfhi $v1
	
	#----------------------#
	
done_normal:
	jr 	$ra
