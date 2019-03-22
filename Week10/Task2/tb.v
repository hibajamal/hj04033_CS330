module tb();

reg [1:0] ALUOp;
reg [3:0] Funct;
wire [3:0]Operation;

ALU_Control ac_0(
	.ALUOp(ALUOp),
	.Funct(Funct),
	.Operation(Operation)
);

initial
begin
	ALUOp = 2'b00;
	Funct = 0;
	
	#15 ALUOp = 2'b01;
	
	#15 ALUOp = 2'b10;
	
	#5 Funct = 1;
	
	#15 Funct = 4'b1000;
	
	#15 Funct = 4'b0111;
	
	#15 Funct = 4'b0110;
end

endmodule