;*********************************************
;               REAL MODE
;*********************************************
[bits 16]
[org 0x7c00]

start:
    mov [BOOT_DRIVE], dl                        ;
    jmp bootloader_main                         ;

enable_a20:
    in al, 0x92                                 ;
    or al, 2                                    ;
    out 0x92, al                                ;
    ret                                         ;

load_gdt:
    cli                                         ;
    lgdt [gdt_descriptor]                       ;
    sti                                         ;
    ret                                         ;

enter_pm:
    mov eax, cr0                                ;
    or eax, 1                                   ;
    mov cr0, eax                                ;
    jmp CODE_SEG:pm_main                        ;

load_kernel:    
    mov ax, 0x1000                              ;  
    mov es, ax                                  ;
    xor bx, bx                                  ;
    mov ah, 0x02                                ;  
    mov al, 1                                   ;
    mov ch, 0                                   ;
    mov cl, 2                                   ;
    mov dh, 0                                   ;
    mov dl, [BOOT_DRIVE]                        ;
    int 0x13                                    ;
    jc disk_error                               ;
    ret

disk_error:
    hlt
    jmp disk_error

bootloader_main:
rm_stack:
    mov ax, 0x9000                              ;
    cli                                         ;
    mov ss, ax                                  ;
    mov sp, 0xFFFF                              ;
    sti                                         ;
main_boot_routine:    
    call enable_a20                             ;
    call load_gdt                               ;
    call load_kernel                            ;
    call enter_pm                               ;

;*********************************************
;       GLOBAL DESCRIPTOR TABLE (GDT)
;*********************************************
gdt_start:
gdt_null:
    dd 0x0                                      ;
    dd 0x0                                      ;
gdt_code:
    dw 0xffff                                   ;
    dw 0x0                                      ;
    db 0x0                                      ;
    db 10011010b                                ;
    db 11001111b                                ;
    db 0x0                                      ;
gdt_data:
    dw 0xffff                                   ;
    dw 0x0                                      ;
    db 0x0                                      ;
    db 10010010b                                ;
    db 11001111b                                ;
    db 0x0                                      ;
gdt_end:
gdt_descriptor:
    dw gdt_end - gdt_start - 1                  ;
    dd gdt_start                                ;

CODE_SEG equ gdt_code - gdt_start               ; 0x8h
DATA_SEG equ gdt_data - gdt_start               ; 0x10h

;*********************************************
;               PROTECTED MODE
;*********************************************
[bits 32]
pm_main:
pm_data_seg_reg:
    mov ax, DATA_SEG                            ;
    mov ds, ax                                  ;
    mov es, ax                                  ;
    mov fs, ax                                  ;
    mov gs, ax                                  ;
pm_stack:
    cli                                         ;
    mov ss, ax                                  ;
    mov esp, 0x9000                             ;
    sti                                         ;
pm_jmp_to_kernel:
    jmp CODE_SEG:0x10000                        ;

BOOT_DRIVE db 0                                 ;
times 510 - ($ - $$) db 0                       ;
dw 0xaa55                                       ;