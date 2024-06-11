;-----------------------
; Robert Pearce
; 06/10/2024

;-------------------------------------------------------
; BSS (Block Start Symbol) Uninitialized Data Section
section .bss

; The bss section is where uninitialized data must be
; declared.

x   resw    1   ; This reserves 1 word worth of memory.
arr resd    4   ; This reserves 4 dwords worth of memory.

;-------------------------------------------------------
; Data Initialized Variable Declarations
section .data

; The data section is where initialized data must be
; declared. Variables and constants will be in this
; Section. Data defined here is static and remains
; throughout the program execution.

EXIT_SUCCESS    equ 0   ; Exit code for success.
SYS_exit        equ 60  ; Syscall code for terminating program.

y   dw  5 ; This creates a word and sets it to be 5 in decimal (2 bytes).
z   dw  7 ; Creates a word and sets it to be 7.
m   dd  -100    ; Creates a dword and sets it to -100.
n   dd  40      ; Creates a dword and sets it to 40.
p   dd   0      ; Creates a dword and sets it to 0.
q   dd   0

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

; Calculate x = y + 3
mov ax, word[y] ; Moves y from memory to rax register (grab 2 bytes).
add ax, 3       ; Add 3 to ax and store result in ax. ax = ax + 3
mov word[x], ax ; Move the result from ax to x and access 2 bytes.

; Calculate p = n + m
mov eax, dword[n]   ; Move n into the CPU.
add eax, dword[m]   ; Add eax and m.
mov dword[p], eax   ; Store result in p.

; Calculate p = p - n
mov eax, dword[p]   ; Move p into eax register.
sub eax, dword[n]   ; Subtract eax and n.
mov dword[q], eax   ; Store result in q.

;-------------------------------------------------------
; Terminate Program
last:
    mov rax, SYS_exit       ; Load the syscall code for terminating the program.
    mov rdi, EXIT_SUCCESS   ; Load the exit value for the program into rdi.
    syscall
