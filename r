nasm -f elf64 main.asm -o main.o
nasm -f elf64 grid.asm -o grid.o
nasm -f elf64 display.asm -o display.o
gcc -no-pie main.o grid.o display.o -o main
./main

