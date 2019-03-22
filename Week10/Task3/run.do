vlog tb.v ALU_Control.v Control_Unit.v top_control.v

vsim -novopt work.tb

view wave

add wave sim:/tb/*

run 300ns