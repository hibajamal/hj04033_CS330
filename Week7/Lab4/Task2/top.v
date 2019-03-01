module top(
  input [31:0] instruction,
  output reg [63:0] ReadData1,
  output reg [63:0] ReadData2,
  input clk, reset, RegWrite, 
  input [63:0] WriteData,
  input [4:0] RS1, 
  input [4:0] RS2, 
  input [4:0] RD
);

wire [6:0]opcode;
wire [4:0]rd;
wire [2:0] funct3;
wire [6:0] funct7;

InstructionParser ip0(
  .instruction(instruction),
  .opcode(opcode),
  .rd(rd),
  .funct3(funct3),
  .rs1(RS1),
  .rs2(RS1),
  .funct7(funct7)
);

wire temp = RS1;
wire temp2 = RS2;

registerFile rf0(
  .clk(clk),
  .reset(reset),
  .RegWrite(RegWrite),
  .WriteData(WriteData),
  .RS1(temp),
  .RS2(temp2),
  .RD(RD),
  .ReadData1(ReadData1),
  .ReadData2(ReadData2)
);

endmodule
