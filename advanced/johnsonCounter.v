module johnsonCounter (clk, init, count);
parameter N = 7;
input clk, init;
output reg [N:0] count;
always @(posedge clk)
begin
if(init)
count <= 8'b0000;
else
begin
count <= {~count[0],count[N:1]};
end
end
endmodule
