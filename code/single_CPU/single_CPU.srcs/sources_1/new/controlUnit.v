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
        output reg readShamt,
        output reg [1:0] saveOpt //这个控制讲什么数据存入regFile(一共有三个来源 ALU结果、当前的PC+4、DMEM的输出)
    );
    
    always @(*)
        begin
        case (op ) //R-type
            6'b000000:
            begin      
                ALUControl = fun;
                case(fun)
                //所有的R型指令
                    6'b100000: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b1001000000010000; //add
                    6'b100001: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b1_0_0_1_0_0_0000_0_1_0_0_00; //addu
                    6'b100010: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b1_0_0_1_0_0_0000_0_1_0_0_00; //sub
                    6'b100011: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b1_0_0_1_0_0_0000_0_1_0_0_00; //subu
                    6'b100100: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b1_0_0_1_0_0_0000_0_1_0_0_00; //and
                    6'b100101: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b1_0_0_1_0_0_0000_0_1_0_0_00; //or
                    6'b100110: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b1_0_0_1_0_0_0000_0_1_0_0_00; //xor
                    6'b100111: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b1_0_0_1_0_0_0000_0_1_0_0_00; //nor
                    6'b000000: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b1_0_0_1_0_0_0000_0_1_1_1_00; //sll
                    6'b000010: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b1_0_0_1_0_0_0000_0_1_1_1_00; //srl
                    6'b000011: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b1_0_0_1_0_0_0000_0_1_0_1_00; //sra
                    6'b000100: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b1_0_0_1_0_0_0000_0_1_1_0_00; //sllv
                    6'b000110: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b1_0_0_1_0_0_0000_0_1_1_0_00; //srlv
                    6'b000111: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b1_0_0_1_0_0_0000_0_1_0_0_00; //srav
                    6'b001000: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b1_0_0_0_0_0_0000_0_1_0_0_00; //jr
                    6'b101010: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b1_0_0_1_0_0_0000_0_1_0_0_00; //slt
                    6'b101011: {regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b1_0_0_1_0_0_0000_0_1_0_0_00; //sltu
                endcase
            end
        //下面的还没写ALUcontrol指令    
        //j型 这俩没有aluControl
        6'b000010:{regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b0_0_0_0_0_0_0000_1_1_0_0_00; //j
        6'b000011:{regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt}=20'b0_0_0_1_0_0_0000_1_1_0_0_01; //jal
        //i型
        6'b001000:{regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,ALUControl,saveOpt}=26'b0_1_0_1_0_0_0000_0_1_1_0_100000_00;//addi
        6'b001001:{regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,ALUControl,saveOpt}=26'b0_1_0_1_0_0_0000_0_1_1_0_100001_00;//addiu
        6'b001100:{regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,ALUControl,saveOpt}=26'b0_1_0_1_0_0_0000_0_1_1_0_100100_00;//andi
        6'b001001:{regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,ALUControl,saveOpt}=26'b0_1_0_1_0_0_0000_0_1_1_0_100101_00;//ori
        6'b001110:{regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,ALUControl,saveOpt}=26'b0_1_0_1_0_0_0000_0_1_1_0_100110_00;//xori
        6'b001111:{regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,ALUControl,saveOpt}=26'b0_1_0_1_0_0_0000_0_1_1_0_101010_00;//lui这里没有办法调用现成的了。。所以在ALU定义了一个func
        6'b100011:{regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,ALUControl,saveOpt}=26'b0_1_1_1_1_0_0000_0_1_1_0_100001_10;//lw
        6'b000100:{regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,ALUControl,saveOpt}=26'b0_1_1_1_0_1_0000_0_1_1_0_100001_00;//sw
        6'b101011:{regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,ALUControl,saveOpt}=26'b0_0_0_0_0_0_0001_0_1_0_0_100010_00;//beq 
        6'b101011:{regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,ALUControl,saveOpt}=26'b0_0_0_0_0_0_0010_0_1_0_0_100010_00;//bne
        6'b101011:{regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,ALUControl,saveOpt}=26'b0_0_0_0_0_0_0011_0_1_0_0_100010_00;//bgtz
        6'b001110:{regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,ALUControl,saveOpt}=26'b0_1_0_1_0_0_0000_0_1_1_0_101010_00;//slti
        6'b001110:{regDst,ALUsrc,memToReg,regWrite,memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,ALUControl,saveOpt}=26'b0_1_0_1_0_0_0000_0_1_1_0_101011_00;//sltiu
        endcase 
        end
endmodule
