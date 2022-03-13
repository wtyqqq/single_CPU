`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/13 11:39:11
// Design Name: 
// Module Name: controlUnit
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


module controlUnit(
        input [31:26] op,
        input [5:0] fun,
        output reg [5:0] ALUControl,
        output memWrite,
        output ALUSrc,
        output memtoReg,
        output RegDst,
        output ZeroExt,
        output RegWrite,
        output [31:0] sPC,
        output jump,
        output ReadShamt,
        output MemRead
    );
    
    wire LW=(op == 6'b100011)?1:0;
    wire SW=(op == 6'b101011)?1:0;
    wire BEQ=(op == 6'b000100)?1:0;
    wire ADD=(op == 6'b000000 & fun == 6'b100000)?1:0;
    wire SUB=(op == 6'b000000 & fun == 6'b100010)?1:0;
    wire ORI=(op == 6'b000000 & fun == 6'b100110)?1:0;
    wire jmp=(op == 6'b000010)?1:0;
    always @(op or fun)
        begin
        if (op == 6'b000000)
            begin      
                ALUControl = fun;
                case(fun)
                    
                endcase
            end
        end
endmodule
