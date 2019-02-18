module ImmediateDataExtractor(
    input [31:0] instruction,
    output reg [63:0] imm_data
);

imm_data = {(32{1}), instruction};


always @ (instruction)
begin
    if (instruction[6]) // opcode bit 6 happens to be 1 for conditional branches
        imm_data[11:0] = {instruction[31], instruction[7], instruction[30:25] , instruction[11:8]};
    else    // opcode bit 6 0 is data transfer
        if (instruction[5])     //  opcode bit 5 happens to be  1 for store instructions
            imm_data[11:0] = {instruction[31:25], instruction[11:7]};
        else        // opcode bit 5 is 0 for load instructions
            imm_data[11:0] = {instruction[31:20]};
    if (imm_data[11])
        imm_data[63:12] = {52{1'b1}};
    else
        imm_data[63:12] = {52{1'b0}};
end

endmodule
