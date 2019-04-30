module Forwarding_Unit
(
  input [4:0] ID_EX_RS1,
  input [4:0] ID_EX_RS2,
  input [4:0] EX_MEM_Rd,
  input [4:0] MEM_WB_Rd,
  input EX_MEM_RegWrite,
  input MEM_WB_RegWrite,
  
  output reg [1:0] ForwardA,
  output reg [1:0] ForwardB
); 	

	always@(*)
	begin
		if(EX_MEM_RegWrite && (EX_MEM_Rd != 5'b0) && (EX_MEM_Rd == ID_EX_RS1))
		begin
			ForwardA = 2'b10;
		end
		if(
		MEM_WB_RegWrite && (MEM_WB_Rd != 5'b0) && (MEM_WB_Rd == ID_EX_RS1) && ~(EX_MEM_RegWrite && (EX_MEM_Rd != 0)) && (EX_MEM_Rd == ID_EX_RS1))
		begin
			ForwardA = 2'b01;
		end
		if(EX_MEM_RegWrite && (EX_MEM_Rd != 5'b0) && (EX_MEM_Rd == ID_EX_RS2))
		begin
			ForwardB = 2'b10;
		end
		if(MEM_WB_RegWrite && (MEM_WB_Rd != 5'b0) && (MEM_WB_Rd == ID_EX_RS2) && ~(EX_MEM_RegWrite && (EX_MEM_Rd != 0)) && (EX_MEM_Rd == ID_EX_RS2))
		begin
			ForwardB = 2'b01;
		end
	end

endmodule
