module siso (clk,rst,sin,sout);
input clk,rst,sin;
output sout;
reg q0,q1,q2,sout;
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
endmodule
