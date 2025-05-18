print_string:				                ; BIOS function for printing

   .loop:

       lodsb                            ;
       or al, al                        ;
       jz .done                         ;
       mov ah, 0x0E                     ;
       int 0x10                         ; syscall that prints the character in al
       jmp .loop                        ; loops until reaches the null character (zero)

    .done:                              ;

    ret
