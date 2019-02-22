module ALU (
    input a, b, Cin,
    input [3:0]ALUop,
    output reg Result, CarryOut
);

wire Ainvert = ALUop[0];
wire Binvert = ALUop[1];
  
wire abar = ~a;
wire bbar = ~b;
wire mux1out = Ainvert ? ~a : a;
wire mux2out = Binvert ? ~b : b;

wire and_result = mux1out & mux2out;
wire or_result = mux1out | mux2out;


always @ (ALUop)
begin
if (ALUop == 4'b0000)
  assign Result = mux1out & mux2out;
else if (ALUop == 4'b0001)
  assign Result = mux1out | mux2out;
else if (ALUop == 4'b0010 | ALUop == 4'b0110)
  assign Result = mux1out | mux2out | Cin;
else if (ALUop == 4'b1100)
  assign Result = ~(mux1out | mux2out);
assign CarryOut = (mux1out & Cin) | (mux2out & Cin) | and_result;
end

endmodule;