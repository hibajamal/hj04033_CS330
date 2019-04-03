module registerFile(
input clk, reset, RegWrite,
input [63:0] WriteData, 
input [4:0] RS1, RS2, RD,
output reg [63:0] ReadData1, reg [63:0] ReadData2
);

reg [31:0] Registers [63:0];

initial
begin
Registers[0] = 64'b0;
Registers[1] = 64'b1;
Registers[2] = 64'b01;
Registers[3] = 64'b11;
Registers[4] = 64'b101;
Registers[5] = 64'b100;
Registers[6] = 64'b1011;
Registers[7] = 64'b110;
Registers[8] = 64'b111;
Registers[9] = 64'b1000;
Registers[10] = 64'b1001;
Registers[11] = 64'b1010;
Registers[12] = 64'b1011;
Registers[13] = 64'b1100;
Registers[14] = 64'b1101;
Registers[15] = 64'b1110;
Registers[16] = 64'b1111;
Registers[17] = 64'b10000;
Registers[18] = 64'b10001;
Registers[19] = 64'b10010;
Registers[20] = 64'b10011;
Registers[21] = 64'b10100;
Registers[22] = 64'b10101;
Registers[23] = 64'b10110;
Registers[24] = 64'b10111;
Registers[25] = 64'b11000;
Registers[26] = 64'b11001;
Registers[27] = 64'b11010;
Registers[28] = 64'b11011;
Registers[29] = 64'b11100;
Registers[30] = 64'b11101;
Registers[31] = 64'b11110;
end

always @ (posedge clk or RegWrite or reset)
begin  
  if (reset)
    begin
    ReadData1 = 63'b0;
    ReadData2 = 63'b0;
    end
  else
    begin
    ReadData1 = Registers[RS1];
    ReadData2 = Registers[RS2];
    end  
  if (RegWrite)
    begin
    Registers[RD] = WriteData;
    end
end 

endmodule