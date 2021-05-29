%include "io.inc"
section .bss
arr resd 1000
section .text
global CMAIN
CMAIN:
    mov ebp, esp
    
    GET_UDEC 4, ecx
    xor edx, edx
.l1:
    cmp edx, ecx
    je .exit    
    GET_UDEC 4, eax
    mov [arr+4*edx], eax
    inc edx
    jmp .l1
    
.exit:    
    GET_UDEC 4, esi
    xor edi, edi
    xor edx, edx
.l2:
    cmp edx, ecx
    je .ex
    mov eax, [arr+4*edx]
    push ecx
    push eax
    call COUNTOFZ
    add esp, 4
    pop ecx
    cmp eax, esi
    jne .sk
    inc edi    
.sk:    
    inc edx
    jmp .l2
    
.ex:    
    PRINT_UDEC 4, edi
    xor eax, eax
    ret
    
    
COUNTOFZ:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    xor ecx, ecx
.l1:
    test eax, eax
    jz .done
    shr eax, 1
    jc .skip
    inc ecx
.skip: 
    jmp .l1      
.done:    
    mov eax, ecx
    pop ebp
    ret         