;-----------------------
; Robert Pearce
; 06/17/2024

;-------------------------------------------------------
; BSS (Block Start Symbol) Uninitialized Data Section
section .bss



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

EXIT_SUCCESS    equ 0   ; Exit code for success.
SYS_exit        equ 60  ; Syscall code for terminating program.

;-------------------------------------------------------
; Code Section
section .text

global _start
_start:

mov rdi, arr1       ; Load a reference (a pointer) to the array.
mov rsi, LENGTH1    ; Load the length by value.
call findAverage    ; Call the funciton (jump to the findAverage label).
mov word[avg1], ax  ; Store the return value into the average variable.

mov rdi, arr2       ; Load a reference (a pointer) to the array.
mov rsi, LENGTH2    ; Load the length by value.
call findAverage    ; Call the funciton (jump to the findAverage label).
mov word[avg2], ax  ; Store the return value into the average variable.

mov rdi, arr3       ; Load a reference (a pointer) to the array.
mov rsi, LENGTH3    ; Load the length by value.
call findAverage    ; Call the funciton (jump to the findAverage label).
mov word[avg3], ax  ; Store the return value into the average variable.

;-------------------------------------------------------
; Terminate Program
last:
    mov rax, SYS_exit       ; Load the syscall code for terminating the program.
    mov rdi, EXIT_SUCCESS   ; Load the exit value for the program into rdi.
    syscall


; Function which takes the average of an array.
; int findAverage(in arr[], in length)
; Argument 1 is the reference to the array (rdi).
; Argument 2 is the length by value of the array (rsi).
; Return value (the average) is in rax.
findAverage:
    mov rax, 0
    mov rbx, 0
    forLoop:
        add ax, word[rdi + 2 * rbx]
        inc rbx
        cmp rbx, rsi
        jl forLoop
    div si    ; Answer in rax per calling convention.
ret ; Return statement out of function.