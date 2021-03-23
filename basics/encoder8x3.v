module encoder8x3(d,y);
input [7:0]d;
output wire [2:0]y;
or(y[2],d[4],d[5],d[6],d[7]);
or(y[1],d[2],d[3],d[6],d[7]);
or(y[0],d[1],d[3],d[5],d[7]);
endmodule
