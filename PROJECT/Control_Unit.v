module Control_Unit
(
	input [6:0] Opcode,
	
	output reg [2:0] EX,
	output reg [2:0] M,	
	output reg [1:0] WB
);

	always@(*)
	begin
		{WB, M, EX} = Opcode;
	end

endmodule
