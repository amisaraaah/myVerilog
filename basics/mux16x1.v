module mux16x1(i,s,y);
input [15:0]i;
input [3:0]s;
output wire y;
wire y0,y1,o1,o2,ns3;
mux8x1 muxone(.i(i[7:0]),.s(s[2:0]),.y(y0));
mux8x1 muxtwo(.i(i[15:8]),.s(s[2:0]),.y(y1));
not(ns3,s[3]);
and(o1,ns3,y0);
and(o2,s[3],y1);
or(y,o1,o2);
endmodule
