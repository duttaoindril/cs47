#======================================
#$t0 is general use number
#======================================
#$t1 is the value at the sorted barrier
#$t2 is the current value
#======================================
#$a1 is the index of the array
#$a2 is the sorted barrier of the sort
#======================================
#$s1 is length of var_a, var_m
#======================================
#$v1 is the index of the current min
#$s2 is the current min
#======================================
.include    "cs47_macro.asm"

.data
.align 2
var_a: .word 8 6 11 17 20 3 2 3 5 5 20 5 6 7 8 15 8 10 11 14 15 17 1
var_m: .word 23
done:  .asciiz "Sorted!\n"
swpng:  .asciiz "Swapping!\n"
sepe:  .asciiz ": "
newl:  .asciiz "\n"

.text
.globl start
start:
	#Initizlize 0
	add $a2, $zero, 0 #sort barrier index of var_a
	#Get the length
	lw $s1, var_m #length of var_a
	
loopcheck:
	#Check if the sorted index reached the length yet
	sub $t0, $s1, $a2 #If sorted index of a < length of a...
	blez $t0, bbye #Jump to second check, else...
	#assign the sorted barrier as the new min
	move $v1, $a2
	#set the index to 0
	move $a1, $a2

looproutine:
	#Check to see if the index is greater than the length, and if it is swap+restart
	sub $t0, $s1, $a1 #If sorted index of a < length of a...
	blez $t0, swap #Jump to second check, else...
	
	#Get the current min
	la  $s2, var_a #Load var_a array into $a2.
	mul $t0, $v1, 4 #Get pointer reference by mult index by 4.
	add $t0, $s2, $t0 #Go to the index from pointer in array.
	lw  $s2, ($t0) #Get value from index in var_a, store into $s2 as min.

	#Get the number at the current index
	la  $t2, var_a #Load var_a array into $t1.
	mul $t0, $a1, 4 #Get pointer reference by mult index by 4.
	add $t0, $t2, $t0 #Go to the index from pointer in array.
	lw  $t2, ($t0) #Get value from index in var_a, store into $t1.

	#See if the current index is smaller than the min
	sub $t0, $s2, $t2
	blez $t0, nomin #If the current number is bigger, then skip assigning the new min
	
	#Set the min to the current index
	move $v1, $a1
nomin:	
	#Add the index and keep moving
	addi $a1, $a1, 1
	j looproutine

swap:
	#Get the current min
	la  $s2, var_a #Load var_a array into $a2.
	mul $t0, $v1, 4 #Get pointer reference by mult index by 4.
	add $t0, $s2, $t0 #Go to the index from pointer in array.
	lw  $s2, ($t0) #Get value from index in var_a, store into $s2 as min.

	#Get the val at the sorted varrier
	la  $t1, var_a #Load var_a array into $a2.
	mul $t0, $a2, 4 #Get pointer reference by mult index by 4.
	add $t0, $t1, $t0 #Go to the index from pointer in array.
	lw  $t1, ($t0) #Get value from index in var_a, store into $s2 as min.
	
	#Put the min at the sorted barrier
	la  $t2, var_a
	mul $t0, $a2, 4
	add $t0, $t2, $t0
	sw $s2, ($t0) #stores the value $s2 from the merge logic into ($t0)	

	#Put the val at the sorted barrier at the min pos
	la  $t2, var_a
	mul $t0, $v1, 4
	add $t0, $t2, $t0
	sw $t1, ($t0) #stores the value $t1 from the merge logic into ($t0)	
	
	add $a2, $a2, 1 #Add to the sorted barrier
	j loopcheck

bbye:
	add $a1, $zero, $zero
	print_str(done)

print:
	sub $t0, $s1, $a1 #If sorted index of a < length of a...
	blez $t0, exit #Jump to second check, else...		
	la  $a2, var_a #Load var_a array into $a2.
	mul $t0, $a1, 4 #Get pointer reference by mult index by 4.
	add $t0, $a2, $t0 #Go to the index from pointer in array.
	lw  $a2, ($t0) #Get value from index in var_a, store into $s2 as min.
	print_reg_int($a1)
	print_str(sepe)
	print_reg_int($a2)
	print_str(newl)
	add $a1, $a1, 1
	j print

exit:
	li $v0, 10
	syscall