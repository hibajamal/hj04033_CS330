module Control_Unit
(
	input [6:0] Opcode,
	
	output reg [2:0] EX,
	output reg [2:0] M,	
	output reg [1:0] WB
);

reg ALUSrc;
reg MemtoReg;
reg RegWrite;
reg MemRead;
reg MemWrite;
reg Branch;
reg [1:0] ALUOp;

	always@(*)
	begin
		case (Opcode[6:4])
		3'b011:	//R-type
		begin
			{ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 8'b00100010;
		end
		3'b000:	//i-type (id)
		begin
			{ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 8'b11110000;
		end
		3'b010:	//s-type (sd)
		begin
			{ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 8'b10001000;
		end
		3'b110:	//sb-type (beq)
		begin
			{ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} = 8'b00000101;
		end
		endcase
		EX = {ALUOp, ALUSrc};
		M = {Branch, MemWrite, MemRead};
		WB = {MemtoReg, RegWrite};
	end

endmodule
