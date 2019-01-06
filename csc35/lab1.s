# lab1.s
# Francisco Prado

.data
Message:
   .ascii "Hola!\n\0"

Messageb:
   .ascii "Francisco Prado\n\0"

Messagec:
   .ascii "Viva La Revolucion\n\0"

Messaged:
   .ascii "I will graduate in \0 "

Messagee:
   .ascii " from Sacramento State!\n\0"



.text
.global _start

_start:
   mov $Message, %rax
   call PrintCString

   mov $Messageb, %rax
   call PrintCString

   mov $Messagec, %rax
   call PrintCString
   
   mov $Messaged, %rax
   call PrintCString
  
   mov $2019, %rax
   call PrintInt

   mov $Messagee, %rax
   call PrintCString

   call EndProgram
