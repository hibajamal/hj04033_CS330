module Data_Memory
(
  input [63:0] Write_Data,
  input clk, MemWrite, MemRead,
  input [63:0] Mem_Addr,
  output reg [63:0] Read_Data
);

reg [63:0] DataMemory [7:0];

//randomized generated script of values for DataMemory
initial
begin
DataMemory[0] = 8'b11100000;
DataMemory[1] = 8'b01000100;
DataMemory[2] = 8'b11110110;
DataMemory[3] = 8'b11100101;
DataMemory[4] = 8'b00010101;
DataMemory[5] = 8'b01000011;
DataMemory[6] = 8'b11111001;
DataMemory[7] = 8'b00001011;
DataMemory[8] = 8'b01011010;
DataMemory[9] = 8'b01001111;
DataMemory[10] = 8'b01111101;
DataMemory[11] = 8'b00111101;
DataMemory[12] = 8'b11111001;
DataMemory[13] = 8'b01000111;
DataMemory[14] = 8'b11101111;
DataMemory[15] = 8'b00011001;
DataMemory[16] = 8'b11111000;
DataMemory[17] = 8'b00000001;
DataMemory[18] = 8'b01101100;
DataMemory[19] = 8'b10111001;
DataMemory[20] = 8'b00101101;
DataMemory[21] = 8'b01000110;
DataMemory[22] = 8'b11111111;
DataMemory[23] = 8'b01100010;
DataMemory[24] = 8'b10110100;
DataMemory[25] = 8'b10001111;
DataMemory[26] = 8'b10010001;
DataMemory[27] = 8'b11001101;
DataMemory[28] = 8'b10001010;
DataMemory[29] = 8'b11010100;
DataMemory[30] = 8'b00010110;
DataMemory[31] = 8'b11000000;
DataMemory[32] = 8'b00100100;
DataMemory[33] = 8'b11111001;
DataMemory[34] = 8'b10011000;
DataMemory[35] = 8'b01010000;
DataMemory[36] = 8'b11100010;
DataMemory[37] = 8'b10110100;
DataMemory[38] = 8'b10100010;
DataMemory[39] = 8'b11101101;
DataMemory[40] = 8'b11110111;
DataMemory[41] = 8'b00010000;
DataMemory[42] = 8'b10100011;
DataMemory[43] = 8'b10001010;
DataMemory[44] = 8'b00000001;
DataMemory[45] = 8'b11100100;
DataMemory[46] = 8'b10110110;
DataMemory[47] = 8'b00011000;
DataMemory[48] = 8'b10000010;
DataMemory[49] = 8'b11011110;
DataMemory[50] = 8'b00111111;
DataMemory[51] = 8'b01000101;
DataMemory[52] = 8'b01000100;
DataMemory[53] = 8'b11001011;
DataMemory[54] = 8'b01111010;
DataMemory[55] = 8'b00100001;
DataMemory[56] = 8'b11011110;
DataMemory[57] = 8'b10011110;
DataMemory[58] = 8'b11000011;
DataMemory[59] = 8'b01111011;
DataMemory[60] = 8'b11010010;
DataMemory[61] = 8'b10111100;
DataMemory[62] = 8'b00010111;
DataMemory[63] = 8'b01010010;
end

always @ (posedge clk or MemWrite == 1 or Mem_Addr or MemRead ==1)
begin
  Read_Data[7:0] = DataMemory[Mem_Addr + 0];
  Read_Data[15:8] = DataMemory[Mem_Addr + 1];
  Read_Data[23:16] = DataMemory[Mem_Addr + 2];
  Read_Data[31:24] = DataMemory[Mem_Addr + 3];
  Read_Data[39:32] = DataMemory[Mem_Addr + 4];
  Read_Data[47:40] = DataMemory[Mem_Addr + 5];
  Read_Data[55:48] = DataMemory[Mem_Addr + 6];
  Read_Data[63:56] = DataMemory[Mem_Addr + 7];
end

endmodule