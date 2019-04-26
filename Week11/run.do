vlog tb.v Adder.v ALU_64_bit.v ALU_Control.v Control_Unit.v Data_Memory.v IDG.v Instruction_Memory.v instructionParser.v MUX.v Program_Counter.v registerFile.v RISC_V_Processor.v

 
vsim -novopt work.tb


view wave
do wave.do


run 300ns
