module mux4x1(i0,i1,i2,i3,s0,s1,y);
input i0,i1,i2,i3,s0,s1;
output wire y;
wire y0,y1,y2,y3,ns0,ns1;
not(ns0,s0);
not(ns1,s1);
and(y0,ns1,ns0,i0);
and(y1,ns1,s0,i1);
and(y2,s1,ns0,i2);
and(y3,s1,s0,i3);
or(y,y0,y1,y2,y3);
endmodule
