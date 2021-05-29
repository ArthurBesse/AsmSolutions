%include "io.inc"


section .bss
digcnt resd 1
section .data
ten dd 10
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    GET_UDEC 4, eax
    GET_UDEC 4, ecx
    test eax, eax
    jnz .l3
    PRINT_STRING "Yes"
    PRINT_CHAR 10
    PRINT_UDEC 4, eax
    ret
.l3:    
    test ecx, ecx
    jz .done2
    push ecx
    push eax
    call ROTATE
    mov ebx, eax
    pop eax
    pop ecx
    add eax, ebx
    dec ecx
    jmp .l3   
.done2:
    push eax
    call ROTATE
    mov ebx, eax
    pop eax
    cmp eax, ebx
    je .YES
    PRINT_STRING "No"
    xor eax, eax
    ret
.YES:
    PRINT_STRING "Yes"
    PRINT_CHAR 10
    PRINT_UDEC 4, eax

    xor eax, eax
    ret 4
    
  
   
    
   
    
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


      
    
POW10:
    push ebp
    mov ebp, esp
    mov ebx, [ebp + 8]
    mov eax, 1
    dec ebx
.l2:    
    test ebx, ebx
    jz .done1
    mul dword[ten]
    dec ebx
    jmp .l2
    .done1:
    pop ebp
    ret
    
    
ROTATE:
    push ebp
    mov ebp, esp
    mov ebx, [ebp + 8]
    push ebx
    call COUNTOFDIG
    pop ebx
    mov ecx, eax
    mov eax, ebx
    xor esi, esi
    .l1:
    xor edx, edx
    div dword[ten]
    push eax
    push ebx
    push edx
    push ecx
   
    call POW10
    mov edi, eax    
    pop ecx
    pop edx
    pop ebx
    pop eax
    imul edi, edx
    add esi, edi
    
    loop .l1
    mov eax, esi
    pop ebp
    ret
    
    
 
    
COUNTOFDIG:
    push ebp
    mov ebp, esp
    xor ebx, ebx
    mov eax, [ebp + 8]
    
    mov ecx, 10
.repeat:
    xor edx, edx
    cmp eax, 0
    jz .done
    inc ebx    
    div ecx   
    jmp .repeat
.done:
    pop ebp
    mov eax, ebx
    ret