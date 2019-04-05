vlog tb.v Adder.v ALU_64_bit.v ALU_Control.v Control_Unit.v Data_Memory.v IDG.v Instruction_Memory.v instructionParser.v MUX.v Program_Counter.v registerFile.v RISC_V_Processor.v

vsim -novopt work.tb

view wave

add wave sim:/tb/*
add wave sim:/tb/rp0/pc0/*
add wave sim:/tb/rp0/rf0/ReadData1
add wave sim:/tb/rp0/rf0/ReadData2
add wave sim:/tb/rp0/rf0/WriteData
add wave sim:/tb/rp0/dm0/Write_Data
add wave sim:/tb/rp0/dm0/Mem_Addr
add wave sim:/tb/rp0/dm0/Read_Data
add wave sim:/tb/rp0/ip0/rs1
add wave sim:/tb/rp0/ip0/rs2
add wave sim:/tb/rp0/ip0/rd
add wave sim:/tb/rp0/alu_64_b0/a
add wave sim:/tb/rp0/alu_64_b0/b
add wave sim:/tb/rp0/alu_64_b0/Result
add wave sim:/tb/rp0/m2/*

run 300ns
