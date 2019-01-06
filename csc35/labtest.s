#, lab5.s
# Francisco Prado

.data
Message:
   .ascii "I'M MR. MEESEEKS. LOOK AT ME!\n\0"
Buff:
   .space 30
Can:
   .ascii "? CAN DO!\n\0"

.text
.global _start

_start:
  
   mov $Message, %rax
   call PrintCString
#color change to red 
   mov $1, %rax
   call SetForeColor
#Scan part
   mov $30, %rbx
   mov $Buff, %rax
   call ScanCString
   mov %rax, %rdx

#Setting up the loop
  mov $0, %rcx
  call LengthCString
  mov %rax, %rbx
#starts the loop
Loop:
  cmp %rbx, %rcx
  je end
  mov %rcx, %rdi
  mov Buff(%rdi), %al
  add $1, %rcx
  cmp $97, %al  #Checks for upeercase letter
  jl Loop  
 #Checks for lowercase letter
  cmp $122, %al
  jg Loop
  sub $32, Buff(%rdi)
  jmp Loop
end:
# color change to blue
   mov $4, %rax
   call SetForeColor
#Prints Text
   mov %rdx, %rax
   call PrintCString

# Color change to white
   mov $7, %rax
   call SetForeColor
#Print Can do
  mov $Can, %rax
  call PrintCString 

  call EndProgram
