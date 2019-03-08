vlog tb.v top.v instructionParser.v registerFile.v

vsim -novopt work.tb

view wave

add wave sim:/tb/*
add wave sim:/tb/t0/*
add wave sim:/tb/t0/ip0/*
add wave sim:/tb/t0/rf0/*

run 300ns
