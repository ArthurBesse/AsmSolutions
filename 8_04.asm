%include "io.inc"
section .bss
k resd 1
ans resd 1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    mov dword[k], 8
    
    GET_UDEC 4, eax
    GET_UDEC 4, [k]
    mov dword[ans], 0

    push eax
    call SOLVE
    add esp, 4
    add [ans], eax 
    PRINT_UDEC 4, [ans]
    xor eax, eax
    ret
    
SOLVE:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    add [ans], eax
    push eax
    call DIGSUM
    add esp, 4
    cmp eax, [ebp+8]
    je .exit
    push eax
    call SOLVE
    add esp, 4          
.exit:  
                 
    pop ebp
    ret

    
        
            
                
DIGSUM:
    push ebp 
    mov ebp, esp
    mov eax, [ebp+8]
    xor esi, esi                        
.l3:
    test eax, eax
    jz .done3
    xor edx, edx
    mov ecx, 10
    div dword[k]
    add esi, edx
    jmp .l3
       
.done3:                                                    
                                                                            
    mov eax, esi                                                                                                
    pop ebp
    ret              