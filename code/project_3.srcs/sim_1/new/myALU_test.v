`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/28 12:16:15
// Design Name: 
// Module Name: myALU_test
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

module myALU_test;
    wire[31:0] in1;
    wire[31:0] in2;
    wire[31:0] out;
    reg[3:0] op;
    assign in1=32'h3B;
    assign in2=32'd18;
    myALU myALU_test_1(
        .in1(in1),
        .in2(in2),
        .op(op),
        .out(out)
    );
    initial begin
        #10
        op=4'h1;
        #10
        op=4'h2;
    end
    
endmodule
