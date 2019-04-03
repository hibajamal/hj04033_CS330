vlog tb.v top.v instructionParser.v registerFile.v

vsim -novopt work.tb

view wave

add wave sim:/tb/*

run 300ns
