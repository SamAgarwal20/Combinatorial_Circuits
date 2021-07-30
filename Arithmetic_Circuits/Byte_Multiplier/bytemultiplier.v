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

module bytemultipler (
    input[7:0] multiplier,multiplicand,
    output[15:0] product
);
    
    wire[7:0] adderout[0:6],addent[0:6],augend[0:6];
    wire[7:0] cout;
    assign addent[0] = multiplicand & {8{multiplier[0]}};
    assign product[0] = addent[0][0];
    assign augend[0] = multiplicand & {8{multiplier[1]}};
    byteadder B1(.addent({1'b0,addent[0][7:1]}),.augend(augend[0]),.cin(1'b0),.s(adderout[0]),.cout(cout[0]));  
    assign product[1] = adderout[0][0];

    assign addent[1] = {cout[0],adderout[0][7:1]};
    assign augend[1] = multiplicand & {8{multiplier[2]}};
    byteadder B2(.addent(addent[1]),.augend(augend[1]),.cin(1'b0),.s(adderout[1]),.cout(cout[1]));
    assign product[2] = adderout[1][0];
    
    assign addent[2] = {cout[1],adderout[1][7:1]};
    assign augend[2] = multiplicand & {8{multiplier[3]}};
    byteadder B3(.addent(addent[2]),.augend(augend[2]),.cin(1'b0),.s(adderout[2]),.cout(cout[2]));
    assign product[3] = adderout[2][0];

    assign addent[3] = {cout[2],adderout[2][7:1]};
    assign augend[3] = multiplicand & {8{multiplier[4]}};
    byteadder B4(.addent(addent[3]),.augend(augend[3]),.cin(1'b0),.s(adderout[3]),.cout(cout[3]));
    assign product[4] = adderout[3][0];

    assign addent[4] = {cout[3],adderout[3][7:1]};
    assign augend[4] = multiplicand & {8{multiplier[5]}};
    byteadder B5(.addent(addent[4]),.augend(augend[4]),.cin(1'b0),.s(adderout[4]),.cout(cout[4]));
    assign product[5] = adderout[4][0];

    assign addent[5] = {cout[4],adderout[4][7:1]};
    assign augend[5] = multiplicand & {8{multiplier[6]}};
    byteadder B6(.addent(addent[5]),.augend(augend[5]),.cin(1'b0),.s(adderout[5]),.cout(cout[5]));
    assign product[6] = adderout[5][0];

    assign addent[6] = {cout[5],adderout[5][7:1]};
    assign augend[6] = multiplicand & {8{multiplier[7]}};
    byteadder B7(.addent(addent[6]),.augend(augend[6]),.cin(1'b0),.s(adderout[6]),.cout(cout[6]));
    assign product[14:7]=adderout[6];
    assign product[15]=cout[6];

endmodule