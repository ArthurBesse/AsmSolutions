%include "io.inc"
section .data
count dd 0
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    mov dword[count], 0
    call SOLVE
    
    
    xor eax, eax
    ret
     
SOLVE:
    GET_DEC 4, eax
    cmp eax, 0
    jnz .continue
    ret
.continue:
    add dword[count], 8
    push eax
    call SOLVE
    mov ecx, ebp
    sub ecx, 8
    mov edx, 1
    mov edi, [count]
    shr edi, 3
.l1:
    cmp edx, edi
    ja .done1   
    mov eax, [ecx]
    PRINT_DEC 4, eax
    PRINT_CHAR ' '
    sub ecx, 16
    add edx, 2
    jmp .l1   
.done1:   
    shr edi, 1
    jc .carry
    xor ecx, ecx
    jmp .skip
.carry:
    mov ecx, 8

.skip:
    add ecx, esp
    mov edx, 1
    mov edi, [count]
    shr edi, 3
.l2:
    cmp edx, edi
    jae .done2   
    mov eax, [ecx]
    PRINT_DEC 4, eax
    PRINT_CHAR ' '
    add ecx, 16
    add edx, 2
    jmp .l2
    
.done2:    
    add esp, [count]
    sub esp, 4
    xor eax, eax
    ret