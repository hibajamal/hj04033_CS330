vlog tb.v ALU.v 

vsim -novopt work.tb

view wave

add wave sim:/tb/*

run 300ns