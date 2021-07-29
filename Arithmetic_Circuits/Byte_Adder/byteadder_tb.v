`include "byteadder.v"
`timescale 1ns/1ns

module byteadder_tb ();

reg[7:0] addent_t,augend_t;
reg cin_t;
wire[7:0] s_t;
wire cout_t;
byteadder F1(.addent(addent_t),.augend(augend_t),.cin(cin_t),.s(s_t),.cout(cout_t));
initial begin
   $dumpfile("byteadder_tb.vcd");
   $dumpvars(1,addent_t,augend_t,cin_t,s_t,cout_t);
   $monitor("%0d %0d %0d %0d %0d",addent_t,augend_t,cin_t,s_t,cout_t);
   cin_t = 1'b0;
   addent_t = 8'b1000_0001;
   augend_t = 8'b0000_0000;
   repeat(45)
    #10 augend_t = augend_t + 8'b0000_0010;

end
    
endmodule