module tb();

reg [31:0] instruction;
wire [63:0] ReadData1;
wire [63:0] ReadData2;

reg clk;
reg reset;
reg RegWrite; 
reg [63:0] WriteData;

top t0(
  .instruction(instruction),
  .ReadData1(ReadData1),
  .ReadData2(ReadData2),
  .clk(clk),
  .reset(reset),
  .RegWrite(RegWrite), 
  .WriteData(WriteData)
);

initial
begin
  instruction = 32'b00111111100000100100100101;
  clk = 0;
  reset = 0;
  WriteData = 64'b1;
  RegWrite = 1;
  
  #15 reset = 1;
  #15 reset = 0;
end

always
	 begin
	   #10 clk = ~clk;
	 end
endmodule