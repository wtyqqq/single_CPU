`timescale 1ns / 1ps
module all_test();
//module PC_test();
   reg clk,rst,ew;
   reg [31:0] inputData;
   wire [31:0] outputData;
   //module Regfile_test;
   reg we; //写开关
   reg [4:0] raddr1;//读取的地址1
   reg [4:0] raddr2;//读取的地址2
   reg [4:0] waddr;//写入的地址
   reg [31:0] wdata;//写入的数据
   wire [31:0] rdata1;//读取的数据1
   wire [31:0] rdata2;//读取的数据2
   //module Ext5_test;
    reg [4:0] Ext5dataInput;
    wire [31:0] dataOut;
    reg ca;
    // moduleExt16_test;
    reg [15:0] dataInput;
    wire [31:0] dataOut;
    //module myALU_test;
    reg [10:0] ALUop;
    reg [31:0] in1,in2;
    reg [10:6] smt;
    wire [31:0] out;
    wire cf,of,zf;
    //module MUX1-4_test;
    reg muxchoice;
	reg [31:0] data_in1;
	reg [31:0] data_in2;
	wire [31:0] dataOut;
	//module MUX5_test;
   reg choice;
   reg [31:0] data_in1;
   reg [31:0] data_in2;
   wire [4:0] dataOut;
  //module MUX6_test;
   reg [1:0] mmuxchoice;
   reg [31:0] data_in1;
   reg [31:0] data_in2;
   reg [31:0] data_in3;
   wire [31:0] dataOut;
   //module  control_unit_test;
    reg [5:0] op;
     reg [5:0] fun;
     wire [5:0] ALUControl;
     wire regDst;
     wire ALUsrc;
     wire memToReg;
     wire regWrite;
     wire memRead;
        wire memWrite;
         wire [3:0] branch;
        wire jump;
        wire PCwrite;
         wire zeroExt;
         wire readShamt;
         wire [1:0] saveOpt;
    //module BranchControl_test;
    reg Input;
    wire Output;
    reg Sign_in;
    reg Zero_in;
    // module ADD32_test;
    reg addin1;
    reg addin2;
    wire addout;
    
 
   
    PCReg pcreg(clk,rst,ew,inputData,outputData);
    RegFile  regfile(clk,rst,we,raddr1,raddr2,waddr,wdata,rdata1,rdata2);
    Ext5 Ext5(Ext5dataInput,dataOut,ca);
    Ext16 Ext16(dataInput,dataOut,ca); 
    ALU ALU(in1,in2,smt,ALUop,out,cf,of,zf);
    MUX mux(muxchoice,data_in1,data_in2,dataOut);
    spMUX MUX5(choice,data_in1,data_in2,dataOut);
    MMUX MUX6(mmuxchoice,data_in1,data_in2,data_in3,dataOut);
    controlUnit controlunit(op,fun,ALUControl,regDst,ALUsrc,memToReg,regWrite, memRead,memWrite,branch,jump,PCwrite,zeroExt,readShamt,saveOpt);
    BranchControl branchcontrol(Input,Output,Sign_in,Zero_in);
    ADD32 add32(addin1,addin2,addout);
   always #10 clk=~clk;
   initial 
   begin
   //PC
     clk=0;
     rst=0;
     ew=1;
     inputData=32'b0;
     #30  inputData=32'b1;
     #20  inputData=32'b0;
         ew=0;
     #20  inputData=32'b1;
     rst=1;
     //Regfile
     #20
     we = 0;
     raddr1 = 0;
     #20 raddr2 = 5'b00001;
     #20 raddr2 = 5'b00010;
     #20 raddr2 = 5'b00100;
     #20 raddr2 = 5'b01000;
     #20 raddr2 = 5'b10000;
     #20
     we = 1;
     wdata = 5'b00001;
     waddr = 0;
     #20
     we = 1;
     wdata = 5'b0000;
     waddr = 1;
     //Ext5
     # 20
    ca=0;
    dataInput = 5'b10000;
    # 20
    ca = 1;
    dataInput = 5'b10000;
    //Ext16
    #20
    ca=0;
    dataInput = 16'b1000_0000_0000_0000;
    #20
    ca = 1;
    dataInput = 16'b1000_0000_0000_0000;
    //ALU
    #20
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
    //sll
    #20  op=11'b00000000000;
         in1=32'hffffffff;
         in2=32'd5;
         smt = 0;
    //slr
    #20  op=11'b00000000010;
         in1=32'hffffffff;
         in2=32'd5;
         smt = 0;
         
    //sra
    #20  op=11'b00000000011;
         in1=32'hffffffff;
         in2=32'd3;
         smt = 0;
    #20  in1=32'h0fffffff;
         in2=32'd5;
         smt = 0;
    //sllv
    # 20
         op=11'b00000000100;
         in1=32'hffffffff;
         in2=32'd5;
   // slrv
   # 20 
      op = 11'b00000000110;
      in1 = 32'hffffffff;
      in2 = 32'd5;
   // srav
   # 20
      op = 11'b00000000111;
      in1 = 32'hffffffff;
      in2 =32'd5;
    // MUX     
    #20
    data_in1 = 32'b0000_1001_0000_0000_0000_0000_0000_0000;
    data_in2 = 32'b0000_0110_0000_0000_0000_0000_0000_0000; 
    choice = 0;
    # 20
    choice = 1;  
    //spMUX
    # 20
    data_in1 = 32'b0000_1001_0000_0000_0000_0000_0000_0000;
    data_in2 = 32'b0000_0110_0000_0000_0000_0000_0000_0000; 
    choice = 0;
    # 20
    choice = 1;   
    //MMUX
    # 20
    data_in1=32'b0000_0000_0000_0000_0000_0000_0000_1001;
    data_in2=32'b0000_0000_0000_0000_0000_0000_0000_0110;
    data_in3=32'b0000_0000_0000_0000_0000_0000_0000_0101;
    choice=0;
    # 20
    choice=1;
    //ControlUnit
    #20
         op=6'b000000;
         #20
         op=6'b001000; 
         #20
         op=6'b001100; 
         #20
         op=6'b001101; 
         #20
         op=6'b001010; 
         #20
         op=6'b100011; 
         #20
         op=6'b101011; 
         #20
         op=6'b000010; 
         
    //branchcontrol
    #20 Input = 4'b0010;
        Sign_in = 0;
        Zero_in = 1;
    //add32
    #20
    addin1 = 5'b00100;
    addin2 = 5'b00110;
    
    
   end
endmodule   