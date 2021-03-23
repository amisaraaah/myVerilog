module pipo (clk,rst,p3,p2,p1,p0,q0,q1,q2,q3);
input clk,rst,p3,p2,p1,p0;
output reg q0,q1,q2,q3;
always@(negedge clk) begin
if(rst) begin
q0<=1'b0;
q1<=1'b0;
q2<=1'b0;
q3<=1'b0;
end
else begin
q0<=p0;
q1<=p1;
q2<=p2;
q3<=p3;
end
end
endmodule
