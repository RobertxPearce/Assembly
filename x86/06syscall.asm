;-----------------------
; Robert Pearce
; 06/18/2024

;-------------------------------------------------------
; BSS (Block Start Symbol) Uninitialized Data Section
section .bss



;-------------------------------------------------------
; Data Initialized Variable Declarations
section .data

msg     db      "Hello World", 0
LENGTH  equ     12

;---------------------Constants-------------------------

EXIT_SUCCESS    equ 0   ; Exit code for success.
SYS_exit        equ 60  ; Syscall code for terminating program.

STDOUT          equ 1   ; Standard out will always be constant 1. (cout)
SYS_WRITE       equ 1

;-------------------------------------------------------
; Code Section
section .text

global _start
_start:

mov rax, SYS_WRITE  ; Put the call code for writing into rax for syscall.
mov rdi, STDOUT     ; First argument is where to write to.
mov rsi, msg        ; Second argument is address of string.
mov rdx, LENGTH     ; Third argument is length of string (optional if null-terminated).
syscall             ; Call the system function.

;-------------------------------------------------------
; Terminate Program
last:
    mov rax, SYS_exit       ; Load the syscall code for terminating the program.
    mov rdi, EXIT_SUCCESS   ; Load the exit value for the program into rdi.
    syscall

