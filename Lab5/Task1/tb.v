module tb
();

reg a, b, Cin;
reg [3:0]ALUop;
wire CarryOut, Result;

ALU a0(
  .a(a),
  .b(b),
  .Cin(Cin),
  .ALUop(ALUop),
  .Result(Result),
  .CarryOut(CarryOut)
  );
  
initial
begin
  a = 1'b0;
  b = 1'b1;
  Cin = 1'b0;
  ALUop = 4'b0010;
end
endmodule