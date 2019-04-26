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

// taking input from pc and passes output to BUFFER, IF/ID
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

// IF_ID BUFFER
IF_ID ifid0(
.clk(clk),
.Instruction(Instruction),    // to instruction parser and ID/EX and immediate data extractor
.Inst_Addr(PC_Out),
.Instruction_Out(Instruction_Out_IF_ID),
.Inst_Addr_Out(Inst_Addr_Out_IF_ID)
);

// PASSING STORED VALUE FROM IF/ID BUFFER TO INSTRUCTION PARSER

wire [6:0]opcode;
wire [4:0]MEM_WB_rd_out;
wire [2:0]funct3;
wire [4:0]rs1;
wire [4:0]rs2;
wire [6:0]funct7;

// instruction going to ip to be divided up
InstructionParser ip0(
.instruction(Instruction),
.opcode(opcode),    // should go to control unit uper wala
.rd(rd),      // to regfile and ID/EX
.funct3(funct3),
.rs1(rs1),    // to regfile and ID/EX
.rs2(rs2),    // to regfile and ID/EX
.funct7(funct7)
);

// FROM THE OPCODE GENERATED, GET CONTROL UNIT

wire ALUSrc;
wire MemtoReg;
wire [1:0]ALUOp;

// extracted opcode goes to control unit for pipelining control signals
wire [2:0] EX;
wire [2:0] M;
wire [1:0] WB;

Control_Unit cuPIPE(
.Opcode(opcode),
.EX(EX),
.M(M),
.WB(WB)
);

// FROM CURRENT INSTRUCTION, GENERATE IMMEDIATE DATA
wire [63:0]imm_data;

ImmediateDataExtractor idg0(
.instruction(Instruction),
.imm_data(imm_data)
);

// DATA FROM INSTRUCTION PARSER TO REGFILE

wire [63:0]WriteData; // carrying output from data memory mux*******
wire [63:0]ReadData1; // regfile output 1
wire [63:0]ReadData2; // regfile output 2

wire Reg_Write_MEM_WB;

registerFile rf0(
.clk(clk),
.reset(reset),
.RegWrite(Reg_Write_MEM_WB),
.WriteData(*************************************),
.RS1(rs1),
.RS2(rs2),
.RD(MEM_WB_rd_out),
.ReadData1(ReadData1),
.ReadData2(ReadData2)
);

// ALL DATA IS NOW AVAILABLE TO GO ON TO BUFFER ID/EX
wire [63:0] Inst_Addr_Out_ID_EX;
wire [4:0] RS1_Out_ID_EX;
wire [4:0] RS2_Out_ID_EX;
wire [4:0] RD_Out_ID_EX;
wire [63:0] ReadData1_Out_ID_EX;
wire [63:0] ReadData2_Out_ID_EX;
wire [63:0] ImmediateData_Out_ID_EX;
wire [3:0] Funct_ID_EX;
wire [1:0] WB_Out_ID_EX;
wire [2:0] M_Out_ID_EX;
wire [1:0] ALUOp_ID_EX;
wire ALUSrc_ID_EX;

ID_EX id_ex0(
.clk(clk),
.Inst_Addr(Inst_Addr_Out_IF_ID),
.Inst_Addr_Out(Inst_Addr_Out_ID_EX),
.RS1(rs1),
.RS1_Out(RS1_Out_ID_EX),
.RS2(rs2),
.RS2_Out(RS2_Out_ID_EX),
.RD(rd),
.RD_Out(RD_Out_ID_EX),
.ReadData1(ReadData1),
.ReadData1_Out(ReadData1_Out_ID_EX),
.ReadData2(ReadData2),
.ReadData2_Out(ReadData2_Out_ID_EX),
.ImmediateData(imm_data),
.ImmediateData_Out(ImmediateData_Out_ID_EX),
.Instruction(Instruction),
.Funct(Funct_ID_EX),
.WB(WB),
.WB_Out(WB_Out_ID_EX),
.M(M),
.M_Out(M_Out_ID_EX),
.EX(EX),
.ALUOp(ALUOp_ID_EX),
.ALUSrc(ALUSrc_ID_EX)
);

// ***********************KABIR BHAI KA HISSA ***********************************************

// first Adder inside buffer zone
wire [63:0] adder_result;

Adder small_adder (
	.a(Inst_Addr_Out_ID_EX),
	.b(ImmediateData_Out_ID_EX << 1),
	.out(adder_result)
);

// MEM WB Output:
wire [63:0] Write_back_mux_result;

// EX MEM output:
wire [63:0] ALU_Result_Out_EX_MEM;

// Forwarding Unit Outputs:
wire [1:0] Forward_A;
wire [1:0] Forward_B;

// mux output
wire [63:0] Forward_A_mux_result;
wire [63:0] Forward_B_mux_result;

mux3 Forward_A_mux (
	.a(ReadData1_Out_ID_EX),
	.b(Write_back_mux_result),
	.c(ALU_Result_Out_EX_MEM),
	.sel(Forward_A),
	.data_out(Forward_A_mux_result)
);

mux3 Forward_B_mux (
	.a(ReadData2_Out_ID_EX),
	.b(Write_back_mux_result),
	.c(ALU_Result_Out_EX_MEM),
	.sel(Forward_B),
	.data_out(Forward_A_mux_result)
);

// final mux result:
wire [63:0] mux_result;

mux MUX (
	.a(Forward_B_mux_result),
	.b(ImmediateData_Out_ID_EX),
	.sel(ALUSrc_ID_EX),
	.data_out(mux_result)
);

// alu control result:
wire [3:0] ALU_ALUOp;

ALU_Control ALU_Control (
	.ALUOp(ALUOp_ID_EX),
	.Funct(Funct_ID_EX),
	.Operation(ALU_ALUOp)
);

// ALU RESULTS:
wire [63:0] ALU_Result;
wire CarryOut;

ALU_64_bit ALU (
	.a(Forward_A_mux_result),
	.b(Forward_B_mux_result),
	.ALUOp(ALU_ALUOp),
	.Result(ALU_Result),
	.CarryOut(CarryOut)
);

// ALL DATA IS NOW AVAILABLE TO GO ON TO BUFFER EX/MEM


// outputs of BUFFER EX_MEM
wire [1:0] WB_Out_EX_MEM;
wire MemRead_EX_MEM;
wire MemWrite_EX_MEM;
wire [63:0] Adder_Result_Out_EX_MEM;
wire [63:0] Forward_B_Mux_Result_Out_EX_MEM;
wire [4:0] EX_MEM_RD_Out;
// generate RegWrite Signal
wire ALU_Zero_Out_EX_MEM;
wire Branch_EX_MEM;

EX_MEM em_mem0(
.clk(clk),
.WB(WB_Out_ID_EX),
.WB_Out(WB_Out_EX_MEM),
.M(M_Out_ID_EX),
.Branch(Branch_EX_MEM),
.MemWrite(MemWrite_EX_MEM),
.MemRead(MemRead_EX_MEM),
.Adder_Result(adder_result),
.Adder_Result_Out(Adder_Result_Out_EX_MEM),
.ALU_Zero(CarryOut),
.ALU_Zero_Out(ALU_Zero_Out_EX_MEM),
.ALU_Result(ALU_Result),
.ALU_Result_Out(ALU_Result_Out_EX_MEM),
.Forward_B_Mux_Result(Forward_B_mux_result),
.Forward_B_Mux_Result_Out(Forward_B_Mux_Result_Out_EX_MEM),
.ID_EX_Rd(RD_Out_ID_EX),
.ID_EX_Rd_Out(EX_MEM_RD_Out)
);

// Adder_Result_Out_EX_MEM can proceed to mux for program counter

mux m0(
.a(a0OUT),
.b(Adder_Result_Out_EX_MEM),
.sel(ALU_Zero_Out_EX_MEM && Branch_EX_MEM),
.data_out(PC_In)
);

// output of Data Memory
wire [63:0] Read_Data_DM;

// Data Memory
Data_Memory dm0(
.Write_Data(Forward_B_Mux_Result_Out_EX_MEM),
.clk(clk),
.MemWrite(MemWrite_EX_MEM),
.MemRead(MemRead_EX_MEM),
.Mem_Addr(ALU_Result_Out_EX_MEM),
.Read_Data(Read_Data_DM)
);

// OUTPUTS READY FOR LAST BUFFER
wire Mem_to_Reg_MEM_WB;
wire [63:0] Read_Data_out_MEM_WB;
wire [63:0] MEM_WB_Mem_Address_out;

// ouputs of MEM_WB:

MEM_WB mem_wb0(
.WB(WB_Out_EX_MEM),
.Mem_to_Reg(Mem_to_Reg_MEM_WB),
.Reg_Write(Reg_Write_MEM_WB),
.Read_Data(Read_Data_DM),
.Read_Data_out(Read_Data_out_MEM_WB),
.EX_MEM_Rd(EX_MEM_RD_Out),
.EX_MEM_Rd_out(MEM_WB_rd_out),
.EX_MEM_Mem_Address(ALU_Result_Out_EX_MEM),
.EX_MEM_Mem_Address_out(MEM_WB_Mem_Address_out)
);

// OUTPUT of MEM_WB goes to MUX

mux m1(
.a(MEM_WB_Mem_Address_out),
.b(Read_Data_out_MEM_WB),
.sel(Mem_to_Reg_MEM_WB),
.data_out(Write_back_mux_result)
);

Forwarding_Unit fu0(
.ID_EX_RS1(RS1_Out_ID_EX),
.ID_EX_RS2(RS2_Out_ID_EX),
.EX_MEM_Rd(EX_MEM_RD_Out),
.MEM_WB_Rd(MEM_WB_rd_out),
.EX_MEM_RegWrite(WB_Out_EX_MEM[1]),
.MEM_WB_RegWrite(Reg_Write_MEM_WB),
.ForwardA(Forward_A),
.ForwardB(Forward_B)
);


endmodule
