// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.

    @0
    D=A
    @2
    M=D
// if R0 == 0; goto end
    @0
    D=M
    @END
    D;JEQ
// if R1 == 1; goto end
    @1
    D=M
    @END
    D;JEQ
// store R1 in R3
    @3
    M=D
// start loop
(LOOP)
// if R3 == 0; goto end
    @3
    D=M
    @END
    D;JEQ
// R3 = R3 - 1
    @3
    D=D-1
    M=D
// load R0
    @0
    D=M
// load R2 (result)
    @2
    A=M
// R2 = R2 + R0
    D=D+A
    @2
    M=D
    @LOOP
    0;JMP
(END)
    @END
    0;JMP // Infinite loop
