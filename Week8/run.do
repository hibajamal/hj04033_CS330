vlog tb.v Instruction_Fetch.v Instruction_Memory.v Adder.v Program_Counter.v

vsim -novopt work.tb

view wave

add wave sim:/tb/*
add wave sim:/tb/if0/*
add wave sim:/tb/if0/a0/*
add wave sim:/tb/if0/pc0/*
add wave sim:/tb/if0/im0/*
run 300ns