module ringCounter (clk, init, count);
parameter N = 7;
input clk, init;
output reg [N:0] count;
always @(posedge clk)
begin
if(init)
count <= 8'b0001;
else
begin
count <= count << 1;
count[0] <= count[N];
end
end
endmodule
