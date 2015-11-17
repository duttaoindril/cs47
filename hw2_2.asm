#$t0 is general use number
#=========================
#$a1 is index of var_a
#$a2 is index of var_b
#$a3 is index of var_c
#=========================
#$s1 is length of var_a
#$s2 is length of var_b
#=========================
#$t1 is var_a
#$t2 is var_b
#$t3 is var_c
#=========================
.include    "cs47_macro.asm"

.data
.align 2
var_a: .word 2 3 5 5 8 10 11 17 18 20 
var_b: .word 5 6 7 8 14 15 17
var_m: .word 10
var_n: .word 7
var_c: .word 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
newl:  .asciiz "\n"

.text
.globl start
start:
	add $a1, $zero, $zero #index of var_a
	add $a2, $zero, $zero #index of var_b
	add $a3, $zero, $zero #index of var_c

	lw $s1, var_m #length of var_a
	lw $s2, var_n #length of var_b

loopcheck:
	sub $t0, $s1, $a1 #If index of a < length of a...
	bgtz $t0, check #Jump to second check, else...
	
	sub $t0, $s2, $a2 #If index of b < length of b...
	bgtz $t0, addbtoc #Jump to add b to c as a is empty, else...

	blez $t0, bbye #Since both arrays are empty, exit.
check:
	sub $t0, $s2, $a2 #Since a is not empty, and if index of b < length of b...
	bgtz $t0, looproutine #Jump to routine, else...

	j addatoc #Since a is not empty, and b is empty, add a to c.

looproutine:
	la  $t1, var_a #Load var_a array into $t1.
	mul $t0, $a1, 4 #Get pointer reference by mult index by 4.
	add $t0, $t1, $t0 #Go to the index from pointer in array.
	lw  $t1, ($t0) #Get value from index in var_a, store into $t1.
	#Loaded val of var_a at current index of $a1 into $t1

	la  $t2, var_b #Load var_b array into $t2.
	mul $t0, $a2, 4 #Get pointer reference by mult index by 4.
	add $t0, $t2, $t0 #Go to the index from pointer in array.
	lw  $t2, ($t0) #Get value from index in var_b, store into $t2.
	#Loaded val of var_b at current index of $a2 into $t2

	sub $t0, $t1, $t2
	bgtz $t0, addbtoc
	blez $t0, addatoc
	#If a-b is greater than 0, a is bigger add b to c, else a is smaller, add a to c
	
addbtoc:
	move $t4, $t2
	add $a2, $a2, 1 #add 1 to index of var_b
	j addtoc
	
addatoc:
	move $t4, $t1
	add $a1, $a1, 1 #add 1 to index of var_a
	j addtoc
	
addtoc:
	la  $t3, var_c
	mul $t0, $a3, 4
	add $t0, $t3, $t0
	sw $t4, ($t0) #stores the value $t4 from the merge logic into $t3 ($t0)
	add $a3, $a3, 1 #index of var_c
	j loopcheck

bbye:
	li $v0, 10
	syscall