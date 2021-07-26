`timescale 1ns/1ns
`include "decoder.v"

module decoder_tb ();
    reg [3:0]sel_t;
    reg enable_t;
    wire [15:0]d_t;
    decoder uut(.sel(sel_t),.enable(enable_t),.D(d_t));
    initial begin
        $dumpfile("decoder_tb.vcd");
        $dumpvars(1,sel_t,enable_t,d_t);
        $monitor("%b %b",sel_t,d_t);
        sel_t = 4'b0000;
        enable_t = 1'b0;
        #10 enable_t = 1'b1;
        sel_t = 4'b0000;
        repeat(15)
        #10 sel_t = sel_t + 4'b0001;
    end
endmodule