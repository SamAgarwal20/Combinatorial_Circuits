`timescale 1ns/1ps
`include "fourto1mux.v"

module fourto1mux_tb ();
    reg [3:0]A_t;
    reg [1:0]S_t;
    reg E_t;
    wire Y_t;
    fourto1mux uut(.A(A_t),.S(S_t),.E(E_t),.Y(Y_t));
    initial begin 
    $dumpfile("fourto1mux.vcd");  
    $dumpvars(1,A_t,S_t,Y_t);
    $monitor("%b %b %b",A_t,S_t,Y_t);
    A_t=4'b1001;
    E_t=1'b1;
    S_t = 2'b00;
    #20 S_t = 2'b01;
    #20 S_t = 2'b10;
    #20 S_t = 2'b11;
    #20 E_t=0;
    #20;
    end
endmodule