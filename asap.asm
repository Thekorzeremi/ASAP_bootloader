; ASAP Bootloader - TheKorzeremi
[bits 16]
[org 0x7C00]
start:
    mov ah, 0x0E
    mov si, message_title
.loop_title:
    lodsb
    or al, al
    jz .done_title
    int 0x10
    jmp .loop_title
.done_title:
    mov si, message_menu
.loop_menu:
    lodsb
    or al, al
    jz .done_menu
    int 0x10
    jmp .loop_menu
.done_menu:
    call wait_for_key
hang:
    jmp hang
wait_for_key:
    mov ah, 0x00
    int 0x16
    cmp al, 0x0D
    je .select_option
    cmp al, 0x48
    je .up_arrow
    cmp al, 0x50
    je .down_arrow
    jmp wait_for_key
.up_arrow:
    jmp wait_for_key
.down_arrow:
    jmp wait_for_key
.select_option:
    call load_kernel_1
    ret
load_kernel_1:
    mov si, 0x2000
    mov di, 0x1000
    mov cx, 10
    call load_sectors
    ret
load_sectors:
    ret
message_title db "ASAP : Anvil Startup Advanced Program", 0
message_menu db 0x0D, 0x0A, "1. Demarrer", 0x0D, 0x0A, "2. Demarrer", 0x0D, 0x0A
times 510 - ($ - $$) db 0
dw 0xAA55