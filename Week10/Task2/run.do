vlog tb.v ALU_Control.v 

vsim -novopt work.tb

view wave

add wave sim:/tb/*

run 300ns