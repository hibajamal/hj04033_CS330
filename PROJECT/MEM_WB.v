module MEM_WB():
(
    input [1:0] WB,
    output reg Mem_to_Reg, Reg_Write,
    
    input [63:0] Read_Data,
    output reg [63:0] Read_Data_out,
    
    input [63:0] EX_MEM.Rd,
    output reg [63:0] EX_MEM.Rd_out,

    input [63:0] EX_MEM.Mem_Address,
    output reg [63:0] EX_MEM.Mem_Address_out,

);

    always@(posedge clk)
    begin
      {Mem_to_Reg, Reg_Write}= WB;
      
      Read_Data_out = Read_Data;
      EX_MEM.Rd_out = EX_MEM.Rd;
    end

endmodule
