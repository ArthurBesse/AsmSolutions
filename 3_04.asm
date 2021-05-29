%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    call SOLVE
    
    
    xor eax, eax
    ret
     
SOLVE:
    push ebp
    mov ebp, esp
    GET_DEC 4, eax
    cmp eax, 0
    jnz .continue
    pop ebp
    ret
.continue:
    push eax
    call SOLVE
    pop eax
    PRINT_DEC 4, eax
    PRINT_CHAR ' '
    pop ebp
    ret

