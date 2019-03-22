module top_control(
	input [6:0] Opcode,
	input [3:0] Funct,
	output [3:0] Operation
);

	wire Branch;
	wire MemRead; 
	wire MemtoReg; 
	wire MemWrite; 
	wire ALUSrc; 
	wire RegWrite;
	wire [1:0] ALUOp;

Control_Unit cu0(
	.Opcode(Opcode),
	.Branch(Branch),
	.MemRead(MemRead),
	.MemtoReg(MemtoReg),
	.MemWrite(MemWrite),
	.ALUSrc(ALUSrc),
	.RegWrite(RegWrite),
	.ALUOp(ALUOp)
);

ALU_Control ac0(
	.ALUOp(ALUOp),
	.Funct(Funct),
	.Operation(Operation)
);

endmodule