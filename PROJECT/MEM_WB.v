module MEM_WB():
(
    input clk, reset,
    
    input [1:0] WB,
    output reg Mem_to_Reg, Reg_Write,
    
    input [63:0] Read_Data,
    output reg [63:0] Read_Data_out,
    
    input [4:0] EX_MEM/Rd,
    output reg [4:0] EX_MEM/Rd_out,

    input [63:0] EX_MEM/Mem_Address,
    output reg [63:0] EX_MEM/Mem_Address_out,

);

    always@(posedge clk)
    begin
      {Mem_to_Reg, Reg_Write}= WB;
      EX_MEM/MEM_Address = EX_MEM/Mem_Address_out;
      Read_Data_out = Read_Data;
      EX_MEM.Rd_out = EX_MEM.Rd;
    end

    always@(reset)
    begin
      Mem_to_Reg = 1'b0;
      Reg_Write = 1'b0;
      EX_MEM/Mem_Address_out = 64'b0;
      Read_Data_out = 64'b0;
      EX_MEM/Rd_out = 5'b0;
    end
    
endmodule
