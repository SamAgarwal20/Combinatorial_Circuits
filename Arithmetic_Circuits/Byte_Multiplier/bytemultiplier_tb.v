`timescale 1ns/1ns
`include "bytemultiplier.v"

module bytemultiplier_tb ();
    reg[7:0] multiplier_t,multiplicand_t;
    wire[15:0] product_t;
    bytemultipler uut(.multiplier(multiplier_t),.multiplicand(multiplicand_t),.product(product_t));
    initial begin
        $monitor("%0d %0d %0d",multiplier_t,multiplicand_t,product_t);
        multiplier_t = 8'b0110_1001;
        multiplicand_t = 8'b0001_1010;
        #20;
    end
endmodule