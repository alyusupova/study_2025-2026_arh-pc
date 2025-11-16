%include 'in_out.asm'

SECTION .data
msg_x: DB 'Введите значение переменной x: ', 0  
msg_result: DB 'Результат y = 3*(x+10) - 20: ', 0 

SECTION .bss
x: RESB 80     

SECTION .text
GLOBAL _start

_start:
    ; Вывод сообщения о вводе x
    mov eax, msg_x
    call sprint

    mov ecx, x     
    mov edx, 80     
    call sread

    mov eax, x      
    call atoi       
    add eax, 10    
    mov ebx, 3     
    mul ebx        
    sub eax, 20     

    mov edi, eax

    mov eax, msg_result
    call sprint

    mov eax, edi    
    call iprint    

    mov eax, 1      
    xor ebx, ebx    
    int 0x80