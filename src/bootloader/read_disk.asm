
%include "src/bootloader/error_handler.asm"

read_disk:

	push cx					; Saves the number of sectors to read, cause cl will be overwritten
	call lba_to_chs				; Call to the funciton that converts LBA to CHS adressing.
	pop ax					; al = number of sectors to read.

	mov ah, 02h				;

	mov di, 3				; The BIOS is not so reliable reading floopy disks, so it's
							; advisable to try it at least 3 times.
.retry:
	pusha					; Saves all registers, because the BIOS may overwrite th values
							; after the system calls.
	stc						; Manually sets the carry flag for checking the result of the
							; operation. If it's clear, it succeeded.
	int 13h					;
	jnc .done				;

	; if read fails:
	popa					;
	call reset_disk			;

	dec di					;
	test di, di				;
	jnz .retry				;

.fail:
	; sll attempts exhausted, so restart the boot process
	jmp floppy_error


.done:

	popa
	pop di
	pop dx
	pop cx
	pop bx
	pop ax
	ret

reset_disk:

	pusha
	mov ah, 0
	stc
	int 13h
	jc floppy_error
	popa
	ret