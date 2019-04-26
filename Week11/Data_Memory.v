module Data_Memory
(
  input [63:0] Write_Data,
  input clk, MemWrite, MemRead,
  input [63:0] Mem_Addr,
  output reg [63:0] Read_Data
);

  reg [7:0] DataMemory [63:0];

//randomized generated script of values for DataMemory
initial
begin
DataMemory[0] = 8'd0;
DataMemory[1] = 8'd1;
DataMemory[2] = 8'd2;
DataMemory[3] = 8'd3;
DataMemory[4] = 8'd4;
DataMemory[5] = 8'd5;
DataMemory[6] = 8'd6;
DataMemory[7] = 8'd7;
DataMemory[8] = 8'd8;
DataMemory[9] = 8'd9;
DataMemory[10] = 8'd10;
DataMemory[11] = 8'd11;
DataMemory[12] = 8'd12;
DataMemory[13] = 8'd13;
DataMemory[14] = 8'd14;
DataMemory[15] = 8'd15;
DataMemory[16] = 8'd16;
DataMemory[17] = 8'd17;
DataMemory[18] = 8'd18;
DataMemory[19] = 8'd19;
DataMemory[20] = 8'd20;
DataMemory[21] = 8'd21;
DataMemory[22] = 8'd22;
DataMemory[23] = 8'd23;
DataMemory[24] = 8'd24;
DataMemory[25] = 8'd25;
DataMemory[26] = 8'd26;
DataMemory[27] = 8'd27;
DataMemory[28] = 8'd28;
DataMemory[29] = 8'd29;
DataMemory[30] = 8'd30;
DataMemory[31] = 8'd31;
DataMemory[32] = 8'd32;
DataMemory[33] = 8'd33;
DataMemory[34] = 8'd34;
DataMemory[35] = 8'd35;
DataMemory[36] = 8'd36;
DataMemory[37] = 8'd37;
DataMemory[38] = 8'd38;
DataMemory[39] = 8'd39;
DataMemory[40] = 8'd40;
DataMemory[41] = 8'd41;
DataMemory[42] = 8'd42;
DataMemory[43] = 8'd43;
DataMemory[44] = 8'd44;
DataMemory[45] = 8'd45;
DataMemory[46] = 8'd46;
DataMemory[47] = 8'd47;
DataMemory[48] = 8'd48;
DataMemory[49] = 8'd49;
DataMemory[50] = 8'd50;
DataMemory[51] = 8'd51;
DataMemory[52] = 8'd52;
DataMemory[53] = 8'd53;
DataMemory[54] = 8'd54;
DataMemory[55] = 8'd55;
DataMemory[56] = 8'd56;
DataMemory[57] = 8'd57;
DataMemory[58] = 8'd58;
DataMemory[59] = 8'd59;
DataMemory[60] = 8'd60;
DataMemory[61] = 8'd61;
DataMemory[62] = 8'd62;
DataMemory[63] = 8'd63;
end

always @ (Mem_Addr)
begin
  if (MemRead)
	begin
  Read_Data[7:0] = DataMemory[(Mem_Addr+0) %64];
  Read_Data[15:8] = DataMemory[(Mem_Addr+1) %64];
  Read_Data[23:16] = DataMemory[(Mem_Addr+2) %64];
  Read_Data[31:24] = DataMemory[(Mem_Addr+3) %64];
  Read_Data[39:32] = DataMemory[(Mem_Addr+4) %64];
  Read_Data[47:40] = DataMemory[(Mem_Addr+5) %64];
  Read_Data[55:48] = DataMemory[(Mem_Addr+6) %64];
  Read_Data[63:56] = DataMemory[(Mem_Addr+7) %64];
	end
end

always @ (posedge clk)
begin
  if (MemWrite == 1)
    begin
      DataMemory[(Mem_Addr+0) %64] = Write_Data[7:0];
      DataMemory[(Mem_Addr+1) %64] = Write_Data[15:8];
      DataMemory[(Mem_Addr+2) %64] = Write_Data[23:16];
      DataMemory[(Mem_Addr+3) %64] = Write_Data[31:24];
      DataMemory[(Mem_Addr+4) %64] = Write_Data[39:32];
      DataMemory[(Mem_Addr+5) %64] = Write_Data[47:40];
      DataMemory[(Mem_Addr+6) %64] = Write_Data[55:48];
      DataMemory[(Mem_Addr+7) %64] = Write_Data[63:56];
    end
end

endmodule
