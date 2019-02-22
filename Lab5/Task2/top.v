module top(
  input [5:0] a, 
  input [5:0] b,
  input Cin,
  input [3:0]ALUop,
  output reg Carryout, 
  output reg [5:0] Result
);

ALU alu0(
  .a(a[0]),
  .b(b[0]),
  .Cin(Cin),
  .ALUop(ALUop),
  .CarryOut(Carryout),
  .Result(Result)
);

wire temp = Carryout;

ALU alu1(
  .a(a[1]),
  .b(b[1]),
  .Cin(temp),
  .ALUop(ALUop),
  .CarryOut(Carryout),
  .Result(Result)
);

wire temp1 = Carryout;

ALU alu2(
  .a(a[2]),
  .b(b[2]),
  .Cin(temp1),
  .ALUop(ALUop),
  .CarryOut(Carryout),
  .Result(Result)
);

wire temp2 = Carryout;

ALU alu3(
  .a(a[3]),
  .b(b[3]),
  .Cin(temp2),
  .ALUop(ALUop),
  .CarryOut(Carryout),
  .Result(Result)
);

wire temp3 = Carryout;

ALU alu4(
  .a(a[4]),
  .b(b[4]),
  .Cin(temp3),
  .ALUop(ALUop),
  .CarryOut(Carryout),
  .Result(Result)
);

wire temp4 = Carryout;

ALU alu5(
  .a(a[5]),
  .b(b[5]),
  .Cin(temp4),
  .ALUop(ALUop),
  .CarryOut(Carryout),
  .Result(Result)
);

endmodule