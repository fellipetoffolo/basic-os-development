print_string:
   .loop:

       lodsb                            ; Função do BIOS para imprimir
       or al, al                        ;
       jz .done                         ;
       mov ah, 0x0E                     ; Função teletype do BIOS: imprime o caractere em AL
       int 0x10                         ;
       jmp .loop                        ; Loop até terminar o caractere
    .done:                              ;

    ret
