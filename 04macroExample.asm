;-----------------------
; Robert Pearce
; 06/14/2024

; Assemble the file with:
; yasm -f elf64 -g dwarf2 -o 04macroExample.o 04macroExample.asm

; Link the program with:
; ld -m elf_x86_64 -o 04macroExample 04macroExample.o

; Debug with:
; ddd 04macroExample

;-------------------------------------------------------
; BSS (Block Start Symbol) Uninitialized Data Section
section .bss

; A macro which takes the average of an array.
; Create a macro called "findAverage" with 2 arguments.
; Argument 1 is the reference to the array.
; Argument 2 is the length by value of the array.
; Argument 3 is the variable for the array average.
%macro findAverage 3

    mov rax, 0                      ; Clear rax register for sum.
    mov rbx, 0                      ; Clear rbx register for count.
    %%forLoop:                      ; Loop label (%% in front of label means to generate a unique label for each macro).
        add ax, word[%1 + 2 * rbx]  ; Add value at index to ax.
        inc rbx                     ; Increment index.
    cmp rbx, %2                     ; Compare rbx against against argument 2 (the length).
    jl %%forLoop                    ; Jump to top if count is less than length.
    div %2                          ; Divide by argument 2 (the length).
    mov dword[%3], ax               ; Store answer into third argument.

%endmacro

;-------------------------------------------------------
; Data Initialized Variable Declarations
section .data

; Array Declarations
arr1    dw  4, 5, 10, 12, 3, 6, 9
arr2    dw  3, 7, 10, 8, 5, 3, 2, 1, 1, 10
arr3    dw  1, 2, 100, 9, 19

; Array Length Variables
LENGTH1 equ 7
LENGTH2 equ 10
LENGTH3 equ 5

; Array Average Variables
avg1    dw  0
avg2    dw  0
avg3    dw  0

;---------------------Constants-------------------------

EXIT_SUCCESS    equ 0   ; Exit code for success.
SYS_exit        equ 60  ; Syscall code for terminating program.

;-------------------------------------------------------
; Code Section
section .text

global _start
_start:

; Use macro for array 1 and store answer.
findAverage arr1, LENGTH1, avg1

; Use macro for array 2 and store answer.
findAverage arr2, LENGTH2, avg2

; Use macro for array 2 and store answer.
findAverage arr3, LENGTH3, avg3


;-------------------------------------------------------
; Terminate Program
last:
    mov rax, SYS_exit       ; Load the syscall code for terminating the program.
    mov rdi, EXIT_SUCCESS   ; Load the exit value for the program into rdi.
    syscall
