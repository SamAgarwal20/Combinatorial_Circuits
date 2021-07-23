`timescale 1ns/1ps
`include "fourto1mux.v"

module fourto1mux_tb ();
    reg [0:3]A;
    reg S0,S1,E;
    wire Y;
    fourto1mux uut(A[0:3],S0,S1,E,Y);
    initial begin 
    $dumpfile("fourto1mux.vcd");  
    $dumpvars(0,fourto1mux_tb);
    
    A[0]=0;A[1]=0;A[2]=0;A[3]=1;S0=0;S1=0;E=1;
    #20 S0=1;S1=0;
    #20 S0=0;S1=1;
    #20 S0=1;S1=1;
    #20 E=0;
    #20;
    end
endmodule