;----------------------------------------
; Initialized Variable Declarations
section .data

; The data section is where initialized data must be
; declared. Variables and constants will be in this
; Section. Data defined here is static and remains
; throughout the program execution.

; Example of defining a string.
hello   db  'Hello, world!'

; Example of defining an integer.
num     db  10

;----------------------------------------
; Uninitialized Data Section
section .bss

; The bss section is where uninitialized data must be
; declared.


;----------------------------------------
; Code Section
section .text

global _start
_start:

; The code is places under the text section.
; This section contains the executable instructions
; of the program. There are headers and lebels used
; to define the initial entry point of the program
; and various other code segments.


;----------------------------------------
; Terminate Program
last:
