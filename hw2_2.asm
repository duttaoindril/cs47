#m = 6
#n = 7
#var_a m: 1 3 6 8 23 32
#var_b n: 2 4 7 9 24 33 41
#var_c 1 3 6 8 23 32 2 4 7 9 24 33 41 before merge sort
#var_c 1 2 3 4 6 7 8 9 23 24 32 33 41 after merge sort
.include    "cs47_macro.asm"

.data
prompta: .asciiz "Please enter the length of var_a: "
promptb: .asciiz "Please enter the length of var_b: "
promptc: .asciiz "You can't have a negative length dummy. Try again: "
newl:  .asciiz "\n"

.text
.globl start
start:
	print_str(prompta)
	read_int($a1)
    	bltz $a1, bzzz
	print_str(newl)
	print_str(promptb)
	read_int($a2)
	bltz $a2, bzzz
	print_str(newl)
	generateArray($t1, $a1)
	generateArray($t2, $a2)
	exit

bzzz:
	print_str(promptc)
	j   begin