.include "cs47_macro.asm"

.data

#https://gist.github.com/jmc734/6630563
#http://stackoverflow.com/questions/22900985/using-a-random-number-generator-in-mips
#http://stackoverflow.com/questions/3542588/recursive-merge-sort-in-mips-using-stack
#http://cs.uni.edu/~fienup/cs1410f11/homework/hw7.pdf

//merge sort
#BASE CASE
li $t0 , 1          	#t0 = 1
bne $t0 , $t2 , firstL      #((t2 = n) != 1) then go to firstL
lw $t1 , 172($sp)           #t1 = &A
lw $t1 , 0($t1)         #t1 = A[0]
lw $t2 , 176($sp)       #t2 = &B
sw $t1 , 0($t2)         #B[0] = A[0]
#sw $t2 , 176($sp)      #stored &B at the desired position in stack
jr $ra

firstL: 
lw $t8, 172($sp)            #loading &A
sw $t8, -12($sp)            #storing &A at the desired location
add $t8, $sp, $zero         #loading &A1
sw $t8, -8($sp)             #storing &A1 at the desired location
lw $t8, 160($sp)            #loading n1
sw $t8, -4($sp)             #storing n1 at the desired location
addi $sp, $sp, -184         
jal sort 

lw $t8, 172($sp)            #loading &A
lw $t7, 160($sp)            #loading n1
sll $t7 , $t7 , 2           #n1*= 4 for mips address
add $t8 , $t8 , $t7             #adding &A + n1
sw $t8, -12($sp)            #storing &A + n1
addi $t8, $sp, 80           #loading &A2
sw $t8, -8($sp)             #storing A2
lw $t8, 164($sp)            #loading n2
sw $t8, -4($sp)
addi $sp, $sp, -184
jal sort

add $a0, $sp, $zero     #a0 = &A1
addi $a1, $sp, 80   #a1 = &A2
lw $a2, 176($sp)    #a2 = &B
lw $t8, 160($sp)    
sw $t8, -8($sp)     #stored p
lw $t8, 164($sp)
sw $t8, -4($sp)     #stored q
addi $sp, $sp, -12
jal merge
