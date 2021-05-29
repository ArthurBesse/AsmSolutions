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
    
    
    xor eax, eax
    ret 
    
    
SOLVE:
    push ebp    
    mov ebp, esp
    mov ecx, [ebp+8]
.l1:
    GET_UDEC 4, esi
    push ecx
    push esi
    call ISDIV3
    add esp, 4
    pop ecx
    test eax, eax
    jz .NO
    PRINT_STRING "NO"
    PRINT_CHAR 10
    jmp .done
.NO:
    PRINT_STRING "YES"
    PRINT_CHAR 10
.done:
    dec ecx
    test ecx, ecx
    jnz .l1
    pop ebp
    ret
    
    
    

    
    
ISDIV3:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    xor edx, edx
    mov ecx, 3
    div ecx
    mov eax, edx
.skip:
    pop ebp
    ret