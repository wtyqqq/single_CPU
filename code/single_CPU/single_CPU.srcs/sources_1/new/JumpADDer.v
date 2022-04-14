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
    input [25:0] inst_add,
    input [3:0] PCPlus4,
    output [31:0] out
    );
       assign  out = {PCPlus4,2'b00,inst_add};
endmodule
