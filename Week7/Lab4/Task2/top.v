module top(
  input [31:0] instruction,
  output [63:0] ReadData1,
  output [63:0] ReadData2,
  
  input clk,
  input reset,
  input RegWrite, 
  input [63:0] WriteData
);

wire [6:0]opcode;
wire [2:0] funct3;
wire [6:0] funct7;
wire [4:0] RS1;
wire [4:0] RS2;
wire [4:0]RD;

InstructionParser ip0(
  .instruction(instruction),
  .opcode(opcode),
  .rd(RD),
  .funct3(funct3),
  .rs1(RS1),
  .rs2(RS2),
  .funct7(funct7)
);

registerFile rf0(
  .clk(clk),
  .reset(reset),
  .RegWrite(RegWrite),
  .WriteData(WriteData),
  .RS1(RS1),
  .RS2(RS2),
  .RD(RD),
  .ReadData1(ReadData1),
  .ReadData2(ReadData2)
);

endmodule
