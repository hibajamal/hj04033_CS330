module EX_MEM(
  input clk, reset,
  
  // control
  input [1:0] WB,
  output reg [1:0] WB_Out,
  
  input [2:0] M,
  output reg Branch, MemWrite, MemRead,
  
  // data
  input [63:0] Adder_Result,
  output reg [63:0] Adder_Result_Out,
  
  input ALU_Zero,
  output reg ALU_Zero_Out,
  
  input [63:0] ALU_Result,
  output reg [63:0] ALU_Result_Out,
  
  input [63:0] Forward_B_Mux_Result,
  output reg [63:0] Forward_B_Mux_Result_Out,
  
  input [4:0] ID_EX_Rd,
  output reg [4:0] ID_EX_Rd_Out
);

always @ (posedge clk)
begin
  // control
  WB_Out = WB;
  {Branch, MemWrite, MemRead} = M;
  
  // data
  Adder_Result_Out = Adder_Result;
  ALU_Zero_Out = ALU_Zero;
  ALU_Result_Out = ALU_Result;
  Forward_B_Mux_Result_Out = Forward_B_Mux_Result;
  ID_EX_Rd_Out = ID_EX_Rd;
end

always @ (reset)
begin
  WB_Out = 2'b0;
  Branch = 1'b0;
  MemWrite = 1'b0;
  MemRead = 1'b0;
  Adder_Result_Out = 64'b0;
  ALU_Zero_Out = 1'b0;
  ALU_Result_Out = 64'b0;
  Forward_B_Mux_Result_Out = 64'b0;
  ID_EX_Rd_Out = 5'b0;
end
  
endmodule
