; Assemble the file with:
; yasm -f elf32 -g dwarf2 -o arithmetic.o arithmetic.asm

; Link the program with:
; ld -m elf_i386 -o arithmetic arithmetic.o

; Debug with:
; ld -m elf_i386 -o arithmetic arithmetic.o


; Initialized Data Section
section .data

num1    db  10  ; Initialize byte for 1st int.
num2    db  5   ; Initialize byte for 2nd int.

;--------------------------------
; Uninitialized Data Section
section .bss

sum         resb 1   ; Reserve byte for sum.
dif         resb 1   ; Reserve byte for difference.
prod        resb 1   ; Reserve byte for product.
quotient    resb 1   ; Reserve byte for quotient.
remainder   resb 1   ; Reserve byte for remainder.


;--------------------------------
; Code Section
section .text

global _start   ; Entry point for the program.
_start:

; Addition add <dest>, <src>
mov al, [num1]      ; Move num1 to register.
add al, [num2]      ; Add num1 (in sum) too num2.
mov [sum], al       ; Move answer to sum.


; Subtraction



; Multiplication



; Division

;--------------------------------
; Terminate Program
last: