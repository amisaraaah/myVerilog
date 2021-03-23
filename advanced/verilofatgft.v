module verilofatgft (clk,M,E,X,FD,C);
input clk,M,E,X,FD;
output reg C;
reg FC;
always @ (posedge clk) begin
FC <= E | X;
if (M) 
C <= FC & FD;
else 
C <= FD;
end
endmodule



