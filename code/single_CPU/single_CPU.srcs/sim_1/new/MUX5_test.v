`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/04/12 20:18:29
// Design Name: 
// Module Name: MUX5_test
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


module MUX5_test;
   reg choice;
   reg [31:0] data_in1;
   reg [31:0] data_in2;
   wire [4:0] dataOut;
   spMUX spMUX(choice,data_in1,data_in2,dataOut);
   initial
   begin
   data_in1 = 32'b0_1001;
   data_in2 = 32'b0_0110; 
   choice = 0;
   #10
   choice = 1;
   end
endmodule
