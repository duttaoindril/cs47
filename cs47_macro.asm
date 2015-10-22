.macro	print_str($arg)
	li $v0, 4
	la $a0, $arg
	syscall
.end_macro 
	
.macro	print_int($arg)
	li $v0, 1
	li $a0, $arg
	syscall
.end_macro
	
.macro	exit()
	li $v0, 10
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

.macro pushreg ($arg)
	sw $arg, 0($sp)
	sub $sp, $sp, 4
.end_macro

.macro popreg ($arg)
	addi $sp, $sp, 4
	lw $arg, 0 ($sp)
.end_macro

# Usage: lwi (<reg>, <upper imm>, <lower imm>)
.macro lwi ($reg, $ui, $li)
	lui $reg, $ui
	ori $reg, $reg, $li
.end_macro