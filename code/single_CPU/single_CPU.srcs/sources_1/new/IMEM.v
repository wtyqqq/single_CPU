`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/13 12:41:47
// Design Name: 
// Module Name: IMEM
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

`timescale 1ns / 1ps

module IMEM(
    input clk,
    input [31:0] addr,
    output reg [31:0] outp
);
    reg [31:0] ROM[255:0];
    initial
    begin
    $readmemb("./rom.txt",ROM);
    end
    always @(posedge clk) begin
     outp=ROM[addr];
     end
    //assign outp=ROM[addr];
endmodule

