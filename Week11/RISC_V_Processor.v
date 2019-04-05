module RISC_V_Processor(
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

wire [6:0]opcode;
wire [4:0]rd;
wire [2:0]funct3;
wire [4:0]rs1;
wire [4:0]rs2;
wire [6:0]funct7;

// instruction going to ip to be divided up
InstructionParser ip0(
.instruction(Instruction),
.opcode(opcode),
.rd(rd),
.funct3(funct3),
.rs1(rs1),
.rs2(rs2),
.funct7(funct7)
);

wire Branch;
wire MemRead;
wire MemtoReg;
wire MemWrite;
wire ALUSrc;
wire RegWrite;
wire [1:0]ALUOp;

// extracted opcode goes to control unit
Control_Unit cu0(
.Opcode(opcode),
.Branch(Branch),
.MemRead(MemRead),
.MemtoReg(MemtoReg),
.MemWrite(MemWrite),
.ALUSrc(ALUSrc),
.RegWrite(RegWrite),
.ALUOp(ALUOp)
);

wire [63:0]imm_data;

ImmediateDataExtractor idg0(
.instruction(Instruction),
.imm_data(imm_data)
);

wire [63:0]a1OUT; // carrying result of next calculated address (+imm_data)

Adder a1(
.a(PC_Out),
.b(imm_data << 1),
.out(a1OUT)
);

wire [63:0]WriteData; // carrying output from data memory mux
wire [63:0]ReadData1; // regfile output 1
wire [63:0]ReadData2; // regfile output 2

registerFile rf0(
.clk(clk),
.reset(reset),
.RegWrite(RegWrite),
.WriteData(WriteData),
.RS1(rs1),
.RS2(rs2),
.RD(rd),
.ReadData1(ReadData1),
.ReadData2(ReadData2)
);

wire [63:0] ALU_second_input;

// regfile mux
mux m0(
.a(ReadData2),
.b(imm_data),
.sel(ALUSrc),
.data_out(ALU_second_input)
);

wire [3:0]Operation;  // output of alucontrol

ALU_Control alu_c0(
.ALUOp(ALUOp),
.Funct({Instruction[30],Instruction[14:12]}),
.Operation(Operation)
);

wire [63:0] Result;   // result of alu
wire CarryOut;  // carryout of alu

ALU_64_bit alu_64_b0(
.a(ReadData1),
.b(ALU_second_input),
.ALUop(Operation),
.Result(Result),
.CarryOut(CarryOut)
);

// adder mux
mux m1(
.a(a0OUT),
.b(a1OUT),
.sel(CarryOut && Branch),
.data_out(PC_In)
);

wire [63:0]Read_Data; // output from data memory

Data_Memory dm0(
.Write_Data(ReadData2),
.clk(clk),
.MemWrite(MemWrite),
.MemRead(MemRead),
.Mem_Addr(Result),
.Read_Data(Read_Data)
);

// data memory mux
mux m2(
.a(Result),
.b(Read_Data),
.sel(MemtoReg),
.data_out(WriteData)
);

endmodule