module Control_Unit(
	input [6:0] Opcode,
	output reg Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite,
	output reg [1:0] ALUOp
);

always @ (Opcode)
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
end

endmodule