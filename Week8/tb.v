module tb();
  
reg clk;
reg reset;
wire [31:0] instruction;

Instruction_Fetch if0(
  .clk(clk),
  .reset(reset),
  .instruction(instruction)
);

initial
begin
  clk = 0;
  reset = 1;
  
  #30
  begin
    clk = ~clk;
    reset = ~reset;
  end
  
  #30 
  //reset = ~reset;
  
  #30
  begin
    clk = ~clk;
  end
  
  #30 
  clk = ~clk;
  
  #30
  clk = ~clk;
  
  #30
  clk = ~clk;
  
  #30
  clk = ~clk;
  
   #30
  clk = ~clk;
end

endmodule