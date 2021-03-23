module demux1x16(i,s,y);
input [3:0]s;
input i;
output wire [15:0]y;
wire [3:0]ns;
not mynot [3:0](ns,s);
and(y[0],ns[3],ns[2],ns[1],ns[0],i);
and(y[1],ns[3],ns[2],ns[1],s[0],i);
and(y[2],ns[3],ns[2],s[1],ns[0],i);
and(y[3],ns[3],ns[2],s[1],s[0],i);
and(y[4],ns[3],s[2],ns[1],ns[0],i);
and(y[5],ns[3],s[2],ns[1],s[0],i);
and(y[6],ns[3],s[2],s[1],ns[0],i);
and(y[7],ns[3],s[2],s[1],s[0],i);

and(y[8],s[3],ns[2],ns[1],ns[0],i);
and(y[9],s[3],ns[2],ns[1],s[0],i);
and(y[10],s[3],ns[2],s[1],ns[0],i);
and(y[11],s[3],ns[2],s[1],s[0],i);
and(y[12],s[3],s[2],ns[1],ns[0],i);
and(y[13],s[3],s[2],ns[1],s[0],i);
and(y[14],s[3],s[2],s[1],ns[0],i);
and(y[15],s[3],s[2],s[1],s[0],i);
endmodule
