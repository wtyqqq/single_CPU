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
    input [31:0] addr,
    output [31:0] outp
);
    reg [31:0] ROM[0:15];
    initial
    begin
    $readmemh("rom.txt",ROM);
    end
/*    always @(*) begin
     outp=ROM[addr];
     end*/
    assign outp=ROM[addr]; 

endmodule

