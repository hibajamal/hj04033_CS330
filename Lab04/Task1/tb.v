module tb();
  
    reg [31:0]instruction;
    wire[6:0]opcode;
    wire[4:0]rd;
    wire[2:0]funct3; 
    wire[4:0]rs1; 
    wire[4:0]rs2; 
    wire[6:0]funct7;
    
    InstructionParser ip0
    (
      .instruction(instruction),
      .opcode(opcode),
      .rd(rd),
      .funct3(funct3),
      .rs1(rs1),
      .rs2(rs2),
      .funct7(funct7)
      );
      
     
initial
begin
#15 instruction = 32'b01010111011110101;    //opcode

#310 instruction = 32'b1111111111110111111100000000;
end
      
endmodule