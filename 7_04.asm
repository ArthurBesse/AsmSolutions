%include "io.inc"
section .bss
k resd 1 
section .data
_2011 dd 2011
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    GET_UDEC 4, [k]
    GET_UDEC 4, ecx
    GET_UDEC 4, eax
    xor edx, edx
    div dword[_2011]
    mov eax, edx
    
.l1:    
    test ecx, ecx
    jz .done1
    mul eax
    
    mov ebx, [k]
    xor esi, esi
.l2:
    xor edx, edx
    div ebx
    add esi, edx
    test eax, eax
    jz .done2
    imul esi, ebx
    jmp .l2      
    
.done2:
    mov eax, esi

    xor edx, edx
    div dword[_2011]
    mov eax, edx
    dec ecx
    jmp .l1
.done1: 
    

    PRINT_UDEC 4, eax
    xor eax, eax
    ret
    
    