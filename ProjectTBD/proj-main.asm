.include "./cs47_proj_macro.asm"
.include "./cs47_proj_procs.asm"

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
.globl main
main:
	print_str(prompta)
	read_int($s0)
	print_str(newl)
	print_str(promptb)
	read_int($s1)
	print_str(newl)
	print_str(promptc)
	read_char($s2)
	print_str(newl)
	
	beq $s2, 0x2B, cleared
	beq $s2, 0x2D, cleared
	beq $s2, 0x2A, cleared
	beq $s2, 0x2F, cleared
	beq $s2, 0x71, quit
	beq $s2, 0x51, quit
	j error

cleared:	
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	jal au_normal
	move $s3, $v0
	move $s4, $v1
	
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	jal au_logical
	move $s5, $v0
	move $s6, $v1
	
	beq $s2, 0x2B, report
	beq $s2, 0x2D, report
	beq $s2, 0x2A, report
	beq $s2, 0x2F, additionalreport
	beq $s2, 0x71, quit
	beq $s2, 0x51, quit
	j error

additionalreport:
	print_str(prompti)
	print_reg_int($s4)
	print_str(newl)
	print_str(promptm)
	print_reg_int($s6)
	print_str(newl)

report:
	print_str(promptd)
	print_reg_int($s3)
	print_str(newl)
	print_str(promptl)
	print_reg_int($s5)
	print_str(newl)
	beq $s3, $s5, pass
	print_str(promptk)	
	j restart

pass:
	print_str(promptj)
	j restart

restart:
	print_str(promptg)
	print_str(promptf)
	j main

error:
	print_str(prompte)
	print_str(promptf)
	j main
	
quit:
	print_str(prompth)
	exit