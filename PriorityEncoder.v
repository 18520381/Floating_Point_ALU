module PriorityEncoder(
			input [24:0] MemIn,
			input [7:0] ExpA,
			output reg [24:0] MemOut,
			output [7:0] ExpSub
			);

reg [4:0] Shift;

always @(MemIn)
begin
	casex (MemIn)
		25'b1_1xxx_xxxx_xxxx_xxxx_xxxx_xxxx :	begin
													MemOut = MemIn;
									 				Shift = 5'd0;
								 			  	end
		25'b1_01xx_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin						
										 			MemOut = MemIn << 1;
									 				Shift = 5'd1;
								 			  	end

		25'b1_001x_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin						
										 			MemOut = MemIn << 2;
									 				Shift = 5'd2;
								 				end

		25'b1_0001_xxxx_xxxx_xxxx_xxxx_xxxx : 	begin 							
													MemOut = MemIn << 3;
								 	 				Shift = 5'd3;
								 				end

		25'b1_0000_1xxx_xxxx_xxxx_xxxx_xxxx : 	begin						
									 				MemOut = MemIn << 4;
								 	 				Shift = 5'd4;
								 				end

		25'b1_0000_01xx_xxxx_xxxx_xxxx_xxxx : 	begin						
									 				MemOut = MemIn << 5;
								 	 				Shift = 5'd5;
								 				end

		25'b1_0000_001x_xxxx_xxxx_xxxx_xxxx : 	begin						// 24'h020000
									 				MemOut = MemIn << 6;
								 	 				Shift = 5'd6;
								 				end

		25'b1_0000_0001_xxxx_xxxx_xxxx_xxxx : 	begin						// 24'h010000
									 				MemOut = MemIn << 7;
								 	 				Shift = 5'd7;
								 				end

		25'b1_0000_0000_1xxx_xxxx_xxxx_xxxx : 	begin						// 24'h008000
									 				MemOut = MemIn << 8;
								 	 				Shift = 5'd8;
								 				end

		25'b1_0000_0000_01xx_xxxx_xxxx_xxxx : 	begin						// 24'h004000
									 				MemOut = MemIn << 9;
								 	 				Shift = 5'd9;
								 				end

		25'b1_0000_0000_001x_xxxx_xxxx_xxxx : 	begin						// 24'h002000
									 				MemOut = MemIn << 10;
								 	 				Shift = 5'd10;
								 				end

		25'b1_0000_0000_0001_xxxx_xxxx_xxxx : 	begin						// 24'h001000
									 				MemOut = MemIn << 11;
								 	 				Shift = 5'd11;
								 				end

		25'b1_0000_0000_0000_1xxx_xxxx_xxxx : 	begin						// 24'h000800
									 				MemOut = MemIn << 12;
								 	 				Shift = 5'd12;
								 				end

		25'b1_0000_0000_0000_01xx_xxxx_xxxx : 	begin						// 24'h000400
									 				MemOut = MemIn << 13;
								 	 				Shift = 5'd13;
								 				end

		25'b1_0000_0000_0000_001x_xxxx_xxxx : 	begin						// 24'h000200
									 				MemOut = MemIn << 14;
								 	 				Shift = 5'd14;
								 				end

		25'b1_0000_0000_0000_0001_xxxx_xxxx  : 	begin						// 24'h000100
									 				MemOut = MemIn << 15;
								 	 				Shift = 5'd15;
								 				end

		25'b1_0000_0000_0000_0000_1xxx_xxxx : 	begin						// 24'h000080
									 				MemOut = MemIn << 16;
								 	 				Shift = 5'd16;
								 				end

		25'b1_0000_0000_0000_0000_01xx_xxxx : 	begin						// 24'h000040
											 		MemOut = MemIn << 17;
										 	 		Shift = 5'd17;
												end

		25'b1_0000_0000_0000_0000_001x_xxxx : 	begin						// 24'h000020
									 				MemOut = MemIn << 18;
								 	 				Shift = 5'd18;
								 				end

		25'b1_0000_0000_0000_0000_0001_xxxx : 	begin						// 24'h000010
									 				MemOut = MemIn << 19;
								 	 				Shift = 5'd19;
												end

		25'b1_0000_0000_0000_0000_0000_1xxx :	begin						// 24'h000008
									 				MemOut = MemIn << 20;
								 					Shift = 5'd20;
								 				end

		25'b1_0000_0000_0000_0000_0000_01xx : 	begin						// 24'h000004
									 				MemOut = MemIn << 21;
								 	 				Shift = 5'd21;
								 				end

		25'b1_0000_0000_0000_0000_0000_001x : 	begin						// 24'h000002
									 				MemOut = MemIn << 22;
								 	 				Shift = 5'd22;
								 				end

		25'b1_0000_0000_0000_0000_0000_0001 : 	begin						// 24'h000001
									 				MemOut = MemIn << 23;
								 	 				Shift = 5'd23;
								 				end

		25'b1_0000_0000_0000_0000_0000_0000 : 	begin						// 24'h000000
								 					MemOut = MemIn << 24;
							 	 					Shift = 5'd24;
								 				end
		default : 	begin
						MemOut = (~MemIn) + 1'b1;
						Shift = 8'd0;
					end

	endcase
end
assign ExpSub = ExpA - Shift;

endmodule