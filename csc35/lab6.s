#Francisco Prado
#lab 6


.data

Hello:
   .ascii "Hello World\n"
MyName:
   .ascii "My name is Francisco Prado\n"
Plans:
   .ascii "I dont't talk trash, I talk smack\n"
.text

.global _start

_start:
#Hello World
   mov $1, %rax
   mov $1, %rdi
   mov $Hello, %rsi
   mov $12, %rdx
   syscall

#My Name is
   mov $1, %rax
   mov $1, %rdi
   mov $MyName, %rsi
   mov $27, %rdx
   syscall
#quote
   mov $1, %rax
   mov $1, %rdi
   mov $Plans, %rsi 
   mov $34, %rdx
   syscall
#EndProgram
   mov $60, %rax
   syscall
