
# -----------------------------------------------------
# Data Declarations
.data
sum:    .space  4   # Used to store result.
arr     .word   3, 6, 7, 10, 12, 2, 3, 6, 5, 7, 10, 9, 2


LENGTH = 13
SYS_EXIT = 10
# -----------------------------------------------------
# text/code section
.text
.global main
main:

exit:
    li 

la $a0, arr     # Let $a0 hold a reference to the array.
li $t0, 0       # Let $t0 hold the counter.
li $t2, 0       # Let $t2 hold the sum.
li $t1, LENGTH  # Let $t1 hold the length.
li $t4, 4       # Let $t4 hold the size of data (Part of the first solution).
sumLoop:
    # add ebx, dword[rdi + 4 * rax]

    # First solution for array addressing.
    # mul $t5, $t0, $t4
    # add $t6, #a0, $t5
    # lw $tx, ($t6)

    lw $t3, ($t0)
    add $t2, $t2, $t3       # Sum += arr[i]


    addi $a0, $a0, 4        # Take the array address and shift 4 bytes right.
    addi $t0, $t0, 1        # $t0++
    bltu $t0, $t1, sumLoop  # Branch to sumLoop if $t0 < $t1



