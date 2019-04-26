module ID_EX(
  input clk, reset
  
  // data
  input [63:0] Inst_Addr,
  output reg [63:0] Inst_Addr_Out,
  
  input [4:0] RS1,
  output reg [4:0] RS1_Out,
  
  input [4:0] RS2,
  output reg [4:0] RS2_Out,
  
  input [4:0] RD,
  output reg [4:0] RD_Out,
  
  input [63:0] ReadData1, 
  output reg [63:0] ReadData1_Out,
  
  input [63:0] ReadData2,
  output reg [63:0] ReadData2_Out,
  
  input [63:0] ImmediateData,
  output reg [63:0] ImmediateData_Out,
  
  input [31:0] Instruction,
  output reg [3:0] Funct,
  
  // control
  input [1:0] WB,
  output reg [1:0] WB_Out,
  
  input [2:0] M,
  output reg [2:0] M_Out,
  
  input [2:0] EX,
  output reg [1:0] ALUOp,
  output reg ALUSrc
);

always @ (posedge clk)
begin
  // data
  Inst_Addr_Out = Inst_Addr;
  RS1_Out = RS1;
  RS2_Out = RS2;
  RD_Out = RD_Out;
  ReadData1_Out = ReadData1;
  ReadData2_Out = ReadData2;
  ImmediateData_Out = ImmediateData;
  Funct = {Instruction[30], Instruction[14:12]};
  
  // control
  WB_Out = WB;
  M_Out = M;
  {ALUOp, ALUSrc} = EX;
end

  always @ (reset)
begin
  // data
  Inst_Addr_Out = 64'b0;
  RS1_Out = 5'b0;
  RS2_Out = 5'b0;
  RD_Out = 5'b0;
  ReadData1_Out = 64'b0;
  ReadData2_Out = 64'b0;
  ImmediateData_Out = 64'b0;
  Funct = 4'b0;
  
  // control
  WB_Out = 2'b0;
  M_Out = 3'b0;
  ALUOp = 2'b0; 
  ALUSrc = 1'b0;
end
  
endmodule
