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
   
   initial
   begin
   clk =1'b1;
   rst=1'b0;
   end
always #100 clk = ~clk;
CPU CPU(
.clk(clk),
.rst(rst)
);
endmodule
