module tb();

reg [31:0] instruction;
wire [63:0] ReadData1;
wire [63:0] ReadData2;
reg clk; 
reg reset; 
reg RegWrite; 
reg [63:0] WriteData;
reg [4:0] RS1;
reg [4:0] RS2; 
reg [4:0] RD;
  
top t0(
  .instruction(instruction),
  .ReadData1(ReadData1),
  .ReadData2(ReadData2),
  .clk(clk),
  .reset(reset),
  .RegWrite(RegWrite),
  .WriteData(WriteData),
  .RS1(RS1),
  .RS2(RS2),
  .RD(RD)
);

initial
begin
  instruction = 32'b0;
  clk = 0;
  reset = 0;
  RegWrite = 1;
  WriteData = 64'b0001;
  RS1 = 5'b001;
  RS2 = 5'b1;
  RD = 5'b00101;
end

endmodule
