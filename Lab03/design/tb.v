module tb
  ();
  
  reg sel;
  reg [63:0]a = 64'b0;
  reg [63:0]b = 64'b1;
  wire [63:0] data_out;
  
mux m1
(
    .sel(sel),
    .a(a),
    .b(b),
    .data_out(data_out)
);

initial
sel = 1'b0;

initial
#15 a = 64'hAB;
  
always 
#10 sel = ~sel;

endmodule
