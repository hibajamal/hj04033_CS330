onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {data memory}
add wave -noupdate -format Literal -radix unsigned /tb/p0/dm0/Write_Data
add wave -noupdate -format Logic /tb/p0/dm0/clk
add wave -noupdate -format Logic /tb/p0/dm0/MemWrite
add wave -noupdate -format Logic /tb/p0/dm0/MemRead
add wave -noupdate -format Literal -radix unsigned /tb/p0/dm0/Mem_Addr
add wave -noupdate -format Literal -radix hexadecimal /tb/p0/dm0/Read_Data
add wave -noupdate -format Literal -radix hexadecimal /tb/p0/dm0/DataMemory
add wave -noupdate -divider wires
add wave -noupdate -format Logic /tb/p0/clk
add wave -noupdate -format Logic /tb/p0/reset
add wave -noupdate -format Literal /tb/p0/PC_In
add wave -noupdate -format Literal /tb/p0/PC_Out
add wave -noupdate -format Literal /tb/p0/Instruction
add wave -noupdate -format Literal /tb/p0/a0OUT
add wave -noupdate -format Literal /tb/p0/Instruction_Out_IF_ID
add wave -noupdate -format Literal /tb/p0/Inst_Addr_Out_IF_ID
add wave -noupdate -format Literal /tb/p0/opcode
add wave -noupdate -format Literal /tb/p0/MEM_WB_rd_out
add wave -noupdate -format Literal /tb/p0/funct3
add wave -noupdate -format Literal /tb/p0/rs1
add wave -noupdate -format Literal /tb/p0/rs2
add wave -noupdate -format Literal /tb/p0/funct7
add wave -noupdate -format Literal /tb/p0/rd
add wave -noupdate -format Literal /tb/p0/EX
add wave -noupdate -format Literal /tb/p0/M
add wave -noupdate -format Literal /tb/p0/WB
add wave -noupdate -format Literal /tb/p0/imm_data
add wave -noupdate -format Literal /tb/p0/ReadData1
add wave -noupdate -format Literal /tb/p0/ReadData2
add wave -noupdate -format Logic /tb/p0/Reg_Write_MEM_WB
add wave -noupdate -format Literal /tb/p0/Write_back_mux_result
add wave -noupdate -format Literal /tb/p0/Inst_Addr_Out_ID_EX
add wave -noupdate -format Literal /tb/p0/RS1_Out_ID_EX
add wave -noupdate -format Literal /tb/p0/RS2_Out_ID_EX
add wave -noupdate -format Literal /tb/p0/RD_Out_ID_EX
add wave -noupdate -format Literal /tb/p0/ReadData1_Out_ID_EX
add wave -noupdate -format Literal /tb/p0/ReadData2_Out_ID_EX
add wave -noupdate -format Literal /tb/p0/ImmediateData_Out_ID_EX
add wave -noupdate -format Literal /tb/p0/Funct_ID_EX
add wave -noupdate -format Literal /tb/p0/WB_Out_ID_EX
add wave -noupdate -format Literal /tb/p0/M_Out_ID_EX
add wave -noupdate -format Literal /tb/p0/ALUOp_ID_EX
add wave -noupdate -format Logic /tb/p0/ALUSrc_ID_EX
add wave -noupdate -format Literal /tb/p0/adder_result
add wave -noupdate -format Literal /tb/p0/ALU_Result_Out_EX_MEM
add wave -noupdate -format Literal /tb/p0/Forward_A
add wave -noupdate -format Literal /tb/p0/Forward_B
add wave -noupdate -format Literal /tb/p0/Forward_A_mux_result
add wave -noupdate -format Literal /tb/p0/Forward_B_mux_result
add wave -noupdate -format Literal /tb/p0/mux_result
add wave -noupdate -format Literal /tb/p0/ALU_ALUOp
add wave -noupdate -format Literal /tb/p0/ALU_Result
add wave -noupdate -format Logic /tb/p0/CarryOut
add wave -noupdate -format Literal /tb/p0/WB_Out_EX_MEM
add wave -noupdate -format Logic /tb/p0/MemRead_EX_MEM
add wave -noupdate -format Logic /tb/p0/MemWrite_EX_MEM
add wave -noupdate -format Literal /tb/p0/Adder_Result_Out_EX_MEM
add wave -noupdate -format Literal /tb/p0/Forward_B_Mux_Result_Out_EX_MEM
add wave -noupdate -format Literal /tb/p0/EX_MEM_RD_Out
add wave -noupdate -format Logic /tb/p0/ALU_Zero_Out_EX_MEM
add wave -noupdate -format Logic /tb/p0/Branch_EX_MEM
add wave -noupdate -format Literal /tb/p0/Read_Data_DM
add wave -noupdate -format Logic /tb/p0/Mem_to_Reg_MEM_WB
add wave -noupdate -format Literal /tb/p0/Read_Data_out_MEM_WB
add wave -noupdate -format Literal /tb/p0/MEM_WB_Mem_Address_out
add wave -noupdate -divider {program counter}
add wave -noupdate -format Logic /tb/p0/pc0/clk
add wave -noupdate -format Logic /tb/p0/pc0/reset
add wave -noupdate -format Literal -radix unsigned /tb/p0/pc0/PC_In
add wave -noupdate -format Literal -radix unsigned /tb/p0/pc0/PC_Out
add wave -noupdate -divider {inst memory}
add wave -noupdate -format Literal -radix unsigned /tb/p0/im0/Inst_Address
add wave -noupdate -format Literal /tb/p0/im0/Instruction
add wave -noupdate -divider adder
add wave -noupdate -format Literal /tb/p0/a0/a
add wave -noupdate -format Literal /tb/p0/a0/b
add wave -noupdate -format Literal /tb/p0/a0/out
add wave -noupdate -divider {ifid buffer}
add wave -noupdate -format Logic /tb/p0/ifid0/clk
add wave -noupdate -format Logic /tb/p0/ifid0/reset
add wave -noupdate -format Literal /tb/p0/ifid0/Instruction
add wave -noupdate -format Literal -radix unsigned /tb/p0/ifid0/Inst_Addr
add wave -noupdate -format Literal /tb/p0/ifid0/Instruction_Out
add wave -noupdate -format Literal -radix unsigned /tb/p0/ifid0/Inst_Addr_Out
add wave -noupdate -divider {inst parser}
add wave -noupdate -format Literal /tb/p0/ip0/instruction
add wave -noupdate -format Literal /tb/p0/ip0/opcode
add wave -noupdate -format Literal -radix unsigned /tb/p0/ip0/rd
add wave -noupdate -format Literal /tb/p0/ip0/funct3
add wave -noupdate -format Literal -radix unsigned /tb/p0/ip0/rs1
add wave -noupdate -format Literal -radix unsigned /tb/p0/ip0/rs2
add wave -noupdate -format Literal /tb/p0/ip0/funct7
add wave -noupdate -divider {control unit}
add wave -noupdate -format Literal /tb/p0/cuPIPE/Opcode
add wave -noupdate -format Literal /tb/p0/cuPIPE/EX
add wave -noupdate -format Literal /tb/p0/cuPIPE/M
add wave -noupdate -format Literal /tb/p0/cuPIPE/WB
add wave -noupdate -divider {immediate data gen}
add wave -noupdate -format Literal /tb/p0/idg0/instruction
add wave -noupdate -format Literal -radix unsigned /tb/p0/idg0/imm_data
add wave -noupdate -divider {register file}
add wave -noupdate -format Logic /tb/p0/rf0/clk
add wave -noupdate -format Logic /tb/p0/rf0/reset
add wave -noupdate -format Logic /tb/p0/rf0/RegWrite
add wave -noupdate -format Literal /tb/p0/rf0/WriteData
add wave -noupdate -format Literal -radix unsigned /tb/p0/rf0/RS1
add wave -noupdate -format Literal -radix unsigned /tb/p0/rf0/RS2
add wave -noupdate -format Literal -radix unsigned /tb/p0/rf0/RD
add wave -noupdate -format Literal /tb/p0/rf0/ReadData1
add wave -noupdate -format Literal /tb/p0/rf0/ReadData2
add wave -noupdate -divider {id ex buffer}
add wave -noupdate -format Logic /tb/p0/id_ex0/clk
add wave -noupdate -format Logic /tb/p0/id_ex0/reset
add wave -noupdate -format Literal /tb/p0/id_ex0/Inst_Addr
add wave -noupdate -format Literal /tb/p0/id_ex0/Inst_Addr_Out
add wave -noupdate -format Literal -radix unsigned /tb/p0/id_ex0/RS1
add wave -noupdate -format Literal -radix unsigned /tb/p0/id_ex0/RS1_Out
add wave -noupdate -format Literal -radix unsigned /tb/p0/id_ex0/RS2
add wave -noupdate -format Literal -radix unsigned /tb/p0/id_ex0/RS2_Out
add wave -noupdate -format Literal -radix unsigned /tb/p0/id_ex0/RD
add wave -noupdate -format Literal -radix unsigned /tb/p0/id_ex0/RD_Out
add wave -noupdate -format Literal -radix unsigned /tb/p0/id_ex0/ReadData1
add wave -noupdate -format Literal -radix unsigned /tb/p0/id_ex0/ReadData1_Out
add wave -noupdate -format Literal -radix unsigned /tb/p0/id_ex0/ReadData2
add wave -noupdate -format Literal -radix unsigned /tb/p0/id_ex0/ReadData2_Out
add wave -noupdate -format Literal -radix unsigned /tb/p0/id_ex0/ImmediateData
add wave -noupdate -format Literal -radix unsigned /tb/p0/id_ex0/ImmediateData_Out
add wave -noupdate -format Literal /tb/p0/id_ex0/Instruction
add wave -noupdate -format Literal /tb/p0/id_ex0/Funct
add wave -noupdate -format Literal /tb/p0/id_ex0/WB
add wave -noupdate -format Literal /tb/p0/id_ex0/WB_Out
add wave -noupdate -format Literal /tb/p0/id_ex0/M
add wave -noupdate -format Literal /tb/p0/id_ex0/M_Out
add wave -noupdate -format Literal /tb/p0/id_ex0/EX
add wave -noupdate -format Literal /tb/p0/id_ex0/ALUOp
add wave -noupdate -format Logic /tb/p0/id_ex0/ALUSrc
add wave -noupdate -divider {small adder}
add wave -noupdate -format Literal /tb/p0/small_adder/a
add wave -noupdate -format Literal /tb/p0/small_adder/b
add wave -noupdate -format Literal /tb/p0/small_adder/out
add wave -noupdate -divider {fwd a mux}
add wave -noupdate -format Literal /tb/p0/Forward_A_mux/a
add wave -noupdate -format Literal /tb/p0/Forward_A_mux/b
add wave -noupdate -format Literal /tb/p0/Forward_A_mux/c
add wave -noupdate -format Literal /tb/p0/Forward_A_mux/sel
add wave -noupdate -format Literal /tb/p0/Forward_A_mux/data_out
add wave -noupdate -divider {fwd b mux}
add wave -noupdate -format Literal /tb/p0/Forward_B_mux/a
add wave -noupdate -format Literal /tb/p0/Forward_B_mux/b
add wave -noupdate -format Literal /tb/p0/Forward_B_mux/c
add wave -noupdate -format Literal /tb/p0/Forward_B_mux/sel
add wave -noupdate -format Literal /tb/p0/Forward_B_mux/data_out
add wave -noupdate -divider MUX
add wave -noupdate -format Literal /tb/p0/MUX/a
add wave -noupdate -format Literal /tb/p0/MUX/b
add wave -noupdate -format Logic /tb/p0/MUX/sel
add wave -noupdate -format Literal /tb/p0/MUX/data_out
add wave -noupdate -divider {alu control}
add wave -noupdate -format Literal /tb/p0/ALU_Control/ALUOp
add wave -noupdate -format Literal /tb/p0/ALU_Control/Funct
add wave -noupdate -format Literal /tb/p0/ALU_Control/Operation
add wave -noupdate -divider alu
add wave -noupdate -format Literal -radix unsigned /tb/p0/ALU/a
add wave -noupdate -format Literal -radix unsigned /tb/p0/ALU/b
add wave -noupdate -format Literal -radix binary /tb/p0/ALU/ALUop
add wave -noupdate -format Literal -radix unsigned /tb/p0/ALU/Result
add wave -noupdate -format Logic /tb/p0/ALU/CarryOut
add wave -noupdate -divider {ex mem buffer}
add wave -noupdate -format Logic /tb/p0/em_mem0/clk
add wave -noupdate -format Logic /tb/p0/em_mem0/reset
add wave -noupdate -format Literal /tb/p0/em_mem0/WB
add wave -noupdate -format Literal /tb/p0/em_mem0/WB_Out
add wave -noupdate -format Literal /tb/p0/em_mem0/M
add wave -noupdate -format Logic /tb/p0/em_mem0/Branch
add wave -noupdate -format Logic /tb/p0/em_mem0/MemWrite
add wave -noupdate -format Logic /tb/p0/em_mem0/MemRead
add wave -noupdate -format Literal -radix unsigned /tb/p0/em_mem0/Adder_Result
add wave -noupdate -format Literal -radix unsigned /tb/p0/em_mem0/Adder_Result_Out
add wave -noupdate -format Logic /tb/p0/em_mem0/ALU_Zero
add wave -noupdate -format Logic /tb/p0/em_mem0/ALU_Zero_Out
add wave -noupdate -format Literal -radix unsigned /tb/p0/em_mem0/ALU_Result
add wave -noupdate -format Literal -radix unsigned /tb/p0/em_mem0/ALU_Result_Out
add wave -noupdate -format Literal /tb/p0/em_mem0/Forward_B_Mux_Result
add wave -noupdate -format Literal /tb/p0/em_mem0/Forward_B_Mux_Result_Out
add wave -noupdate -format Literal /tb/p0/em_mem0/ID_EX_Rd
add wave -noupdate -format Literal /tb/p0/em_mem0/ID_EX_Rd_Out
add wave -noupdate -divider mux
add wave -noupdate -format Literal /tb/p0/m0/a
add wave -noupdate -format Literal /tb/p0/m0/b
add wave -noupdate -format Logic /tb/p0/m0/sel
add wave -noupdate -format Literal /tb/p0/m0/data_out
add wave -noupdate -divider {mem wb buffer}
add wave -noupdate -format Logic /tb/p0/mem_wb0/clk
add wave -noupdate -format Logic /tb/p0/mem_wb0/reset
add wave -noupdate -format Literal /tb/p0/mem_wb0/WB
add wave -noupdate -format Logic /tb/p0/mem_wb0/Mem_to_Reg
add wave -noupdate -format Literal -radix hexadecimal /tb/p0/mem_wb0/Read_Data
add wave -noupdate -format Literal -radix unsigned /tb/p0/mem_wb0/Read_Data_out
add wave -noupdate -format Literal /tb/p0/mem_wb0/EX_MEM_Rd
add wave -noupdate -format Literal /tb/p0/mem_wb0/EX_MEM_Rd_out
add wave -noupdate -format Literal -radix hexadecimal /tb/p0/mem_wb0/EX_MEM_Mem_Address
add wave -noupdate -format Literal -radix unsigned /tb/p0/mem_wb0/EX_MEM_Mem_Address_out
add wave -noupdate -divider mux
add wave -noupdate -format Literal /tb/p0/m1/a
add wave -noupdate -format Literal /tb/p0/m1/b
add wave -noupdate -format Logic /tb/p0/m1/sel
add wave -noupdate -divider {forwarding unit}
add wave -noupdate -format Literal /tb/p0/fu0/ID_EX_RS1
add wave -noupdate -format Literal /tb/p0/fu0/ID_EX_RS2
add wave -noupdate -format Literal /tb/p0/fu0/EX_MEM_Rd
add wave -noupdate -format Literal /tb/p0/fu0/MEM_WB_Rd
add wave -noupdate -format Logic /tb/p0/fu0/EX_MEM_RegWrite
add wave -noupdate -format Logic /tb/p0/fu0/MEM_WB_RegWrite
add wave -noupdate -format Literal /tb/p0/fu0/ForwardA
add wave -noupdate -format Literal /tb/p0/fu0/ForwardB
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {181 ns} 0}
configure wave -namecolwidth 244
configure wave -valuecolwidth 424
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {54 ns} {198 ns}
