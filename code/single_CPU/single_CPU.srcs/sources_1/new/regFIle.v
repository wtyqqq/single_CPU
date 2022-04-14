`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/03/08 11:06:32
// Design Name: 
// Module Name: regFIle
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


module RegFile(//时钟输入//归零
    input we, //写开关
    
    input clk,
    input [4:0] raddr1,//读取的地址1
    input [4:0] raddr2,//读取的地址2
    input [4:0] waddr,//写入的地址
    input [31:0] wdata,//写入的数据
    output [31:0] rdata1,//读取的数据1
    output [31:0] rdata2 //读取的数据2
    );
    
    reg [31:0] array_reg [0:31];//MIPS架构的32个通用寄存器

    integer i;
    initial begin
//        rdata1 <= 0;
//        rdata2 <= 0;
        for (i = 0; i < 32; i = i+1) array_reg[i] <= 0;  
    end
    wire[31:0] r1_tmp;
    wire[31:0] r2_tmp;
    assign rdata1 = array_reg[raddr1];
    assign rdata2 = array_reg[raddr2];
//    always@(negedge clk or rdata1 or rdata2) 
//    begin
//        rdata1 <= array_reg[raddr1];
//        rdata2 <= array_reg[raddr2];
//        //$display("regfile %d %d\n", ReadReg1, ReadReg2);
//    end
   
always@(negedge clk)
    begin
        //$0恒为0，所以写入寄存器的地址不能为0
        if(we && waddr!=0)
            begin
                array_reg[waddr] <= wdata;
            end
    end
    endmodule
