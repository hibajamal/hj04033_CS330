module ALU_6_bit();
  
reg [5:0] a;
reg [5:0] b;
reg Cin;
reg [3:0]ALUop;
wire Carryout;
wire [5:0] Result;
  
top t0(
.a(a),
.b(b),
.Cin(Cin),
.ALUop(ALUop),
.Carryout(Carryout),
.Result(Result)
);

initial
begin
  a = 6'b000000;
  b = 6'b000111;
  Cin = 1'b1;
  ALUop = 4'b0001;
end
  
endmodule