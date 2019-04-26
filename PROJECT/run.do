vlog TOP.v MUX3.v ALU_64_bit.v ALU_Control.v Control_Unit.v Data_Memory.v EX_MEM.v Forwarding_Unit.v ID_EX.v IDG.v IF_ID.v Instruction_Memory.v instructionParser.v MEM_WB.v MUX.v PIPLINED_PROCESSOR.v Program_Counter.v registerFile.v  

vsim -novopt work.tb

view wave

add wave sim:/tb/*

run 300ns