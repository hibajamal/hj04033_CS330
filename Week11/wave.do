onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Logic /tb/clk
add wave -noupdate -format Logic /tb/reset
add wave -noupdate -divider {Program Counter}
add wave -noupdate -format Logic /tb/rp0/pc0/clk
add wave -noupdate -format Logic /tb/rp0/pc0/reset
add wave -noupdate -format Literal -radix unsigned /tb/rp0/pc0/PC_In
add wave -noupdate -format Literal -radix unsigned /tb/rp0/pc0/PC_Out
add wave -noupdate -divider {Register File}
add wave -noupdate -format Literal -radix unsigned /tb/rp0/rf0/ReadData1
add wave -noupdate -format Literal -radix hexadecimal /tb/rp0/rf0/ReadData2
add wave -noupdate -format Literal -radix unsigned /tb/rp0/rf0/WriteData
add wave -noupdate -format Literal -radix hexadecimal -expand /tb/rp0/rf0/Registers
add wave -noupdate -divider {Data Memory}
add wave -noupdate -format Literal /tb/rp0/dm0/Write_Data
add wave -noupdate -format Literal /tb/rp0/dm0/Mem_Addr
add wave -noupdate -format Literal /tb/rp0/dm0/Read_Data
add wave -noupdate -divider {Instruction Parser}
add wave -noupdate -format Literal -radix unsigned /tb/rp0/ip0/rs1
add wave -noupdate -format Literal -radix unsigned /tb/rp0/ip0/rs2
add wave -noupdate -format Literal -radix unsigned /tb/rp0/ip0/rd
add wave -noupdate -divider {ALU First}
add wave -noupdate -format Literal -radix unsigned /tb/rp0/alu_64_b0/a
add wave -noupdate -format Literal -radix unsigned /tb/rp0/alu_64_b0/b
add wave -noupdate -format Literal -radix unsigned /tb/rp0/alu_64_b0/Result
add wave -noupdate -divider {Second Mux}
add wave -noupdate -format Literal /tb/rp0/m2/a
add wave -noupdate -format Literal /tb/rp0/m2/b
add wave -noupdate -format Logic /tb/rp0/m2/sel
add wave -noupdate -format Literal -radix unsigned /tb/rp0/m2/data_out
add wave -noupdate -divider {Data Memory values}
add wave -noupdate -format Literal -radix hexadecimal -expand /tb/rp0/dm0/DataMemory
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {35 ns} 0}
configure wave -namecolwidth 183
configure wave -valuecolwidth 100
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
WaveRestoreZoom {11 ns} {39 ns}
