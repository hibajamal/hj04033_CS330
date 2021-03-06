module tb();
  
reg [63:0] Inst_Address;
wire [31:0] Instruction;

Instruction_Memory im0(
  .Inst_Address(Inst_Address),
  .Instruction(Instruction)
);

initial
begin
Inst_Address = 64'b100;

#100 Inst_Address = 64'b0;
end

endmodule