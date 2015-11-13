<<<<<<< HEAD
#$t0 is general use number
#======================
#$a1 is index of var_a
#$a2 is index of var_b
#$a3 is index of var_c
#======================
#$s1 is length of var_a
#$s2 is length of var_b
#======================
#$t1 is var_a
#$t2 is var_b
#$t3 is var_c
#======================
=======
#m = 6
#n = 7
#var_a m: 1 3 6 8 23 32
#var_b n: 2 4 7 9 24 33 41
#var_c 1 3 6 8 23 32 2 4 7 9 24 33 41 before merge sort
#var_c 1 2 3 4 6 7 8 9 23 24 32 33 41 after merge sort
>>>>>>> 9e314b719b0715c9518e8aaf7e3669725218b719
.include    "cs47_macro.asm"

.data
.align 2
<<<<<<< HEAD
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
    sub $t0, $s1, $a1
    bgez $t0, check

    sub $t0, $s2, $a2
    bgez $t0, addbtoc

    blez $t0, bbye
check:
    sub $t0, $s2, $a2
    bgez $t0, looproutine

    sub $t0, $s1, $a1
    bgez $t0, addatoc

    blez $t0, bbye

looproutine:

    add $t0, $zero, $zero #t0 = 0, index of var_a
    la  $t1, var_a #loads the array var_a into t1
    mul $t3, $t0, 4 #multiply the index by 4 to know which address to point to
    add $t2, $t1, $t3 # load into t2 the value of the number at index $t0 ^
    lw  $t4, ($t2) #Load the actual value into $t4 for comparison later on

    #Do the above again for var_b

    add $t5, $zero, $zero # $t0 = 0, index of var_b
    la  $t6, var_c
    mul $t8, $t5, 4
    add $t7, $t6, $t8
    sw $a1, ($t7) #stores the value that we assign from the merge logic into $t6

bbye:
    exit


.include    "cs47_macro.asm"

.data
.align 2
var_a: .word 2 3 5 5 8 10 11 17 18 20
var_b: .word 5 6 7 8 14 15 17
var_m: .word 10
var_n: .word 7
var_c: .word 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
=======
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
>>>>>>> 9e314b719b0715c9518e8aaf7e3669725218b719
newl:  .asciiz "\n"

.text
.globl start
start:
<<<<<<< HEAD
    add $a1, $zero, $zero #index of var_a
    add $a2, $zero, $zero #index of var_b
    add $a3, $zero, $zero #index of var_c

    lw $s1, var_m #length of var_a
    lw $s2, var_n #length of var_b

loopstart:
    sub $t0, $s1, $a1
    bgez $t0, check
    if m-a is greater than 0
        jump check

    sub $t0, $s2, $a2
    bgez $t0, addbtoc
    if n-b is greater than 0
        simply add one var_b val into var_c

    blez $t0, exit
    if n-b is <= 0
        exit

check:
    sub $t0, $s2, $a2
    bgez $t0, looproutine
    if n-b is greater than 0
        jump looproutine

    sub $t0, $s1, $a1
    bgez $t0, looproutine
    if m-a is greater than 0
        simply add one var_b val into var_c

    blez $t0, exit
    if n-b is <= 0
        exit

looproutine:

#$t0 is general use number

#$a1 is index of var_a
#$a2 is index of var_b
#$a3 is index of var_c

#$s1 is length of var_a
#$s2 is length of var_b

#$t1 is var_a
#$t2 is var_b
#$t3 is var_c

    la  $t1, var_a
    mul $t0, $a1, 4
    add $t0, $t1, $t0
    lw  $t1, ($t0)
    #Loaded a into $t1

    la  $t2, var_b
    mul $t0, $a2, 4
    add $t0, $t2, $t0
    lw  $t2, ($t0)
    #Loaded b into $t2



    if reg1 > reg2
        add b into c
    else
        add a into c

addbtoc:

addatoc:

exit:
    li $v0, 10
    syscall

    add $t5, $zero, $zero # $t0 = 0, index of var_b
    la  $t6, var_c
    mul $t8, $t5, 4
    add $t7, $t6, $t8
    sw $a1, ($t7) #stores the value that we assign from the merge logic into $t6
=======
	#$a1 is the first index for var_a index
	#$a2 is the first index for var_b index
	#$a3 is the first index for var_c index
	
	#$a4 is the value at index $a1 at var_a	 

	

mergeloop:

	lw $t1, var_m
	
	
	
	
	
	
	
	
>>>>>>> 9e314b719b0715c9518e8aaf7e3669725218b719
