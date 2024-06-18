;-----------------------
; Robert Pearce
; 06/18/2024

;-------------------------------------------------------
; BSS (Block Start Symbol) Uninitialized Data Section
section .bss



;-------------------------------------------------------
; Data Initialized Variable Declarations
section .data



EXIT_SUCCESS    equ 0   ; Exit code for success.
SYS_exit        equ 60  ; Syscall code for terminating program.

;-------------------------------------------------------
; Code Section
section .text

global _start
_start:



;-------------------------------------------------------
; Terminate Program
last:
    mov rax, SYS_exit       ; Load the syscall code for terminating the program.
    mov rdi, EXIT_SUCCESS   ; Load the exit value for the program into rdi.
    syscall
