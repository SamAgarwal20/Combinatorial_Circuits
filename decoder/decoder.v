`timescale 1ns/1ns

module decoder (
    input [3:0]sel,
    input enable,
    output [15:0]D
);
    wire [3:0]sel_not;
    assign sel_not= ~sel;
    nand (D[0],sel_not[0],sel_not[1],sel_not[2],sel_not[3],enable);
    nand (D[1],sel[0],sel_not[1],sel_not[2],sel_not[3],enable);
    nand (D[2],sel_not[0],sel[1],sel_not[2],sel_not[3],enable);
    nand (D[3],sel[0],sel[1],sel_not[2],sel_not[3],enable);
    
    nand (D[4],sel_not[0],sel_not[1],sel[2],sel_not[3],enable);
    nand (D[5],sel[0],sel_not[1],sel[2],sel_not[3],enable);
    nand (D[6],sel_not[0],sel[1],sel[2],sel_not[3],enable);
    nand (D[7],sel[0],sel[1],sel[2],sel_not[3],enable);
    
    nand (D[8],sel_not[0],sel_not[1],sel_not[2],sel[3],enable);
    nand (D[9],sel[0],sel_not[1],sel_not[2],sel[3],enable);
    nand (D[10],sel_not[0],sel[1],sel_not[2],sel[3],enable);
    nand (D[11],sel[0],sel[1],sel_not[2],sel[3],enable);
    
    nand (D[12],sel_not[0],sel_not[1],sel[2],sel[3],enable);
    nand (D[13],sel[0],sel_not[1],sel[2],sel[3],enable);
    nand (D[14],sel_not[0],sel[1],sel[2],sel[3],enable);
    nand (D[15],sel[0],sel[1],sel[2],sel[3],enable);
    
endmodule