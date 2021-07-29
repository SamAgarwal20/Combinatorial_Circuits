`timescale 1ns/1ns

module fourto1mux (
    input [3:0]A,
    input [1:0] S,
    input E,
    output Y
);
    wire X1,X2,X3,X4;
    wire [1:0] Snot;
    assign Snot = ~S; 
    and G3(X1,A[0],Snot[1],Snot[0],E);
    and G4(X2,A[1],Snot[1],S[0],E);
    and G5(X3,A[2],S[1],Snot[0],E);
    and G6(X4,A[3],S[1],S[0],E);
    or G7(Y,X1,X2,X3,X4);
endmodule