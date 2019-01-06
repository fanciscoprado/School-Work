#Francisco Prado
#Lab4.s


.data
Intro:  
   .ascii "Welcome to guess that number!\n\0 "
low:
   .ascii "You guessed to low!\n\0"
high:
   .ascii "You guessed to high!\n\0"
right:
   .ascii "Correct! It took you a total of \0"
try:
   .ascii " guesses!\n\0"
Enter:
   .ascii "Enter your guess\n\0"


.text

.global _start


_start:
   mov $0, %rcx
   mov $101, %rax
   call Random
   mov %rax, %rbx
   mov $Intro, %rax
   call PrintCString

loop:
   add $1, %rcx
   mov $Enter, %rax
   call PrintCString 
   call ScanInt
   cmp %rax, %rbx
   je Correct
   jg Low
   jl High

Correct:
   mov $right, %rax
   call PrintCString
   mov %rcx, %rax
   call PrintInt
   mov $try, %rax
   call PrintCString
   call EndProgram


High:
   mov $high, %rax
   call PrintCString
   jmp loop

Low:
   mov $low, %rax
   call PrintCString
   jmp loop

