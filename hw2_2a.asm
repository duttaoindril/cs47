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
