module Iteration(
	input [31:0] InA,
	input [31:0] InB,
	output [31:0] Out
	);

wire [31:0] Value1,Value2;

Mul M1(InA,InB,Value1);

Add_Sub A1(32'h4000_0000,{1'b1,Value1[30:0]},1'b0,Value2);

Mul M2(InA,Value2,Out);

endmodule