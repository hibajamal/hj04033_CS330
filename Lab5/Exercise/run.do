vlog tb.v ALU_64_bit.v 

vsim -novopt work.tb

view wave

add wave sim:/tb/*

run 300ns