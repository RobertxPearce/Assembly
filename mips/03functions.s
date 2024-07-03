#------------------------- Data section ------------------------- 
.data
n:		.space	4	#Used to store result
m:		.space	4	
p:		.space	4
w:		.word	2
x:		.word	4
y:		.byte	5
z:		.half	6
s:		.asciiz	"Hello World\n"
arr:	.word	4, 5, 6, 7, 9
uninit:	.space	4				#Create 4 bytes of uninitialized space

LENGTH = 5						#Creates a constant of 5 (used as literal in code)	
SYS_EXIT = 10

#------------------------- Data section ------------------------- 
.text
.globl main
main:

#Compute n = x + w
lw $t0, x
lw $t1, w
add $t0, $t0, $t1
sw $t0, n

#Compute m = x - w
lw $t0, x
lw $t1, w
sub $t0, $t0, $t1
sw $t0, m

#Compute p = x * w
lw $t0, x
lw $t1, w
mul $t0, $t0, $t1
sw $t0, p

exit:
    li $v0, SYS_EXIT              	# terminate program run and
    syscall                      	# Exit 
	jr $ra #Finish main