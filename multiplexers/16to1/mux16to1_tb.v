`timescale 1ns/1ns
`include "mux16to1.v"

module decoder_tb ();
    reg [3:0]sel_t;
    reg enable_t;
    reg [15:0]a_t;
    wire y_t;
    mux16to1 uut(.A(a_t),.enable(enable_t),.sel(sel_t),.Y(y_t));
    initial begin
        $dumpfile("mux16to1_tb.vcd");
        $dumpvars(1,a_t,sel_t,enable_t,y_t);
        $monitor("%b %b %b",a_t,sel_t,y_t);
        a_t = 16'b1011_0111_0011_0111;
        sel_t = 4'b0000;
        enable_t = 1'b0;
        #10 enable_t = 1'b1;
        sel_t = 4'b0000;
        repeat(15)
        #10 sel_t = sel_t + 4'b0001;
    end
endmodule