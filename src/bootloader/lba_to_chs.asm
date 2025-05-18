; 
; Converts the Logical block addressing to CHS (Cylinder, Head, Sector) addressing, understood by old systems.
;
lba_to_chs:

	push ax
	push dx

	xor dx, dx							; dx = 0
	div word [bdb_sectors_per_track]	; ax = ax / [bdb_sectors_per_track]
										; ax = LBA / [bdb_sectors_per_track]
										; dx = LBA % [bdb_sectors_per_track]

	inc dx								; dx = (LBA % [bdb_sectors_per_track] + 1) = physical sector
	mov cx, dx							; cx = physical sector

	xor dx, dx							; dx = 0
	div word [bdb_heads]				; ax = (LBA / [bdb_sectors_per_track]) / [bdb_heads] = cylinder
										; dx = (LBA / [bdb_sectors_per_track]) % [bdb_heads] = head
	mov dh, dl							; dh = head
	mov ch, al							; ch = cylinder (lower 8 bits)
	shl ah, 6							;
	or cl, ah							; upper 2 bits of cylinder in cl

	pop ax
	mov dl, al							; restore dl
	pop ax

	ret
