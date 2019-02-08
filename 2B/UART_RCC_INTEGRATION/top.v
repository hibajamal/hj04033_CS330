module top(
	input clk, reset, rx,
	output tx, [3:0]q
    );
	 

ripple_carry_counter r_cc0(
	.clk(clk),
	.reset(reset),
	.q(q)
);

wire [7:0]counter_data;
assign counter_data = {4'b0000,q};

uart_top uart_top0(
		.clk(clk),
		.reset(reset),
		.data_to_tx(counter_data),
		.rx(rx),
		.tx(tx)
);

endmodule
