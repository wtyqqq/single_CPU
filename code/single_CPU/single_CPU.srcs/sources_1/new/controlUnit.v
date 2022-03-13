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
        input [5:0] op,
        input [5:0] fun,
        output [5:0] ALUControl,
        output memWrite,
        output ALUSrc,
        output memorReg,
        output RegDst,
        output SE,
        output RegWrite,
        output [31:0] sPC,
        output jump
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
    case(op)
    6'b000000:
    begin
        assign ALUControl = fun;
        {RegDst,ALUSrc,MemtoReg,RegWrite,MemWrite,Branch,ALUOp,Jump,PCWrite,ZeroExt,ReadShamt} = 18'b1_0_0_1_0_0000_0010_0_1_1_1;
    end
    
    
    assign SE=LW | SW | BEQ;
    assign RegDst=ADD | SUB;
    assign ALUSrc =LW | SW | ORI ;
    assign memWrite=SW;
    assign RegWrite=ADD | SUB | ORI | LW;
    assign memorReg=LW;
    assign sPC[0]=ADD | SUB | ORI | SW | LW;
    assign sPC[1]=BEQ;
    assign sPC[2]=jmp;
    

//    wire i_add = (Op == 6'b000000 & Func == 6'b100000)?1:0;
//    assign ALUControl[0]=ADD | SW | LW;
//    assign ALUControl[1]=SUB | BEQ;
//    assign ALUControl[2]=ORI;
      end
endmodule
