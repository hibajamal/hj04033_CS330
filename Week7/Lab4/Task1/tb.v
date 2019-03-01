module tb();

reg clk, reset, RegWrite;
reg [63:0] WriteData;
reg [4:0] RS1;
reg [4:0] RS2; 
reg [4:0] RD;
wire [63:0] ReadData1;
wire [63:0] ReadData2;

reg [31:0] Registers [63:0];

registerFile rf0
(
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

initial 
begin 
  clk = 1;
  reset = 0;
  RegWrite = 1;
  WriteData = 64'b0001;
  RS1 = 5'b001;
  RS2 = 5'b1;
  RD = 5'b00101;
  #50 reset = 1;
  
  #70 clk = ~clk;
  
  #60
  begin
  clk = ~clk;
  reset = ~reset;
  RS1 = 5'b00101;
  end
  
end

endmodule