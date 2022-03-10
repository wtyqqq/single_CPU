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
    output [31:0] outputData,
    output [31:28] type //前四位可以判断指令类型
    );
    reg [31:0] data;
    always@(posedge clk or posedge rst)begin 
        if(rst)
        data <=32'h00400000;
        else 
            begin
                if (ew)
                    data <= inputData；
            end
    end
    assign outputData = data;
    assign type = data[31:28]
endmodule
