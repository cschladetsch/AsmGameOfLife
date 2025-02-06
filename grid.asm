; grid.asm

section .bss
    ; Pointers to the grids
    current_grid resq 1
    next_grid    resq 1

section .text
    global initialize_grid
    extern malloc

;----------------------------------------
; initialize_grid:
; Initializes the grid based on dimensions
; passed in rdi (rows) and rsi (cols).
;----------------------------------------
initialize_grid:
    ; Save grid dimensions
    mov [current_grid], rdi
    mov [next_grid], rsi

    ; Calculate total grid size
    mov rax, rdi        ; rax = rows
    imul rax, rsi       ; rax = rows * cols
    mov rcx, rax        ; rcx = total grid size

    ; Allocate memory for current_grid
    mov rdi, rcx        ; rdi = size
    call malloc
    test rax, rax
    jz .allocation_failed
    mov [current_grid], rax

    ; Allocate memory for next_grid
    mov rdi, rcx        ; rdi = size
    call malloc
    test rax, rax
    jz .allocation_failed
    mov [next_grid], rax

    ; Initialize current_grid (e.g., set all cells to dead)
    mov rdi, [current_grid]
    xor rax, rax        ; rax = 0 (dead cell)
    rep stosb           ; Initialize all cells to 0

    ret

.allocation_failed:
    ; Handle memory allocation failure
    ; (e.g., exit program or print error)
    ret

; .section .note.GNU-stack, "", @progbits
