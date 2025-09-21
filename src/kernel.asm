[bits 32]
[org 0x10000]

start_kernel:
    call halt

halt:
    cli
    hlt
    jmp halt

times 512 - ($ - $$) db 0