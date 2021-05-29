%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_UDEC 4, eax
    push eax
    call SOLVE
    pop eax
    PRINT_UDEC 4, ecx
    
    
    xor eax, eax
    ret 
    
    
SOLVE:
    push ebp    
    mov ebp, esp
    mov esi, [ebp+8]
    mov ecx, 0
    
.l2:
    inc ecx
    push eax  
    push ecx
    call ISBAD
    pop ecx
    sub esi, eax
    pop eax
    
    
    test esi, esi    
    jnz .l2                
    
    pop ebp
    ret
    
    
ISBAD:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    mov ecx, 1
    xor ebx, ebx
.l1:
    cmp ecx, eax
    je .done
    push eax
    xor edx, edx
    div ecx
    test edx, edx
    jnz .skip
    add ebx, ecx
    
.skip:   
    pop eax 
    inc ecx
    jmp .l1
    
.done:
    mov edx, eax
    xor eax, eax
    cmp edx, ebx
    jbe .l4
    inc eax
.l4:    
    pop ebp
    ret