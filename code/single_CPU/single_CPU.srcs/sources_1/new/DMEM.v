`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/13 12:47:31
// Design Name: 
// Module Name: DMEM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: 
// 
//////////////////////////////////////////////////////////////////////////////////

module DMEM(input WE,
    input clk,
    input [31:0] addr,
    output [31:0] outp,
    input [31:0] inpt);
    reg [31:0] RAM[255:0];

    always @(posedge clk) begin
        if(WE) 
            RAM[addr]<=inpt;
    end
    assign outp=RAM[addr];
endmodule