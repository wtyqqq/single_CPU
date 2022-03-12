`timescale 1ns / 1ps
module Ext5(
	input [4:0] dataInput,
	output [31:0] dataOut,
	input ca
);
	assign dataOut = (ca==0)?{27'b0,dataInput}:{{27{dataInput[4]}},dataInput};
endmodule



module Ext16(
	input [15:0] dataInput,
	output [31:0] dataOut,
	input ca
);
	assign dataOut=(ca == 0)?{16'b0,dataInput}:{{16{dataInput[15]}},dataInput};
endmodule


module Ext18(
	input [17:0] dataInput,
	output [31:0] dataOut,
	input ca
);
	assign dataOut = (ca == 0)?{14'b0,dataInput}:{{14{dataInput[17]}},dataInput};
endmodule