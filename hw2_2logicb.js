la  $t1, var_a #loads the array var_a into t1
mul $t0, $a1, 4 #multiply the index by 4 to know which address to point to
add $t0, $t1, $t0 # load into t0 the value of the number at index $t0 ^
lw  $t1, ($t0) #Load the actual value into $t4 for comparison later on

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

la  $t3, var_c
mul $t0, $a3, 4
add $t0, $t3, $t0
sw $t4, ($t0) #stores the value $t4 from the merge logic into $t3 ($t0)


if reg1 > reg2
    add b into c
else
    add a into c

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

add $t5, $zero, $zero # $t0 = 0, index of var_b
la  $t6, var_c
mul $t8, $t5, 4
add $t7, $t6, $t8
sw $a1, ($t7) #stores the value that we assign from the merge logic into $t6