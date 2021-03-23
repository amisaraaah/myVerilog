module demux1x4_df(i,s,y);
input [1:0]s;
input i;
output wire [3:0]y;
assign y[0] = ~s[1] & ~s[0] & i;
assign y[1] = ~s[1] & s[0] & i;
assign y[2] = s[1] & ~s[0] & i ;
assign y[3] = s[1] & s[0] & i;
endmodule
