module mux2x1(i0,i1,s,y);
input i0,i1,s;
output wire y;
wire y0,y1,ns;
not(ns,s);
and(y0,ns,i0);
and(y1,s,i1);
or(y,y0,y1);
endmodule
