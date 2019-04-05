module tb();

reg clk;
reg reset;

RISC_V_Processor rp0(
.clk(clk),
.reset(reset)
);

initial
begin
  clk = 0;
  reset = 1;
  #15 reset = 0;
  
end

always
	 begin
	   #10 clk = ~clk;
	 end


endmodule