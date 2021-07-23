`timescale 1ns/1ns
`include "half_adder.v"

module full_adder (
    input A,B,Cin,
    output S,Cout
    
);
wire C0,S0,C1;
half_adder H1(A,B,S0,C0);
half_adder H2(Cin,S0,S,C1);
assign Cout = C0|C1;

    
endmodule