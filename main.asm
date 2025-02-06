[BITS 64]

section .data
    rows    dq  20
    cols    dq  20

section .bss
    current_grid    resq 1
    next_grid       resq 1

section .text
    global _start
    extern initialize_grid

main_loop:
    ret

;main:
_start:
    ; Load grid dimensions into registers
    mov rdi, [rows]    ; rdi = rows
    mov rsi, [cols]    ; rsi = cols

    ; Call initialize_grid
    call initialize_grid

    jmp main_loop
    ; Main loop (placeholder)
    ret

; .section .note.GNU-stack, "", @progbits
