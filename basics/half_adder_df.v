module half_adder_df(a,b,s,c);
input a,b;
output wire s,c;
assign s=a^b;
assign c=a&b;
endmodule
