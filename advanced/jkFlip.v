module jkFlip(clk,j,k,q,qbar);
input j,k,clk;
output reg q;
output wire qbar;
assign qbar = ~q;
always @ (negedge clk)
begin
if(k == 1'b1)
   begin
    q <= 1'b0;
   end
  else if(j == 1'b1)
   begin
    q <= 1'b1;
   end
  else if(j == 1'b0 && k == 1'b0)
   begin
    q <= q;
   end
  else if(j == 1'b1 && k == 1'b1)
   begin
    q <= ~q;
   end
end
endmodule

