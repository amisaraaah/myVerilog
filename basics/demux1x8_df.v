module demux1x8_df(i,s,y);
input [2:0]s;
input i;
output wire [7:0]y;
assign y[0] = ~s[2]&~s[1]&~s[0]&i;
assign y[1] = ~s[2]&~s[1]&s[0]&i;
assign y[2] = ~s[2]&s[1]&~s[0]&i;
assign y[3] = ~s[2]&s[1]&s[0]&i;

assign y[4] = s[2]&~s[1]&~s[0]&i;
assign y[5] = s[2]&~s[1]&s[0]&i;
assign y[6] = s[2]&s[1]&~s[0]&i;
assign y[7] = s[2]&s[1]&s[0]&i;
endmodule
