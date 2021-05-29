%include "io.inc"

section .bss
a resd 1
b resd 1
c resd 1
d resd 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax

    GET_UDEC 4, [a]
    GET_UDEC 4, [b]
    GET_UDEC 4, [c]
    GET_UDEC 4, [d]
    push dword[a]
    push dword[b]
    call GCD
    add esp, 8
    push eax
    push dword[c]
    call GCD
    add esp, 8
    push eax
    push dword[d]
    call GCD
    add esp, 8
    PRINT_UDEC 4, eax
    xor eax, eax
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