module Instruction_Fetch
(
  input clk, reset,
  output [31:0] instruction
);

wire [63:0] PC_Out;
wire [63:0]PC_In;

Program_Counter pc0
(
  .clk(clk),
  .reset(reset), 
  .PC_In(PC_In),
  .PC_Out(PC_Out)
);

Adder a0
(
  .a(PC_Out),
  .b(64'b0100),
  .out(PC_In)
);

Instruction_Memory im0
(
  .Inst_Address(PC_Out),
  .Instruction(instruction)
);


endmodule