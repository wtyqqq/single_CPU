`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/12 19:12:48
// Design Name: 
// Module Name: ADDU
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

module ADDU(
    input [31:0] in1,
    input [31:0] in2,
    output [31:0] out
    );
    assign out = in1+in2;
endmodule

