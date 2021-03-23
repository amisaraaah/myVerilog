module mux8x1(i,s,y);
input [7:0]i;
input [2:0]s;
output wire y;
wire [7:0]w;
wire [2:0]ns;
not mynot[2:0](ns,s);

and(w[0],ns[2],ns[1],ns[0],i[0]);
and(w[1],ns[2],ns[1],s[0],i[1]);
and(w[2],ns[2],s[1],ns[0],i[2]);
and(w[3],ns[2],s[1],s[0],i[3]);

and(w[4],s[2],ns[1],ns[0],i[4]);
and(w[5],s[2],ns[1],s[0],i[5]);
and(w[6],s[2],s[1],ns[0],i[6]);
and(w[7],s[2],s[1],s[0],i[7]);

or(y,w[7],w[6],w[5],w[4],w[3],w[2],w[1],w[0]);
endmodule
