`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/26 16:28:37
// Design Name: 
// Module Name: BranchControl
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


module BranchControl(
    input [3:0] Input,
    output reg Output,
    input Sign_in,
    input Zero_in
    );
    always@(*)
    begin
        case (Input)
            4'b0000: Output = 1'b0;
            4'b0001: Output = Zero_in;
            4'b0010: Output = ~Zero_in;
            4'b0011: Output = (~Sign_in && ~Zero_in);
            default:
                Output = 1'b0;              
        endcase
    end
endmodule
