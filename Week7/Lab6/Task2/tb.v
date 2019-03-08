module tb();

reg [63:0] Write_Data;
  reg clk, MemWrite, MemRead;
  reg [63:0] Mem_Addr;
  wire [63:0] Read_Data;

Data_Memory dm0(
  .Write_Data(Write_Data),
  .clk(clk),
  .MemWrite(MemWrite),
  .MemRead(MemRead),
  .Mem_Addr(Mem_Addr),
  .Read_Data(Read_Data)
);

initial 
begin
  clk = 1;
  MemWrite = 1; 
  MemRead = 1;
  Write_Data = 64'b010101;
  Mem_Addr = 64'b10000;
  
  #30
  Mem_Addr = 64'b0000; 
end

endmodule