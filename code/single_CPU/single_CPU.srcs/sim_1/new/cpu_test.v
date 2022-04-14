`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/13 20:46:49
// Design Name: 
// Module Name: CPU_test
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


module CPU_test();
   reg clk,rst;
   wire [31:0] test;
   wire test2;
   wire test3;
   wire [31:0] test4; 
   initial
   begin
   clk =1'b0;
rst =1;
#10 rst=0;
   end
always #10 clk = ~clk;
CPU CPU(
.clk(clk),
.rst(rst),
.test(test),
.test2(test2),
.test3(test3),
.test4(test4)
);
endmodule
