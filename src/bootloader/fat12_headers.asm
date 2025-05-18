;
; This makes sure that the code in boot.asm is recognized as a FAT12 file system floppy disk.
; BIOS Parameter Block (BPB) + EBR (for FAT12)
jmp short start

nop

bdm_oem:                    db "MSWIN4.1"             ; OEM Name
bdb_bytes_per_sector:       dw 512                    ; Bytes per sector
bdb_sectors_per_cluster:    db 1                      ; Sectors per cluster
bdb_reserved_sectors:       dw 1                      ; Reserved sectors
bdb_fat_count:              db 2                      ; Number of FATs
bdb_dir_entries_count:      dw 0E0h                   ; Root directory entries
bdb_total_sectors:          dw 2880                   ; Total sectors (1.44MB)
bdb_media_descriptor_type:  db 0F0h                   ; Media descriptor (floppy)
bdb_sectors_per_fat:        dw 9                      ; Sectors per FAT
bdb_sectors_per_track:      dw 18                     ; Sectors per track
bdb_heads:                  dw 2                      ; Number of heads
bdb_hidden_sectors:         dd 0                      ; Hidden sectors
bdb_large_sector_count:     dd 0                      ; Large sector count

ebr_drive_number:       db 0                      ; Drive number
                        db 0                      ; Reserved
ebr_signature:          db 29h                    ; Boot signature
ebr_volume_id:          db 12h, 34h, 56h, 78h     ; Volume ID
ebr_volume_label:       db "FTMOS       "         ; Volume label (11 chars)
ebr_system_id:          db "FAT12   "             ; File system type (8 chars)