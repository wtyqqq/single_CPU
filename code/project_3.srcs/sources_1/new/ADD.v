`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/10 23:20:43
// Design Name: 
// Module Name: ADD
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

module ADD(
    input in1,
    input in2,
    output [31:0] out
);
    reg [32:0] result;
    wire signed  [31:0] sa = a, ab = b;
    always @(*) begin
    result = sa+sb;
    end
    assign c = result[31:0];
endmodule