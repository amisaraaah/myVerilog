module decoder3x8(d,y);
input [2:0]y;
output wire[7:0]d;
wire [2:0]ny;
not mynot[2:0](ny,y);
//not(ny[2],y[2]);
//not(ny[1],y[1]);
//not(ny[0],y[0]);
and(d[0],ny[2],ny[1],ny[0]);
and(d[1],ny[2],ny[1],y[0]);
and(d[2],ny[2],y[1],ny[0]);
and(d[3],ny[2],y[1],y[0]);
and(d[4],y[2],ny[1],ny[0]);
and(d[5],y[2],ny[1],y[0]);
and(d[6],y[2],y[1],ny[0]);
and(d[7],y[2],y[1],y[0]);
endmodule
