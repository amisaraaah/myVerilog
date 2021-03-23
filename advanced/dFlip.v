module dFlip(clk,rst,din,dout);
input clk,rst,din;
output reg dout;
always @ (negedge clk)
begin
if(rst)
dout <= 1'b0;
else
dout <= din;
end
endmodule

