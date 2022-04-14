`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/10 22:50:30
// Design Name: 
// Module Name: PCReg
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


module PCReg(
    input clk,
    input rst,
    input ew,
    input [31:0] inputData,
    output reg [31:0] outputData,
    output [31:28] data31_28
    );
    always@(posedge clk or posedge rst)begin 
        if(rst)
        outputData <=32'h00000000;
        else 
            begin
                     outputData <= inputData;
            end
    end
    assign data31_28 =  outputData[31:28];
endmodule
