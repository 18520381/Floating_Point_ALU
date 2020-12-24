module Div(
	input [31:0] InA,
	input [31:0] InB,
	output [31:0] Out
	);

	wire Sign;
	wire [7:0] Shift;
	wire [7:0] ExpA;
	wire [31:0] Divi;
	wire [31:0] TempA;
	wire [31:0] Mid;
	wire [31:0] Re0;
	wire [31:0] Re1;
	wire [31:0] Re2;
	wire [31:0] Re3;
	wire [31:0] TempOut;

	assign Sign = InA[31] ^ InB[31];
	assign Shift = 8'd126 - InB[30:23];
	assign Divi = {1'b0,8'd126,InB[22:0]};

	assign ExpA = InA[30:23] + Shift;
	assign TempA = {InA[31],ExpA,InA[22:0]};

	Mul x0(32'hC00B_4B4B,Divi,Mid);

	Add_Sub X0(Mid,32'h4034_B4B5,1'b0,Re0);

	Iteration X1(Re0,Divi,Re1);
	Iteration X2(Re1,Divi,Re2);
	Iteration X3(Re2,Divi,Re3);

	Mul END(Re3,TempA,TempOut);

	assign Out = {Sign,TempOut[30:0]};
	
endmodule