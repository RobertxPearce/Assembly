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
sign       db   0            ; Variable for result.

arrInts     dd  3, 5, 6, 7, 10, 12, -1, 9, 8
length      dd  8
sum         dd  0

;-------------------------------------------------------
; Code Section
section .text

global _start   ; Entry point for the program.
_start:

; Loop to count to 10.
mov al, byte[ten]           ; Move ten to al register for loop control.
countToTen:                 ; Loop label.
    inc byte[sumToTen]      ; Increment variable.
    cmp [sumToTen], al      ; Compare variable to LCV.
    jl countToTen           ; If variable is less than ten jump to label.
mov al, 0                   ; Clear register.


; Conditions to check if number is positive, negative, or zero.
mov al, byte[num]           ; Move (sign extended) num to register.

cmp al, 0                   ; Check num against 0.
jle notPositiveCase         ; Jump to label if num is less than 0.
    mov byte[sign], 1       ; Else move 1 to sign var.
    jmp doneWithSign        ; Jump to end (no comparison).
notPositiveCase:            ; Jump label if value not positive.
je notNegativeCase          ; Jump to label if num is not greater than 0.
    mov byte[sign], -1      ; Else move -1 to sign var.
    jmp doneWithSign        ; Jump to end (no comparison).
notNegativeCase:            ; Jump label if value not negative.
    mov byte[sign], 0       ; If no other cases are meant num is 0.
doneWithSign:               ; Last jump label.


; For loop example summing an array.
; int sum = 0;
; for (int i = 0; i < length; i++)
;   sum += arr[i]

mov eax, 0      ; Let eax represent the sum.
mov rbx, 0      ; Let ebx represent i (int i = 0).
forLoop:
    add eax, dword[arrInts + 4 * rbx]    ; sum += arr[i] arrInts is the start address - 4 is the data size - rbx is the index
    inc ebx         ; i++
cmp ebx, length ; Compare i against length.
jl forLoop      ; If i < length, jump back to the beginning of the loop.
mov dword[sum], eax     ; Store array sum into memory.

;-------------------------------------------------------
; Terminate Program
last:
    mov rax, SYS_exit       ; Call code for exit.
    mov rdi, EXIT_SUCCESS   ; Exit program with success.
    syscall
