; Bootloader de test
[bits 16]
[org 0x7C00]

start:
    mov ah, 0x0E
    mov al, 'A'
    int 0x10

    mov al, 'S'
    int 0x10

    mov al, 'A'
    int 0x10

    mov al, 'P'
    int 0x10

    mov al, ' '
    int 0x10

    mov al, ':'
    int 0x10

    mov al, ' '
    int 0x10

    mov al, 'T'
    int 0x10

    mov al, 'E'
    int 0x10

    mov al, 'S'
    int 0x10

    mov al, 'T'
    int 0x10

hang:
    jmp hang

times 510 - ($ - $$) db 0
dw 0xAA55