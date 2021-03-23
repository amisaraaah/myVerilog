module counterup(count,clk,rst);
input clk,rst;
output[3:0]count;
reg[3:0]count;
always@(posedge clk)
begin
if(rst)
count<=4'b0000;
else
count<=count+4'b1;
end
endmodule
