`timescale 1ns/1ns

module fourto1mux (
    input [0:3]A,
    input S0,S1,E,
    output Y
);
    wire X1,X2,X3,X4,S0_not,S1_not;
    not G1(S0_not,S0);
    not G2(S1_not,S1);
    and G3(X1,A[0],S0_not,S1_not,E);
    and G4(X2,A[1],S0,S1_not,E);
    and G5(X3,A[2],S0_not,S1,E);
    and G6(X4,A[3],S0,S1,E);
    or G7(Y,X1,X2,X3,X4);
endmodule