vlog tb.v IDG.v

vsim -novopt work.tb

view wave

add wave sim:/tb/instruction
add wave sim:/tb/imm_data

run 1000ns
