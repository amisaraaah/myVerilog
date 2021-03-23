module shift_reg(clk,rst,s0,s1,lsi,rsi,din,qout);
parameter n=4;
input s1,s0,lsi,rsi,clk,rst;
input [n-1:0] din;
output reg [n-1:0] qout;
always @ (posedge clk or negedge rst)
if(!rst)
qout<={n{1'b0}};
else
case({s1,s0})
2'b00: qout <=qout;
2'b01:qout<={lsi,qout[n-1:1]};
2'b10:qout<={qout[n-2:0],rsi};
2'b11:qout<=din;
endcase
endmodule
