#========================================================================
# CS 47 Macros
#========================================================================
.macro	print_str($arg)
	li $v0, 4
	la $a0, $arg
	syscall
.end_macro

.macro read_int($arg)
	li $v0, 5
	syscall
	move $arg, $v0
.end_macro

.macro print_reg_int($arg)
	li $v0, 1
	move $a0, $arg
	syscall
.end_macro

.macro read_char($arg)
	li $v0, 12
	syscall
	move $arg, $v0
.end_macro

.macro print_reg_char($arg)
	li $v0, 11
	move $a0, $arg
	syscall
.end_macro

.macro	exit()
	li $v0, 10
	syscall
.end_macro
#========================================================================
# Project #2
#========================================================================
.macro add_normal($a, $b)
	add $v0, $a, $b
.end_macro

.macro sub_normal($a, $b)
	sub $v0, $a, $b
.end_macro

.macro mul_normal($a, $b)
	mult $a, $b
	mflo $v0
	mfhi $v1
.end_macro

.macro div_normal($a, $b)
	div $a, $b
	mflo $v0
	mflo $v1
.end_macro 

#========================================================================
# Project #3
#========================================================================
.macro add_logic($a, $b)
	move $t0, $a
	move $t1, $b

LOOP:	
	xor $t2, $t0, $t1
	and $t3, $t0, $t1
	sll $t3, $t3, 1
	move $t0, $t2
	move $t1, $t3
	bgtz $t3, LOOP
	
	move $v0, $t0
.end_macro

.macro sub_logic($a, $b)
	move $t0, $a
	move $t1, $b

LOOP:	
	xor $t2, $t0, $t1 #t2 is D
	not $t3, $t1
	and $t3, $t0, $t3 #t3 is B
	
	xor $t2, $t2, $t3
	
	bgtz $t3, LOOP
	
	move $v0, $t0
.end_macro

.macro mul_logic($a, $b)
	mult $a, $b
	mflo $v0
	mfhi $v1
.end_macro

.macro div_logic($a, $b)
	div $a, $b
	mflo $v0
	mflo $v1
.end_macro

#========================================================================
# Project #4
#========================================================================
.macro au_normal($a, $b, $arg)
	beq $arg, 0x2B, addition
	beq $arg, 0x2D, subtraction
	beq $arg, 0x2A, multiplication
	beq $arg, 0x2F, division
addition:
	add_normal($a, $b)
	j done
subtraction:
	sub_normal($a, $b)
	j done
multiplication:
	mul_normal($a, $b)
	j done    
division:
	div_normal($a, $b)
	j done
done:
.end_macro

.macro au_logic($a, $b, $arg)
	beq $arg, 0x2B, addition
	beq $arg, 0x2D, subtraction
	beq $arg, 0x2A, multiplication
	beq $arg, 0x2F, division
addition:
	add_logic($a, $b)
	j done
subtraction:
	sub_logic($a, $b)
	j done
multiplication:
	mul_logic($a, $b)
	j done
division:
	div_logic($a, $b)
	j done
done:
.end_macro

#========================================================================
# Project #1
#========================================================================
#.include    "cs47_macro.asm"

.data
prompta: .asciiz "Please enter an integer: "
promptb: .asciiz "Please enter another integer: "
promptc: .asciiz "Please enter an operation (+, -, *, /): "
promptd: .asciiz "\nYour (normal) answer is: "
prompte: .asciiz "\nYou messed up the input. Come on! Try again!\n\n"
promptf: .asciiz "From the top!\n\n"
promptg: .asciiz "\nNice Job! Let's go again!\n\n"
prompth: .asciiz "\nIt was nice knowing you!\n\nB-bye!\n"
prompti: .asciiz "\nYour (normal) remainder is: "
promptj: .asciiz "\nIt passed!\n\nThe normal and logic operations are the same!\n"
promptk: .asciiz "\nIt failed.\n\nThe normal and logic operations are not the same.\n"
promptl: .asciiz "\nYour (logic) answer is: "
promptm: .asciiz "\nYour (logic) remainder is: "
newl:  .asciiz "\n"

.text
.globl start
start:
	print_str(prompta)
	read_int($a1)
	print_str(newl)
	#print_reg_int($a1)
	#print_str(newl)
	#print_str(newl)
	print_str(promptb)
	read_int($a2)
	print_str(newl)
	#print_reg_int($a2)
	#print_str(newl)
	#print_str(newl)
	print_str(promptc)
	read_char($a3)
	print_str(newl)
	#print_reg_char($a3)
	#print_str(newl)
	#print_str(newl)
	au_normal($a1, $a2, $a3)
	move $t0, $v0
	move $t1, $v1
	au_logic($a1, $a2, $a3)
	move $t2, $v0
	move $t3, $v1
	beq $a3, 0x2B, report
	beq $a3, 0x2D, report
	beq $a3, 0x2A, report
	beq $a3, 0x2F, additionalreport
	beq $a3, 0x71, quit
	beq $a3, 0x51, quit
	j error
	
additionalreport:
	print_str(prompti)
	print_reg_int($t1)
	print_str(newl)
	print_str(promptm)
	print_reg_int($t3)
	print_str(newl)

report:
	print_str(promptd)
	print_reg_int($t0)
	print_str(newl)
	print_str(promptl)
	print_reg_int($t2)
	print_str(newl)
	beq $t0, $t2, pass
	print_str(promptk)	
	j restart

pass:
	print_str(promptj)
	j restart

restart:
	print_str(promptg)
	print_str(promptf)
	j start

error:
	print_str(prompte)
	print_str(promptf)
	j start
	
quit:
	print_str(prompth)
	exit
