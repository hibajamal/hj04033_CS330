module Control_Unit
(
	input [6:0] Opcode,
	
	output reg [2:0] EX,
	output reg [2:0] M,	
	output reg [1:0] WB,
);

	always@(*)
	begin
		WB = Opcode[1:0]
		M  = Opcode[4:2]
		EX = Opcode[6:4]
	end