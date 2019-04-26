module PipeLinedProcessor(
input clk, reset
);

wire [63:0]PC_In;
wire [63:0]PC_Out;

Program_Counter pc0(
.clk(clk),
.reset(reset),
.PC_In(PC_In),
.PC_Out(PC_Out)
);

wire [31:0]Instruction;

// taking input from pc and passes output to instruction parser
Instruction_Memory im0(
.Inst_Address(PC_Out),
.Instruction(Instruction)
);

wire [63:0]a0OUT; // carrying result of next calculated address (+4)

Adder a0(
.a(PC_Out),
.b(64'b100),
.out(a0OUT)
);

// PASSING CONNECTIONS TO IF/ID:

wire [31:0] Instruction_Out_IF_ID;
wire [63:0] Inst_Addr_Out_IF_ID;

IF_ID ifid0(
.clk(clk),
.Instruction(Instruction),
.Inst_Addr(PC_Out),
.Instruction_Out(Instruction_Out),
.Inst_Addr_Out(Inst_Addr_Out)
);

endmodule