`timescale 1ns / 1ps


module MUX(
	input choice,
	input [31:0] data_in1,
	input [31:0] data_in2,
	output [31:0] dataOut
);
	assign dataOut=(m==0)?data_in1:data_in2;
endmodule

module MMUX(
	input [1:0] choice,
	input [31:0] data_in1,
	input [31:0] data_in2,
	input [31:0] data_in3,
	output [31:0] dataOut
);
reg [31:0] result;
always@(choice,data_in1,data_in2,data_in3)
	begin
		case(choice)
			2'b00:result<=data_in1;
			2'b01:result<=data_in2;
			2'b10:result<=data_in3;
			default: out <= 32'h00000000;
		endcase	
	end
	assign dataOut = out;
endmodule