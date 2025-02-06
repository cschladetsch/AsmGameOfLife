; display.asm

extern current_grid
extern rows
extern cols

section .data
    live_char db '*', 0   ; Character representing a live cell
    dead_char db '.', 0   ; Character representing a dead cell
    newline db 10         ; Newline character (ASCII 10)

section .text
    extern display_grid
    extern current_grid, rows, cols

;----------------------------------------
; display_grid:
; Displays the current state of the grid.
;----------------------------------------
display_grid:
    ; rdi - pointer to current_grid
    ; rsi - number of rows
    ; rdx - number of columns

    mov rdi, current_grid  ; Load the address of current_grid
    mov rsi, [rows]        ; Load the number of rows
    mov rdx, [cols]        ; Load the number of columns

    xor rcx, rcx           ; Row index = 0
.row_loop:
    xor rbx, rbx           ; Column index = 0
.col_loop:
    ; Calculate the offset for the current cell
    mov rax, rcx
    imul rax, rdx          ; rax = row_index * cols
    add rax, rbx           ; rax = rax + col_index

    ; Load the cell's state
    mov al, byte [rdi + rax]

    ; Determine the character to print
    cmp al, 1
    je .print_live
    ; Else, print dead
    mov rsi, dead_char
    jmp .print_char
.print_live:
    mov rsi, live_char
.print_char:
    ; Write the character to stdout
    mov eax, 1             ; syscall number for sys_write
    mov edi, 1             ; file descriptor: stdout
    mov edx, 1             ; number of bytes to write
    syscall

    ; Move to the next column
    inc rbx
    cmp rbx, rdx
    jl .col_loop

    ; Print newline after each row
    mov eax, 1             ; syscall number for sys_write
    mov edi, 1             ; file descriptor: stdout
    mov rsi, newline
    mov edx, 1             ; number of bytes to write
    syscall

    ; Move to the next row
    inc rcx
    cmp rcx, rsi
    jl .row_loop

    ret

; .section .note.GNU-stack, "", @progbits
