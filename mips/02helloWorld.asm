# ----------------------------------------
# Data declarations go in this section.

.data

msg:     .asciiz     "Hello World!\n"

# ----------------------------------------
# Program code goes in this section.
.text
.globl  main
.ent    main
main:

# -----
# your program code goes here.

li $v0, 4       # Load call code into register.
la $a0, msg     # Load address into first param register.
syscall         # Make syscall.

# -----
# Done, terminate program.

    li $v0, 10
    syscall
.end main