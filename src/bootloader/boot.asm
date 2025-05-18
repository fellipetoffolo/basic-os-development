ORG 0x7C00				; Calculates the labels and variable with the offset 0x7C00
BITS 16					; Tells the assembler to emit 16 bit code

%include "src/bootloader/fat12_headers.asm"

start:
    mov si, msg                         ; Moves the msg to the si register
    call print_string                   ; Calls the print_string function from another file to print msg

    mov [ebr_drive_number], dl
    mov ax, 1                           ; LBA = 1 (second sector on the disk)
    mov cl, 1                           ; 1 sector to read
    mov bx, 0x7E00                      ; offset addres to ensure the data is after the bootloader code
    call read_disk                      ;

    cli
    jmp $                               ; Loops forever in the same place

    %include "src/bootloader/print_string_func.asm"	
    %include "src/bootloader/lba_to_chs.asm"            
    %include "src/bootloader/read_disk.asm"

    msg db 'Hello, Worldss!', 0         ;

times 510 - ($ - $$) db 0               ; Pads the inbetweens of the bootloader with zeros,
                                        ; so it won't mistakenly find the signature (or magic) number
dw 0xAA55                               ; Ends with the 'magic number', which signalizes the end of the code
