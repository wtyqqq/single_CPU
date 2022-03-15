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
        output reg[5:0] ALUControl,
        output reg regDst,
        output reg ALUsrc,
        output reg memToReg,
        output reg regWrite,
        output reg memRead,
        output reg memWrite,
        output reg [3:0] branch,
        output reg jump,
        output reg PCwrite,
        output reg zeroExt,
        output reg readShamt
    );
    
    always @(op or fun)
        begin
        if (op == 6'b000000) //R-type
            begin      
                ALUControl = fun;
                case(fun)
                //所有的R型指令
                    6'b100000: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt}= 18'b1_0_0_1_0_0_0000_0_1_0_0; //add
                    6'b100001: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt}=18'b1_0_0_1_0_0_0000_0_1_0_0; //addu
                    6'b100010: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt}=18'b1_0_0_1_0_0_0000_0_1_0_0; //sub
                    6'b100011: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt}=18'b1_0_0_1_0_0_0000_0_1_0_0; //subu
                    6'b100100: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt}=18'b1_0_0_1_0_0_0000_0_1_0_0; //and
                    6'b100101: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt}=18'b1_0_0_1_0_0_0000_0_1_0_0; //or
                    6'b100110: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt}=18'b1_0_0_1_0_0_0000_0_1_0_0; //xor
                    6'b100111: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt}=18'b1_0_0_1_0_0_0000_0_1_0_0; //nor
                    6'b101010: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt}=18'b1_0_0_1_0_0_0000_0_1_0_0; //slt
                    6'b101011: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt}=18'b1_0_0_1_0_0_0000_0_1_0_0; //sltu
                    6'b000000: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt}=18'b1_0_0_1_0_0_0000_0_1_1_1; //sll
                    6'b000010: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt}=18'b1_0_0_1_0_0_0000_0_1_1_1; //srl
                    6'b000011: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt}=18'b1_0_0_1_0_0_0000_0_1_1_1; //sra
                    6'b000100: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt}=18'b1_0_0_1_0_0_0000_0_1_1_1; //sllv
                    6'b000110: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt}=18'b1_0_0_1_0_0_0000_0_1_1_1; //srlv
                    6'b000111: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt}=18'b1_0_0_1_0_0_0000_0_1_1_1; //srav
                    6'b001000: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt}=18'b1_0_0_1_0_0_0000_0_1_0_0; //jr
                endcase
            end
        else 
            begin
                
            end
        end
endmodule
