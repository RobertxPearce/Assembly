; Assemble the file with:
; yasm -f elf64 -g dwarf2 -o 03controlStructures.o 03controlStructures.asm

; Link the program with:
; ld -m elf_x86_64 -o 03controlStructures 03controlStructures.o

; Debug with:
; ddd 03controlStructures

;--------------------------------
; Initialized Data Section
section .data

EXIT_SUCCESS    equ 0   ; Successful Operation
SYS_exit        equ 60  ; Call Code for Terminate


;--------------------------------
; Uninitialized Data Section
section .bss


;--------------------------------
; Code Section
section .text

global _start   ; Entry point for the program.
_start:


;--------------------------------
; Terminate Program
last:
    mov rax, SYS_exit       ; Call code for exit.
    mov rdi, EXIT_SUCCESS   ; Exit program with success.
    syscall
