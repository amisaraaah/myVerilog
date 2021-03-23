module demux1x4(i,s,y);
input [1:0]s;
input i;
output wire [3:0]y;
wire [1:0]ns;
not mynot[1:0](ns,s);
and(y[0],ns[1],ns[0],i);
and(y[1],ns[1],s[0],i);
and(y[2],s[1],ns[0],i);
and(y[3],s[1],s[0],i);
endmodule