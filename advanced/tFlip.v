module tFlip (clk,rst,t, q,qbar);
input clk,rst,t;
output reg q;
output wire qbar;
assign qbar = ~q;
always @ (posedge clk) begin
if (!rst)
q <= 0;
else
if (t)
q <= ~q;
else
q <= q;
end
endmodule
