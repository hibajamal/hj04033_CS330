module tb();

reg [6:0] Opcode;
reg [3:0] Funct;
wire [3:0]Operation;

top_control tc0(
	.Opcode(Opcode),
	.Funct(Funct),
	.Operation(Operation)
);

initial
begin
	/*Opcode = 7'b0110011;	
	Funct = 0;
	
	#5 Funct = 1;
	
	#15 Funct = 4'b1000;
	*/
	Opcode = 7'b0110011;	//r-type
	#2 Funct = 4'b0000;
	#2 Funct = 4'b0111;
	#2 Funct = 4'b0110;
	#2 Funct = 4'b1000;

	#10 Opcode = 7'b0100011;	//s-type
	
	#15 Funct = 4'b0111;
	#10 Opcode = 7'b0000011; // i-type
	#10 Opcode = 7'b0000011; // i-type
	
	#15 Funct = 4'b0110;
	#10 Opcode = 7'b1100011;	//sb-type
end

endmodule