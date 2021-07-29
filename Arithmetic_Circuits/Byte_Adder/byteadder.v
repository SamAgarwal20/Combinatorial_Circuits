`timescale 1ns/1ns

module half_adder (A,B,S,C);
    input A;
    input B;
    output S;
    output C;
    
    assign S = A^B;
    assign C = A & B;
    
endmodule

module full_adder (
    input A,B,Cin,
    output S,Cout
    
);
wire C0,S0,C1;
half_adder H1(A,B,S0,C0);
half_adder H2(Cin,S0,S,C1);
assign Cout = C0|C1;

    
endmodule


module fourbitadder (
    input[3:0] addent,augend,
    input cin,
    output[3:0] s,
    output cout
);
    wire[2:0] cintermed;
    full_adder F1(.A(addent[0]),.B(augend[0]),.Cin(cin),.S(s[0]),.Cout(cintermed[0]));
    full_adder F2(.A(addent[1]),.B(augend[1]),.Cin(cintermed[0]),.S(s[1]),.Cout(cintermed[1]));
    full_adder F3(.A(addent[2]),.B(augend[2]),.Cin(cintermed[1]),.S(s[2]),.Cout(cintermed[2]));
    full_adder F4(.A(addent[3]),.B(augend[3]),.Cin(cintermed[2]),.S(s[3]),.Cout(cout));
endmodule

module byteadder (
    input[7:0] addent,augend,
    input cin,
    output[7:0] s,
    output cout
);
    wire c0;
    fourbitadder X1(.addent(addent[3:0]),.augend(augend[3:0]),.cin(cin),.s(s[3:0]),.cout(c0));
    fourbitadder X2(.addent(addent[7:4]),.augend(augend[7:4]),.cin(c0),.s(s[7:4]),.cout(cout));   
endmodule