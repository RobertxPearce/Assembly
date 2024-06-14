;-----------------------
; Robert Pearce
; 06/10/2024

;-------------------------------------------------------
; BSS (Block Start Symbol) Uninitialized Data Section
section .bss

; A macro which takes the average of an array.
; Create a macro called "findAverage" with 2 arguments.
; Argument 1 is the reference to the array.
; Argument 2 is the length by value of the array.
%macro findAverage 2

    mov rax, 0
    mov rbx, 0
    %%forLoop:
        add ax, word[%1 + 2 * rbx]
        inc rbx
    cmp rbx, %2     ; Compare rbx against against argument 2 (the length).
    jl %%forLoop
    div %2          ; Divide by argument 2 (the length).

%endmacro

;-------------------------------------------------------
; Data Initialized Variable Declarations
section .data

arr1    dw      4, 5, 10, 12, 3, 6, 9
arr2    dw      3, 7, 10, 8, 5, 3, 2, 1, 1, 10
arr3    dw      1, 2, 100, 9, 19

LENGTH1 equ 7
LENGTH2 equ 10
LENGTH3 equ 5

EXIT_SUCCESS    equ 0   ; Exit code for success.
SYS_exit        equ 60  ; Syscall code for terminating program.

;-------------------------------------------------------
; Code Section
section .text

global _start
_start:

findAverage arr1, LENGTH1
findAverage arr2, LENGTH2
findAverage arr3, LENGTH3


;-------------------------------------------------------
; Terminate Program
last:
    mov rax, SYS_exit       ; Load the syscall code for terminating the program.
    mov rdi, EXIT_SUCCESS   ; Load the exit value for the program into rdi.
    syscall
