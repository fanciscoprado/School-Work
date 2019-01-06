.data
Message:
   .space 40
.text
.global _start
_start:

   mov $Message, %rax
   mov $0, %rdi
   movb $92, Message(%rdi)

   call EndProgram
