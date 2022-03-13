`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/02/28 12:16:15
// Design Name: 
// Module Name: myALU_test
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

module myALU_test;
    reg [10:0] op;
    reg [31:0] in1,in2;
    wire [31:0] out;
    wire cf,of,zf;
    ALU ALU(in1,in2,op,out,cf,of,zf);
    initial
    begin
       //add
         op=11'b00000100000;        
         in1=32'hf2340000;
         in2=32'h80000000;
    #20  in1=32'h7fffffff;
         in2=32'h70000001;
    #20  in1=32'h7fffffff;
         in2=32'hf0000001;
    #20  in1=32'hffffffff;
         in2=32'h00000001;
    //addu          
    #20  op=11'b00000100001;   
         in1=32'hf2340000;
         in2=32'h80000000;
    #20  in1=32'h7fffffff;
         in2=32'h70000001;
    #20  in1=32'hffffffff;
         in2=32'h00000001;
    //sub    
    #20  op=11'b00000100010;        
         in1=32'h72340000;
         in2=32'h60000000;
    #20  in1=32'h7fffffff;
         in2=32'hf0000001;
    #20  in1=32'hf00fffff;
         in2=32'h7ffffff1;
    #20  in1=32'hffffffff;
         in2=32'hffffffff;
    #20  in1=32'hf0000000;
         in2=32'h0fffffff; 
    //subu
    #20  op=11'b00000100011;        
         in1=32'h72340000;
         in2=32'h60000000;
    #20  in1=32'h7fffffff;
         in2=32'hf0000001;
    #20  in1=32'hffffffff;
         in2=32'hffffffff;
    #20  in1=32'hf0000000;
         in2=32'h0fffffff; 
    //and
    #20  op=11'b00000100100;        
         in1=32'h72340000;
         in2=32'h60000000;
    #20  in1=32'h7fffffff;
         in2=32'h00000000; 
    //or
    #20  op=11'b00000100101;        
         in1=32'h00000000;
         in2=32'h00000000;
    #20  in1=32'h7fffffff;
         in2=32'hf0000001;
    //xor
    #20  op=11'b00000100110;        
         in1=32'ha0000000;
         in2=32'h50000000;
    #20  in1=32'h7fffffff;
         in2=32'hf0000001;
    //nor
    #20  op=11'b00000100111;        
         in1=32'h123451ff;
         in2=32'h60000000;
    #20  in1=32'h7fffffff;
         in2=32'hf0000001;
    //slt
    #20  op=11'b00000101010;        
         in1=32'h72340000;
         in2=32'hf0000000;
    #20  in1=32'h7000000f;
         in2=32'h7f000001;
    #20  in1=32'hf0001231;
         in2=32'h7ac34545;
    //sltu
    #20  op=11'b00000101011;        
         in1=32'h72340000;
         in2=32'hf0000000;
    #20  in1=32'h7000000f;
         in2=32'h7f000001;
    #20  in1=32'hf0001231;
         in2=32'h7ac34545;
    //shl
    #20  op=11'b00000000100;
         in1=32'hffffffff;
         in2=32'd5;
    //shr
    #20  op=11'b00000000110;
         in1=32'hffffffff;
         in2=32'd5;
    //sar
    #20  op=11'b00000000111;
         in1=32'hffffffff;
         in2=32'd3;
    #20  in1=32'h0fffffff;
         in2=32'd5;
    end
    
endmodule
