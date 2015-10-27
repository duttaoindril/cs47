#m = 6
#n = 7
#var_a m: 1 3 6 8 23 32
#var_b n: 2 4 7 9 24 33 41
#var_c 1 3 6 8 23 32 2 4 7 9 24 33 41 before merge sort
#var_c 1 2 3 4 6 7 8 9 23 24 32 33 41 after merge sort
.include    "cs47_macro.asm"

.data
.align 2
#------ Test 1 ------#
var_a: .word 2 3 5 5 8 10 11 17 18 20 
var_b: .word 5 6 7 8 14 15 17
var_m: .word 10
var_n: .word 7

## Expected sequence in this location - 2 3 5 5 5 6 7 8 8 10 11 14 15 17 17 18 20
var_c: .word 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

prompta: .asciiz "Please enter the length of var_a: "
promptb: .asciiz "Please enter the length of var_b: "
promptc: .asciiz "You can't have a negative length dummy. Try again: "
newl:  .asciiz "\n"

.text
.globl start
start:
	#$a1 is the first index for var_a index
	#$a2 is the first index for var_b index
	#$a3 is the first index for var_c index
	
	#$a4 is the value at index $a1 at var_a	 

	

mergeloop:

	lw $t1, var_m
	
	
	
	
	
	
	
	