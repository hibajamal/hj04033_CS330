module Alu_Part
(
	input clk, reset
);

wire [63:0] ID_EX_Instruction_Address;
wire [63:0] ID_EX_imm_data;
wire [63:0] ID_EX_ReadData1;
wire [63:0] ID_EX_ReadData2;
wire [4:0] ID_EX_Rs1;
wire [4:0] ID_EX_Rs2;
wire [4:0] ID_EX_Rd;
wire [3:0] ID_EX_funct;
wire [63:0] Write_back_mux_result;
wire [63:0] EX_MEM_Mem_Address;
wire [1:0] Forward_A;
wire [63:0] Forward_A_mux_result;
wire [63:0] Forward_B_mux_result;
wire [63:0] mux_result;
wire [63:0] adder_result;
wire ALUSrc;
wire [1:0] ALUOp;
wire [3:0] ALU_ALUOp;
wire [63:0] ALU_Result;
wire CarryOut;


mux3 Forward_A_mux (
	.a(ID_EX_ReadData1),
	.b(Write_back_mux),
	.c(EX_MEM_Mem_Address),
	.sel(Forward_A),
	.data_out(Forward_A_mux_result)
);

mux3 Forward_B_mux (
	.a(ID_EX_ReadData2),
	.b(Write_back_mux),
	.c(EX_MEM_Mem_Address),
	.sel(Forward_B),
	.data_out(Forward_A_mux_result)
);

mux MUX (
	.a(Forward_B_mux_result),
	.b(ID_EX_imm_data),
	.sel(ALUSrc),
	.data_out(mux_result)
);

Adder small_adder (
	.a(ID_EX_Instruction_Address),
	.b(ID_EX_imm_data << 1),
	.out(adder_result)
);

ALU_Control ALU_Control (
	.ALUOp(ALUOp),
	.Funct(ID_EX_funct),
	.Operation(ALU_ALUOp)
);


ALU_64_bit ALU (
	.a(Forward_A_mux_result),
	.b(Forward_B_mux_result),
	.ALUOp(ALU_ALUOp),
	.Result(ALU_Result),
	.CarryOut(CarryOut)
);

