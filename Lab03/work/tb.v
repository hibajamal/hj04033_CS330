module tb
  ();
  
  reg sel;
  reg [63:0]a = 64'b0;
  reg [63:0]b = 64'b1;
  
mux m1
(
    .sel(sel),
    .a(a),
    .b(b)
);

initial
sel = 1'b0;

always 
#3 sel = ~sel;
  
endmodule