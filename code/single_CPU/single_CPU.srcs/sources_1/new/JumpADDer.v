`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/26 18:47:00
// Design Name: 
// Module Name: JumpADDer
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


module JumpADDer(
    input [27:2] inst_add,
    input [31:28] PCPlus4,
    output [31:0] out
    );
    assign out = {PCPlus4,inst_add,2'b00};
endmodule
