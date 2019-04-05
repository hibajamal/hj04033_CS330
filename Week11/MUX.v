module mux (
  input [63:0] a,
  input [63:0] b,
  input sel,
  output reg [63:0] data_out
);
  
always @ (sel or a or b) // will execute whenever sel changes, to whatever direction
  begin
    if (~sel)
      data_out <= a;  
    else
      data_out <= b;
  end

endmodule