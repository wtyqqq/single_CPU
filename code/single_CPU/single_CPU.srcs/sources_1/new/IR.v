`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/26 15:29:42
// Design Name: 
// Module Name: IR
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


module IR(
    input IRWrite_in,
    input Clear,
    input [31:0] IN,
    output reg[31:0] OUT,
    input CLK
    );
    always @(negedge CLK or negedge Clear) 
    begin
        if(Clear)
            OUT = IN;
        else
        begin
            if(IRWrite_in)
                OUT = IN;
        end
    end
endmodule

