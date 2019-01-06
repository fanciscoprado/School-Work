#lab3.s
#Francisco Prado

.data
Message:
   .ascii "What southpark hero are you?\n \0"
  
q1:
   .ascii "Do you like wearing masks?(1=yes 2=no)  \n\0"
q2:
   .ascii "do you find yourself controling power tools? (1=yes 2=no) \n\0"
q3:
   .ascii "Are you incapable of dying?(1=yes 2=no)\n\0"
craig:
   .ascii "You are Super Craig! \n\0"
coon:
   .ascii "Congrats you are the Coon! \n\0"
toool:
   .ascii "Congrats you are ToolShed! \n\0"
myst:
   .ascii "Congrats you are Mysterion\n\0"

.text
.global _start

_start:

   mov $Message, %rax
   call PrintCString
   mov $q1, %rax
   call PrintCString
   call ScanInt
   cmp $1,%rax
   je Myst
   mov $q2,%rax
  call PrintCString
   call ScanInt
   cmp $1,%rax
   je tool
   mov $craig, %rax
   call PrintCString
   call EndProgram



tool:   
   mov $toool, %rax  
   call PrintCString
   call EndProgram
Myst:
   mov $q3, %rax
   call PrintCString
   call ScanInt
   cmp $1, %rax
   je Mystery
   mov $coon, %rax
   call PrintCString
   call EndProgram
Mystery:
   mov $myst, %rax
   call PrintCString
   call EndProgram
