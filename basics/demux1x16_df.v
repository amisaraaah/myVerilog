module demux1x16_df(i,s,y);
input [3:0]s;
input i;
output wire [15:0]y;
wire [3:0]w;
demux1x4_df dem(.i(i),.s(s[3:2]),.y(w[3:0]));
demux1x4_df dem3(.i(w[3]),.s(s[1:0]),.y(y[15:12]));
demux1x4_df dem2(.i(w[2]),.s(s[1:0]),.y(y[11:8]));
demux1x4_df dem1(.i(w[1]),.s(s[1:0]),.y(y[7:4]));
demux1x4_df dem0(.i(w[0]),.s(s[1:0]),.y(y[3:0]));
endmodule
