`include "fourbitadder.v"
`timescale 1ns/1ns

module fourbitadder_tb ();

reg[3:0] addent_t,augend_t;
reg cin_t;
wire[3:0] s_t;
wire cout_t;
fourbitadder F1(.addent(addent_t),.augend(augend_t),.cin(cin_t),.s(s_t),.cout(cout_t));
initial begin
   $dumpfile("fourbitadder_tb.vcd");
   $dumpvars(1,addent_t,augend_t,cin_t,s_t,cout_t);
   $monitor("%0d %0d %0d %0d %0d",addent_t,augend_t,cin_t,s_t,cout_t);
   cin_t = 1'b1;
   addent_t = 4'b1111;
   augend_t = 4'b0000;
   repeat(15)
    #10 augend_t = augend_t + 4'b0001;

end
    
endmodule