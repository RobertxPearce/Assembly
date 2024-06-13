;-----------------------
; Robert Pearce
; 06/10/2024

;-------------------------------------------------------
; BSS (Block Start Symbol) Uninitialized Data Section
section .bss

; The bss section is where uninitialized data must be
; declared.

;-------------------------------------------------------
; Data Initialized Variable Declarations
section .data

; The data section is where initialized data must be
; declared. Variables and constants will be in this
; Section. Data defined here is static and remains
; throughout the program execution.

EXIT_SUCCESS    equ 0   ; Exit code for success.
SYS_exit        equ 60  ; Syscall code for terminating program.

;-------------------------------------------------------
; Code Section
section .text

global _start
_start:

; The code is places under the text section.
; This section contains the executable instructions
; of the program. There are headers and lebels used
; to define the initial entry point of the program
; and various other code segments.

;-------------------------------------------------------
; Terminate Program
last:
    mov rax, SYS_exit       ; Load the syscall code for terminating the program.
    mov rdi, EXIT_SUCCESS   ; Load the exit value for the program into rdi.
    syscall
