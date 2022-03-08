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


module regFile(
    input clk,//时钟输入
    input rst,//归零
    input we, //写开关
    input [4:0] raddr1,//读取的地址1
    input [4:0] raddr2,//读取的地址2
    input [4:0] waddr,//写入的地址
    input [31:0] wdata,//写入的数据
    output [31:0] rdata1,//读取的数据1
    output [31:0] rdata2 //读取的数据2
    );
    
    reg [31:0] array_reg [0:31];//MIPS架构的32个通用寄存器
    integer i;
    always@(posedge clk or posedge rst) begin
        if(rst) 
            begin//reset功能
                for(i=0;i<32;i=i+1)
                    array_reg[i]<=32'b0;//将所有的数据归零
            end
        else 
            begin
                if(we&&waddr!=5'b0) //如果开启了写入，且目标寄存器不为零寄存器（因为默认零寄存器的值恒为0）
                    array_reg[waddr]<=wdata;//写入需要写入的寄存器
            end
    end
    
    assign rdata1=(raddr1==5'b0)?32'b0:array_reg[raddr1];//读取输出
    assign rdata2=(raddr2==5'b0)?32'b0:array_reg[raddr2];//读取输出
endmodule
