module mod10Counter(clk,rst,sin,sout,count);
input sin,clk,rst; 
output reg sout;
output reg [7:0] count;
reg q0,q1,q2;
always@(negedge clk) begin
if(rst)begin
q0<=1'b0;
q1<=1'b0;
q2<=1'b0;
sout<=1'b0;
end
else begin
q0<=sin;
q1<=q0;
q2<=q1;
sout<=q2;
end
end
initial count <= 8'b0;
always @ (sout,q2,q1,q0) begin
if ({sout,q2,q1,q0}==4'b1010)
count <= count+1'b1;
else
count <= count;
end
endmodule
