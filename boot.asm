BITS 16                 	 	; Código de 16 bits para o bootloader
ORG 0x7c00 		              	; O endereço de origem onde o BIOS carrega o bootloader


start:
    mov si, msg				;
    call print_string			;

    jmp $				;

%include "print_string_func.asm"	;


    msg db 'Hello, World!', 0		;

times 510 - ($ - $$) db 0 	; Preenche o restante do bootloader com zeros
dw 0xAA55                	; Assinatura de boot
