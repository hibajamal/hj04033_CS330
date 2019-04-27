module IF_ID(
  input clk, reset,
  
  input [31:0] Instruction,
  input [63:0] Inst_Addr,
  output reg [31:0] Instruction_Out,
  output reg [63:0] Inst_Addr_Out
);

always @ (posedge clk)
begin
  Instruction_Out = Instruction;
  Inst_Addr_Out = Inst_Addr;
end
  
  always @ (reset)
begin
  Instruction_Out = 32'b0;
  Inst_Addr_Out = 64'b0;
end

endmodule
