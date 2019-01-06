#lab2.s
#Francisco Prado

.data
eh:
   .space 10000000000

Message:
   .ascii "Passing your class : \0"
Message2: 
   .ascii "Runing to class    : \0"
Message3:
   .ascii "Walking slow       :\0"
space:
   .ascii "\n\0"  
q1:
   .ascii "How many students passed their class?\n\0"
q2:
   .ascii "How many students ran to class?\n\0"
q3:
   .ascii "how many students walked to slow?\n\0"
Total:
   .ascii "Grifindor gained \0"
Points:
   .ascii " points!\n\0"


.text
.global _start

_start:
   mov $0, %rbx
   mov $0, %rcx
   mov $0, %rdx

   mov $Message, %rax
   call PrintCString
   mov $20, %rax
   call PrintInt
   mov $space, %rax
   call PrintCString
   
   
   mov $Message2, %rax
   call PrintCString
   mov $7, %rax
   call PrintInt
   mov $space, %rax
   call PrintCString

   mov $Message3, %rax
   call PrintCString
   mov $-6, %rax
   call PrintInt
   mov $space, %rax
   call PrintCString
   call PrintCString

   mov $q1, %rax
   call PrintCString
   call ScanInt
   add %rax, %rbx   

   mov $q2, %rax
   call PrintCString
   call ScanInt
   add %rax, %rcx

    mov $q3, %rax
   call PrintCString
   call ScanInt
   add %rax, %rdx

   mov $Total, %rax
   call PrintCString
   
   mov $0, %rax
   imul $20, %rbx
   add %rbx, %rax
   imul $7, %rcx
   add %rcx,%rax
   imul $-6, %rdx
   add %rdx, %rax

   call PrintInt
   mov $Points, %rax
   call PrintCString


   call EndProgram
