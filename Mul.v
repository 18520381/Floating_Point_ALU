module Mul(
	input [31:0] InA,
	input [31:0] InB,
	output [31:0] Out
	);

	wire Sign,Rounded,PreExp,Zero;
	wire [8:0] Exp,SumExp;
	wire [22:0] Final;
	wire [23:0] TempA,TempB;
	wire [47:0] PreTempOut,TempOut;

	assign Sign = InA[31] ^ InB[31];
	assign Exception = (&InA[30:23]) | (&InB[30:23]);

	assign TempA = (|InA[30:23]) ? {1'b1,InA[22:0]} : {1'b0,InA[22:0]};
	assign TempB = (|InB[30:23]) ? {1'b1,InB[22:0]} : {1'b0,InB[22:0]};

	assign PreTempOut = TempA * TempB;			
	assign Rounded = |TempOut[22:0];  
	assign PreExp = PreTempOut[47] ? 1'b1 : 1'b0;	
	assign TempOut = PreExp ? PreTempOut : PreTempOut << 1;
	assign Final = TempOut[46:24] + (TempOut[23] & Rounded); 
	assign Zero = Exception ? 1'b0 : (Final == 23'd0) ? 1'b1 : 1'b0;
	assign SumExp = InA[30:23] + InB[30:23];
	assign Exp = SumExp - 8'd127 + PreExp;
	assign Overflow = ((Exp[8] & !Exp[7]) & !Zero) ; 
	assign Underflow = ((Exp[8] & Exp[7]) & !Zero) ? 1'b1 : 1'b0; 
	assign Out = Exception ? 32'd0 : Zero ? {Sign,31'd0} : Overflow ? {Sign,8'hFF,23'd0} : Underflow ? {Sign,31'd0} : {Sign,Exp[7:0],Final};


endmodule