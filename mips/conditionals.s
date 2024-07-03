#------------------------- Data section ------------------------- 
.data
sum:		.space	4	#Used to store result
arr:		.word	3, 6, 7, 10, 12, 2, 3, 6, 5, 7, 10, 9, 2
sign:		.space	1
x:			.word	4

LENGTH = 13				#Creates a constant of 13 (used as literal in code)	
SYS_EXIT = 10

#------------------------- Data section ------------------------- 
.text
.globl main
main:

#Find the sum of all elements in the array and store them in sum
la $a0, arr		#Let $a0 hold a reference to the array
li $t0, 0		#Let $t0 hold the counter
li $t2, 0		#Let $t2 hold the sum
li $t1, LENGTH	#Let $t1 hold the length
#li $t4, 4		#Was part of first solution for array addressing
sumLoop:
	#add ebx, dword[rdi + 4*rax]
	#mul $t5, $t0, $t4		#Was part of first solution for array addressing
	#add $t6, $a0, $t5		#Was part of first solution for array addressing
	#lw $t3, ($t6)			#Was part of first solution for array addressing
	lw $t3, ($a0)
	add $t2, $t2, $t3		#Sum += arr[i]

	addi $a0, $a0, 4		#Take the array address and shift 4 bytes right
	addi $t0, $t0, 1		#$t0++
	bltu $t0, $t1, sumLoop	#Branch to sumLoop if $t0 < $t1

#Code to find the sign of the variable x
#if(x > 0)
#	sign = 1;
#else if (x < 0)
#	sign = -1;
#else
#	sign = 0;

lw $t0, x	#Let $t0 hold x
#blez $t0, notPositive		#Effectively the same as below, uses zero register for branch if z at end
ble	$t0, $zero, notPositive	#if(!(x > 0))
	li $t1, 1				#sign = 1
	b endif					#Branch to the end of the if else if
notPositive:
bge	$t0, $zero, notNegative	#if(!(x < 0))
	li $t1, -1				#sign = -1
	b endif
notNegative:
	move $t1, $zero			#sign = 0
endif:
sw $t1, sign				#sign = $t1 (whatever the if else if got)

exit:
    li $v0, SYS_EXIT              	# terminate program run and
    syscall                      	# Exit 
	jr $ra #Finish main