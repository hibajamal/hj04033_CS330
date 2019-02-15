module ImmediateDataExtractor(
    input [31:0] instruction,
    output reg [63:0] imm_data
);

imm_data = {(32{1}), instruction};


always @ (instruction)
begin
  case 
end

endmodule