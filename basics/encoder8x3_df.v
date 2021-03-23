module encoder8x3_df(d,y);
input [7:0]d;
output wire [2:0]y;
assign y[2] = d[4]|d[5]|d[6]|d[7];
assign y[1] = d[2]|d[3]|d[6]|d[7];
assign y[0] = d[1]|d[3]|d[5]|d[7];
endmodule
