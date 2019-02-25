module ALU_64_bit (
    input [63:0]a,
    input [63:0]b, 
    input [3:0]ALUop,
    output reg [63:0]Result, 
    output reg CarryOut
);

always @ (ALUop)
begin
if (ALUop == 4'b0000)
  assign Result = a & b;
else if (ALUop == 4'b0001)
  assign Result = a | b;
else if (ALUop == 4'b0010 | ALUop == 4'b0110)
  assign Result = a - b;
else if (ALUop == 4'b1100)
  assign Result = ~(a & b);
if (Result == 0)
  assign CarryOut = 1;
else
  assign CarryOut = 0;
end

endmodule;