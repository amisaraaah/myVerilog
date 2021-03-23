module johnsonCntr(clk,rst,q7,q6,q5,q4,q3,q2,q1,q0);
input clk, rst;
output reg q7,q6,q5,q4,q3,q2,q1,q0;
always @ (negedge clk) begin
if(rst) begin
q7 <= 1'b0;
q6 <= 1'b0;
q5 <= 1'b0;
q4 <= 1'b0;
q3 <= 1'b0;
q2 <= 1'b0;
q1 <= 1'b0;
q0 <= 1'b1;
end
else begin
q7 <= q6;
q6 <= q5;
q5 <= q4;
q4 <= q3;
q3 <= q2;
q2 <= q1;
q1 <= q0;
q0 <= ~q7;
end
end
endmodule
