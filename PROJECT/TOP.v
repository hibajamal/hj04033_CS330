module top();
reg clk;
reg reset;

PipeLinedProcessor p0(
.clk(clk),
.reset(reset)
);

initial 
begin
  clk = 1
  reset = 0
  
  #20 reset = 1
  
  #10 reset = 0
end

always
  #10 clk = ~clk

endmodule
