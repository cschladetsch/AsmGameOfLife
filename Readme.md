# Game of Life in x86-64 Assembly

A bare-metal implementation of Conway's Game of Life written in x86-64 assembly language. This implementation features a glider pattern that moves diagonally across the screen.

## Features

- Pure assembly implementation with no C library dependencies
- Direct system calls for I/O and timing
- 20x20 grid display
- Classic glider pattern
- Terminal-based visualization
- Efficient grid manipulation and neighbor counting

## Requirements

- Linux x86-64 system
- NASM (Netwide Assembler)
- GNU Make
- ld (GNU Linker)

## Building

```bash
make clean && make
```

This will create an executable named `life`.

## Running

```bash
./life
```

Press Ctrl+C to exit.

## Implementation Details

The project consists of three main assembly files:

### main.asm
- Program entry point
- Terminal control (screen clearing, cursor management)
- Main game loop
- Timing control

### grid.asm
- Grid initialization with glider pattern
- Game rules implementation
- Next generation calculation
- Neighbor counting logic

### display.asm
- Grid visualization
- Character-based rendering
- Terminal output handling

## Game Rules

Conway's Game of Life follows these rules:
1. Any live cell with fewer than 2 live neighbors dies (underpopulation)
2. Any live cell with 2 or 3 live neighbors lives on
3. Any live cell with more than 3 live neighbors dies (overpopulation)
4. Any dead cell with exactly 3 live neighbors becomes alive (reproduction)

## Design Choices

- Uses static memory allocation for grids (400 bytes each for 20x20 grid)
- Direct syscalls instead of C library functions
- ANSI escape sequences for terminal control
- Bitwise operations for efficient state checks
- Simple neighbor counting algorithm
- 100ms generation delay for visible pattern movement

## Known Limitations

- Fixed grid size (20x20)
- No signal handling for clean exit
- Terminal state may need reset after Ctrl+C
- Single hardcoded pattern (glider)

## Contributing

Feel free to extend or modify this implementation. Some possible improvements:
- Add signal handling for clean exits
- Implement pattern loading from files
- Add multiple patterns
- Make grid size configurable
- Add color support
- Implement pattern editing

## License

This project is open source and available under the MIT License.
