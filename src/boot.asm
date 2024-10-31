ORG 0x7C00				; Calculates the labels and variable with the offset 0x7C00
BITS 16					; Tells the assembler to emit 16 bit code

start:
    mov si, msg                         ; Moves the msg to the si register
    call print_string                   ; Calls the print_string function from another file to print msg

    jmp $                               ; Loops forever in the same place

    %include "print_string_func.asm"	;
    msg db 'Hello, World!', 0           ;

times 510 - ($ - $$) db 0               ; Pads the inbetweens of the bootloader with zeros,
                                        ; so it won't mistakenly find the signature (or magic) number
dw 0xAA55                               ; Ends with the 'magic number', which signalizes the end of the code
