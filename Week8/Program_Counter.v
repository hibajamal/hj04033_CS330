module Program_Counter
(
        input clk, reset, 
        input [63:0] PC_In,
        output reg [63:0] PC_Out
);

always @ (posedge clk)
begin
  //PC_Out <= PC_In;
  if (reset)
    PC_Out = 0;
  else
    PC_Out = PC_In;
end
/*
initial 
PC_Out = 64'b0010;*/

endmodule