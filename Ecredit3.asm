#$t0 is general use number
#======================
#$a3 is index of var_a
#======================
#$s1 is length of var_a, var_m
#======================
#$t1 is var_a
#======================
#$a1 & $a2 are arguments for GCD & LCM
#======================
#$t5 & $v1 are outputs from GCD & LCM
#======================
.include "cs47_macro.asm"

.data
.align 2
var_a: .word 2 3 5 5 5 6 7 8 8 10 11 14 15 17 17 18 20 
var_m: .word 17
gcdstr: .asciiz "GCD of array is: "
lcmstr: .asciiz "LCM of array is: "
newl:  .asciiz "\n"

.text
.globl start
start:
	add $t4, $zero, $zero
	add $a1, $zero, 5
	add $a2, $zero, 10
gcd:
	sub $t0, $a1, $a2
	beqz $t0, gcdA
	bgtz $t0, gcdB
	bltz $t0, gcdC
gcdA:
	move $t5, $a1
	bgtz $t4, resumelcm
	j lcm
gcdB:
	sub $a1, $a1, $a2
	j gcd
gcdC:
	sub $a2, $a2, $a1
	j gcd
lcm:
	add $t4, $zero, 1
	add $a1, $zero, 5
	add $a2, $zero, 10
	j gcd
resumelcm:
	add $a1, $zero, 5
	add $a2, $zero, 10
	add $v1, $t5, $zero
	div $t4, $a1, $t5
	mul $v1, $v1, $t4
	div $t4, $a2, $t5
	mul $v1, $v1, $t4
bbye:
	print_str(gcdstr)
	print_reg_int($t5)
	print_str(newl)
	print_str(lcmstr)
	print_reg_int($v1)
	print_str(newl)
	li $v0, 10
	syscall