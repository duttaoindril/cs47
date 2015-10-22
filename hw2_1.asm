.include    "cs47_macro.asm"

.data
prompta: .asciiz "Please enter a positive integer: "
promptb: .asciiz "A number greater than 0. It's Elementary School, Watson.\n"
resulta: .asciiz "You're answer is: "
resultb: .asciiz "On Index "
resultc: .asciiz " fibs are "
resultd: .asciiz ", "
newl:   .asciiz "\n"

.text
begin:
	print_str(prompta)
	read_int($a1)
	addi $t2, $zero, 2
	div $a1, $t2
	mflo $a1
	mfhi $t2
	print_str(newl)
	bltz $a1, bzzz
	addi $t0, $zero, 0
	addi $t1, $zero, 1
	#print_str(resultb)
	#print_reg_int($a1)
	#print_str(resultc)
	#print_reg_int($t0)
	#print_str(resultd)
	#print_reg_int($t1)
	#print_str(newl)
	addi $sp, $sp, -4
	sw $t0, ($sp)
	addi $sp, $sp, -4
	sw $t1, ($sp)

	addi $a1, $a1, -1
fibloop:
	add $t0, $t0, $t1
	add $t1, $t1, $t0
	#print_str(resultb)
	#print_reg_int($a1)
	#print_str(resultc)
	#print_reg_int($t0)
	#print_str(resultd)
	#print_reg_int($t1)
	#print_str(newl)
	addi $sp, $sp, -4
	sw $t0, ($sp)
	addi $sp, $sp, -4
	sw $t1, ($sp)

	addi $a1, $a1, -1
	bgez $a1, fibloop
	move $sp, $t1
done:
	beqz $t2, other
	print_str(resulta)
	print_reg_int($t1)
	j news
other:
	print_str(resulta)
	print_reg_int($t0)
news:
	print_str(newl)
	print_str(newl)
	j begin
	
bzzz:
	print_str(promptb)
	j   begin
