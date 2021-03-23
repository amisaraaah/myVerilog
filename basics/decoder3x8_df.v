module decoder3x8_df(d,y);
input [2:0]y;
output wire[7:0]d;
assign d[0] = ~y[2]&~y[1]&~y[0];
assign d[1] = ~y[2]&~y[1]&y[0];
assign d[2] = ~y[2]&y[1]&~y[0];
assign d[3] = ~y[2]&y[1]&y[0];
assign d[4] = y[2]&~y[1]&~y[0];
assign d[5] = y[2]&~y[1]&y[0];
assign d[6] = y[2]&y[1]&~y[0];
assign d[7] = y[2]&y[1]&y[0];
endmodule
