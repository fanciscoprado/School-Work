#Francisco Prado
#Project 1
#csc35
.data
NewLine:
   .ascii "\n\0"
lose:
   .ascii "*****************************\n"
   .ascii "*        GAME OVER          *\n"
   .ascii "*****************************\n\0"
Heal:
   .ascii "Health Bar\0"
no:
   .ascii "\nLol WRONG!!!\n\n\0"

Health:
   .byte 124
   .byte 178
   .byte 178
   .byte 178
   .byte 178
   .byte 178
   .byte 178
   .byte 124
   .byte 10
   .byte 00
Win:
   .ascii "*********************\n"
   .ascii "*      CONGRATS     *\n"
   .ascii "*      YOU WIN      *\n"
   .ascii "*********************\n\0"
Intro:
   .ascii "Welcome to guess that phrase! \n\n\0"
Player:
   .ascii "Player One enter your word: \0"
phrase: #holds the word
   .space 40
Secret: #holds the dashed word
   .space 40
TheWord:
   .ascii "The Secret Word: \0"
EnterGuess:
   .ascii "Playaer Two Enter your guess: \0"
nline:
   .ascii "\n\0"
.text
.global _start
_start:
   call ClearScreen
#Game intro
   mov $7, %r10 #used for health
   mov $0, %r12 #set flag for seeing if user was wrong
   mov $Intro, %rax
   call PrintCString
   mov $Player, %rax
   call PrintCString
   mov $phrase, %rax
   mov $40, %rbx
   call Red
   call ScanCString
   call White
   call ClearScreen
   mov %rax, %r8
#Sets up cencored secreat word 
   call LengthCString
   mov %rax, %r11
   mov $0, %rdi   
dashset: #makes dashed word
   movb $45, Secret(%rdi)
   add $1, %rdi
   cmp %rdi, %r11
   jg dashset
   movb $10, Secret(%rdi)
#Guesing Game loop starts
Loop:
   cmp $1, %r12 #checks flag to see if user was wrong
   je SubHealth  
   mov $1, %r12 #sets flag back to wrong
   mov $TheWord, %rax
   call PrintCString
   mov $Secret, %rax
   call Yellow
   call PrintCString
   call White
   call PrintHealth #Prints health bar
   mov $EnterGuess, %rax
   call PrintCString
   call Yellow
   call ScanChar
   call White
   mov %al, %bl
#Checks if guess is correct
   mov $0, %rdi
LoopCheck:
   cmp %bl, phrase(%rdi)     
   je SetLetter              
   add $1, %rdi              
   cmp %rdi, %r11            
   jle Checkdone             
   jmp LoopCheck             

SetLetter: #Makes the correct guess visable
   mov %bl, Secret(%rdi)
   add $1, %rdi
   mov $0, %r12 #sets flag to correct
   jmp LoopCheck

Checkdone:    #Cehcks if you are done with the game
   mov $0, %rdi
Checkdone2:  #checks for dashes 
   mov Secret(%rdi), %al
   cmp $45, %al
   je Loop
   add $1, %rdi
   cmp %rdi, %r11
   jg Checkdone2
   jmp end
   ret
end:   #The End of game
   mov $TheWord, %rax
   call PrintCString
   mov $Secret, %rax
   call PrintCString
   mov $Win, %rax
   call PrintCString
   call EndProgram

SubHealth:  #Takes away from the heath bar
   call Green
   mov $no, %rax
   call PrintCString
   call White
   sub $1, %r10
   mov %r10, %rdi
   movb $32, Health(%r10)
   mov $0, %r12
   cmp $1, %r10
   je GameOver   
   jmp Loop
PrintHealth: #prints out the health bar
   push %rax
   mov $Heal, %rax
   call PrintCString
   call Red
   mov $Health, %rax
   call PrintCString
   call White
   pop %rax
   ret
Yellow: #sets color to yellow
   push %rax
   mov $3, %rax
   call SetForeColor
   pop %rax
   ret
Green:    #sets color to green
   push %rax
   mov $2, %rax
   call SetForeColor
   pop %rax
   ret
Red:     #sets color to red
   push %rax
   mov $1, %rax
   call SetForeColor
   pop %rax
    ret
White:     #sets color to white
   push %rax
   mov $7, %rax
   call SetForeColor
   pop %rax
   ret
Blue:    #sets color to blue
   push %rax
   mov $4, %rax
   call SetForeColor
   pop %rax
   ret
   
GameOver:  #Runs when your helth bar goes to zero and you lose the game
   call PrintHealth 
   mov $lose, %rax
   call PrintCString
   mov $TheWord, %rax
   call PrintCString
   call Yellow
   mov $phrase, %rax
   call PrintCString
   mov $NewLine, %rax
   call PrintCString
   call White
   call EndProgram
