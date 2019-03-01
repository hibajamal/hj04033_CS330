module registerFile(
input clk, reset, RegWrite,
input [63:0] WriteData, 
input [4:0] RS1, [4:0] RS2, [4:0] RD,
output reg [63:0] ReadData1, reg [63:0] ReadData2
);

reg [31:0] Registers [63:0];

always @ (posedge clk or RegWrite or reset)
begin
  if (RegWrite)
    Registers[RD] = WriteData;
  ReadData1 = RS1;
  ReadData2 = RS2;
  if (reset)
    begin
    ReadData1 = 1'b0;
    ReadData2 = 1'b0;
    end
end 

endmodule