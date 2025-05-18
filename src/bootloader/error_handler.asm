;
; Handles the errors
;
floppy_error:
    mov si, msg_read_failed
    call print_string
    jmp wait_key_and_reboot

wait_key_and_reboot:
    mov ah, 0
    int 16h
    jmp 0FFFFh:0

.halt:
    cli                         ; Disables interrupts, meaning the CPU can't get out of the halt state
    hlt

msg_read_failed db "Read from disk failed", 0