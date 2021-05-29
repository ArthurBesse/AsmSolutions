%include "io.inc"
section .bss
k resd 1
ans resd 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_UDEC 4, ecx
    GET_UDEC 4, ebx
    GET_UDEC 4, eax
    dec ecx
.l1:    
    test ecx, ecx
    jz .done
    GET_UDEC 4, edi
    GET_UDEC 4, edx
    push ecx
    push ebx
    push eax
    push edi
    push edx
    call SUM
    add esp, 16 
    pop ecx
    dec ecx               
    jmp .l1    
    
.done:    
    PRINT_UDEC 4, ebx
    PRINT_CHAR ' '
    PRINT_UDEC 4, eax
    xor eax, eax
    ret
    
SUM:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    mov ebx, [ebp+16]
    push eax
    push ebx
    call GCD
    mov ecx, eax
    pop ebx
    pop eax
    mul ebx
    div ecx
    push eax
    xor esi, esi
    xor edx, edx
    div dword[ebp+16]
    mul dword[ebp+20]
    add esi, eax
    pop eax
    push eax
    xor edx, edx
    div dword[ebp+8]
    mul dword[ebp+12]
    add esi, eax
    pop eax          
.exit:  
    mov ebx, esi  
    push ebx
    push eax
    call GCD
    mov ecx, eax
    pop ebx
    pop eax
    xor edx, edx
    div ecx
    push eax 
    mov eax, ebx
    xor edx, edx
    div ecx
     
    mov ebx, eax
    pop eax  
    xchg eax, ebx           
    pop ebp
    ret

    
     
GCD:
    push ebp
    mov ebp, esp
    mov ebx, [ebp + 8]
    mov eax, [ebp + 12]
    cmp ebx, 0
    jnz .continue
    pop ebp
    ret
.continue:
    push ebx
    xor edx, edx
    div ebx
    push edx
    call GCD
    add esp, 8
    pop ebp
    ret 