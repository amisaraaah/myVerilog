module piso(clk,rst,p3,p2,p1,p0,sout);
input clk,rst,p3,p2,p1,p0;
output reg sout;
reg q0,q1,q2;
always@(negedge clk)begin
if(rst) begin
q0<=p0;
q1<=p1;
q2<=p2;
sout<=p3;
end
else begin
q1<=q0;
q2<=q1;
sout<=q2;
end
end
endmodule
