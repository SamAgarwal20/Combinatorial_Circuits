`timescale 1ns/1ns

module mux16to1 (
    input [15:0]A,
    input enable,
    input [3:0]sel,
    output Y
);
    wire [3:0]sel_not;
    wire [15:0]X;
    assign sel_not = ~ sel;
    and G1 (X[0],A[0],sel_not[0],sel_not[1],sel_not[2],sel_not[3],enable);
    and G2 (X[1],A[1],sel[0],sel_not[1],sel_not[2],sel_not[3],enable);
    and G3 (X[2],A[2],sel_not[0],sel[1],sel_not[2],sel_not[3],enable);
    and G4 (X[3],A[3],sel[0],sel[1],sel_not[2],sel_not[3],enable);   

    and G5 (X[4],A[4],sel_not[0],sel_not[1],sel[2],sel_not[3],enable);
    and G6 (X[5],A[5],sel[0],sel_not[1],sel[2],sel_not[3],enable);
    and G7 (X[6],A[6],sel_not[0],sel[1],sel[2],sel_not[3],enable);
    and G8 (X[7],A[7],sel[0],sel[1],sel[2],sel_not[3],enable);

    and G9 (X[8],A[8],sel_not[0],sel_not[1],sel_not[2],sel[3],enable);
    and G10 (X[9],A[9],sel[0],sel_not[1],sel_not[2],sel[3],enable);
    and G11 (X[10],A[10],sel_not[0],sel[1],sel_not[2],sel[3],enable);
    and G12 (X[11],A[11],sel[0],sel[1],sel_not[2],sel[3],enable);   

    and G13 (X[12],A[12],sel_not[0],sel_not[1],sel[2],sel[3],enable);
    and G14 (X[13],A[13],sel[0],sel_not[1],sel[2],sel[3],enable);
    and G15 (X[14],A[14],sel_not[0],sel[1],sel[2],sel[3],enable);
    and G16 (X[15],A[15],sel[0],sel[1],sel[2],sel[3],enable);
     
    assign Y = |X;
endmodule