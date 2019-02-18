module tb();
  
    reg [31:0]instruction;
    wire[63:0] imm_data;
    
    ImmediateDataExtractor imdg0
    (
      .instruction(instruction),
      .imm_data(imm_data)
      );
      
     
initial
begin
#0 instruction = 32'b01010111011110101;    

#310 instruction = 32'b1111111111110111111100000000;
end
      
endmodule
