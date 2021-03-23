module half_subtr_df(x,y,d,b);
input x,y;
output wire d,b;
assign d = x^y;
assign b = ~x&y;
endmodule
