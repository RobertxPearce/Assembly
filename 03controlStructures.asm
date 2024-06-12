;-----------------------
; Robert Pearce
; 06/10/2024
; Program demonstrating the use of loops, conditional statements, and branching.

; Assemble the file with:
; yasm -f elf64 -g dwarf2 -o 03controlStructures.o 03controlStructures.asm

; Link the program with:
; ld -m elf_x86_64 -o 03controlStructures 03controlStructures.o

; Debug with:
; ddd 03controlStructures

;-------------------------------------------------------
; BSS (Block Start Symbol) Uninitialized Data Section
section .bss

;-------------------------------------------------------
; Data Initialized Variable Declarations
section .data

EXIT_SUCCESS    equ 0   ; Successful Operation
SYS_exit        equ 60  ; Call Code for Terminate

ten         db  10           ; Variable for loop control.
sumToTen    db   0           ; Variable for loop counting to ten.

num         db  -3           ; Variable for conditional checks.
isPNZ       db   0           ; Variable for result.

;-------------------------------------------------------
; Code Section
section .text

global _start   ; Entry point for the program.
_start:

; Loop to count to 10.
mov al, byte[ten]           ; Move ten to al register for loop control.
countToTen:                 ; Loop label.
    inc [sumToTen]          ; Increment variable.
    cmp [sumToTen], al      ; Compare variable to LCV.
    jl countToTen           ; If variable is less than ten jump to label.
mov al, 0                   ; Clear register.


; Conditions to check if number is positive, negative, or zero.
movsx al, byte[num]         ; Move (sign extended) num to register.

cmp al, 0
jl isNeg
    mov byte[isPNZ], -1
    isNeg:
je isZero
    mov byte[isPNZ], 0
    isZero:
je isPos
    mov byte[isPNZ], 1
    isPos:


;-------------------------------------------------------
; Terminate Program
last:
    mov rax, SYS_exit       ; Call code for exit.
    mov rdi, EXIT_SUCCESS   ; Exit program with success.
    syscall
