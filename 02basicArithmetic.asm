;-----------------------
; Robert Pearce
; 06/10/2024

; Assemble the file with:
; yasm -f elf64 -g dwarf2 -o 02basicArithmetic.o 02basicArithmetic.asm

; Link the program with:
; ld -m elf_x86_64 -o 02basicArithmetic 02basicArithmetic.o

; Debug with:
; ddd 02basicArithmetic

;-------------------------------------------------------
; BSS (Block Start Symbol) Uninitialized Data Section
section .bss

sum               resb 1   ; Reserve byte for sum.
dif               resb 1   ; Reserve byte for difference.
prod              resb 1   ; Reserve byte for product.
signedProd        resb 1   ; Reserve byte for signed product
quotient          resb 1   ; Reserve byte for quotient.
remainder         resb 1   ; Reserve byte for remainder.
signedQuotient    resb 1   ; Reserve byte for signed quotient.
signedRemainder   resb 1   ; Reserve byte for signed remainder.

;-------------------------------------------------------
; Data Initialized Variable Declarations
section .data

EXIT_SUCCESS    equ 0   ; Successful Operation
SYS_exit        equ 60  ; Call Code for Terminate

num1    db  10  ; Initialize byte for 1st int.
num2    db  5   ; Initialize byte for 2nd int.
num3    db  -10 ; Initialize byte for 3rd int.

;-------------------------------------------------------
; Code Section
section .text

global _start   ; Entry point for the program.
_start:

; Addition : add <dest>, <src>
mov rax, 0          ; Clear rax register.
mov al, [num1]      ; Move num1 to register.
add al, [num2]      ; Add num1 (in al) too num2.
mov [sum], al       ; Move answer to sum.

; Subtraction : sub <dest>, <src>
mov rax, 0          ; Clear rax register.
mov al, [num1]      ; Move num1 to register.
sub al, [num2]      ; Subtract num2 from num1 (in al).
mov [dif], al       ; Move answer to variable.

; Multiplication : mul <src>
mov rax, 0          ; Clear rax register.
mov al, [num1]      ; Move num1 into register.
mul byte [num2]     ; Multiply al by num2, answer in ax.
mov [prod], al      ; Move lower byte of answer to variable.

; Signed Multiplication : imul <source>
mov rax, 0               ; Clear rax register.
movsx rax, byte [num3]   ; Move num3 into rax register with sign extension.
imul byte [num1]         ; Multiply al by num1, answer in ax.
mov [signedProd], ax     ; Move answer from ax to variable.

; Division : div <src>
mov rax, 0          ; Clear rax register.
mov al, [num1]      ; Move num1 into al (lower part of ax).
cbw                 ; Convert byte in al to word in ax.
div byte[num2]      ; Divide al by num2, quotient in al, remainder in ah.
mov [quotient], al  ; Move quotient to variable.
mov [remainder], ah ; Move remainder to variable.

; Signed Division : idiv <src>


;-------------------------------------------------------
; Terminate Program
last:
    mov rax, SYS_exit       ; Call code for exit.
    mov rdi, EXIT_SUCCESS   ; Exit program with success.
    syscall
