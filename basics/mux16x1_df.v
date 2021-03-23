module mux16x1_df(i,s,y);
input [15:0]i;
input [3:0]s;
output wire y;
wire y0,y1,o1,o2;
mux8x1_df muxone(.i(i[7:0]),.s(s[2:0]),.y(y0));
mux8x1_df muxtwo(.i(i[15:8]),.s(s[2:0]),.y(y1));
assign y = s[3]? y1:y0;
endmodule

