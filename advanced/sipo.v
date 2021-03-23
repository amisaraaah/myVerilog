module sipo (clk,rst,q3,q2,q1,q0,sin);
input clk,rst,sin;
output reg q3,q2,q1,q0;
always @(negedge clk) begin
if(rst)begin
q0<=1'b0;
q1<=1'b0;
q2<=1'b0;
q3<=1'b0;
end
else begin
q0<=sin;
q1<=q0;
q2<=q1;
q3<=q2;
end
end
endmodule
