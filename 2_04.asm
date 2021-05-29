%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    xor ebx, ebx
    GET_UDEC 4, esi
    push esi
    call SOLVE
    PRINT_UDEC 4, ebx
    pop esi
    
    xor eax, eax
    ret
    
    
SOLVE:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    test eax, eax
    jz .done
    xor edx, edx
    mov ecx, 3
    div ecx
    cmp edx, 1
    jne .skip
    inc ebx
.skip:    
    push eax 
    call SOLVE
    pop eax
.done:   
    pop ebp
    ret         