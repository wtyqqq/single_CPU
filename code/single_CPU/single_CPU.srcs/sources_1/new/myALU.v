`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Tianyi Wang
// 
// Create Date: 2022/02/28 12:04:51
// Design Name: 
// Module Name: myALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: myALU 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    in1,in2,smt,op,out,cf,of,zf
    );
    input [31:0] in1,in2;
    input [10:6] smt;
    input [5:0] op;
    output reg [31:0] out;
    output reg cf,of,zf;
    always@(in1 or in2 or smt or op)begin
        case(op)
        // add 
         6'b100000:
         begin
         out=in1+in2;
         of = ((in1[31]==in2[31])&&(~out[31]==in1[31]))?1:0;
         zf=(out == 0)?1:0;
         cf =0;
         end
         //addu
         6'b100001:
         begin
         {cf,out}=in1+in2;
         zf = (out==0)?1:0;
         of = 0;
         end
         //sub
         6'b100010: 
         begin
         out=in1-in2;
         of= ((in1[31]==0&&in2[31]==1&&out[31]==1)||(in1[31]==1&&in2[31]==0&&out[31]==0))?1:0;
         zf=(in1 == in2)?1:0;
         cf=0;
         end
         //subu
         6'b100011:
         begin
         {cf,out}=in1-in2;
         zf=(out==0)?1:0;
         of=0;
         end 
         //and 
         6'b100100:
         begin
         out=in1&in2;
         zf=(out==0)?1:0;
         cf=0;
         of=0;
         end 
         //or
         6'b100101:
         begin 
         out=in1|in2;
         zf=(out==0)?1:0;
         cf=0;
         of=0;
         end 
         //xor
         6'b100110:
         begin
         out=in1^in2;
         zf = (out==0)?1:0;
         cf=0;
         of=0;
         end          
         //nor
         6'b100111:
         begin
         out=~(in1|in2);
         zf=(out==0)?1:0;
         of=0;
         cf=0;
         end
         //slt
         6'b101010:
         begin
         if(in1[31]==1&&in2[31]==0)
         out=1;
         else if(in1[31]==0&&in2[31]==1)
         out=0;
         else
         out=(in1<in2)?1:0;
         of=out;
         zf=(out==0)?1:0;
         cf=0;
         end
         //sltu
         6'b101011:
         begin
         out = (in1<in2)?1:0;
         cf = out;
         zf=(out==0)?1:0;
         of = 0;
         end
         //sll
         6'b000000:
         begin 
         {cf,out} = in1<<smt;
         of=0;
         zf=(out==0)?1:0;
         end
         //slr
         6'b000010:
         begin 
         out=in1>>smt;
         cf = in1[smt-1];
         of = 0;
         zf = (out==0)?1:0;
         end
         //sra
         6'b000011:
         begin 
         out = ($signed(in1))>>>smt;
         cf = in1[smt-1];
         of = 0;
         zf = (out == 0)?1:0;
         end
         //sllv
         6'b000100:
         begin
         {cf,out} = in1<<in2;
         of=0;
         zf=(out==0)?1:0;
         end
         //slrv
         6'b000110:
         begin
         out=in1>>in2;
         cf = in1[in2-1];
         of = 0;
         zf = (out==0)?1:0;
         end
         //srav
         6'b000111:
         begin
         out = ($signed(in1))>>>in2;
         cf = in1[in2-1];
         of = 0;
         zf = (out == 0)?1:0;
         end
         6'b101010:
         //lui
         begin
         out = in2 << 16;
         zf = (out ==0)?1:0;
         of = 0;
         cf = 0;
         end
         default:
         begin
         out=32'hFFFFFFFF;
         zf = 1;
         of = 1;
         cf  =1;
         end
         endcase
    end
endmodule
