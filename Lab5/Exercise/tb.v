module tb
();

reg [63:0]a; 
reg [63:0]b;
reg [3:0]ALUop;
wire CarryOut;
wire [63:0]Result;

ALU_64_bit a0(
  .a(a),
  .b(b),
  .ALUop(ALUop),
  .Result(Result),
  .CarryOut(CarryOut)
  );
  
initial
begin
  a = 64'b00000000000000111011010;
  b = 64'b11111111111111110000000000;
  ALUop = 4'b0000;
end
endmodule