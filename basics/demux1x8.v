module demux1x8(i,s,y);
input [2:0]s;
input i;
output wire [7:0]y;
wire [2:0]ns;
not mynot [2:0](ns,s);
and(y[0],ns[2],ns[1],ns[0],i);
and(y[1],ns[2],ns[1],s[0],i);
and(y[2],ns[2],s[1],ns[0],i);
and(y[3],ns[2],s[1],s[0],i);
and(y[4],s[2],ns[1],ns[0],i);
and(y[5],s[2],ns[1],s[0],i);
and(y[6],s[2],s[1],ns[0],i);
and(y[7],s[2],s[1],s[0],i);
endmodule
