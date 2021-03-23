module full_subtr_df(a,b,bin,diff,bout);
input a,b,bin;
output wire diff,bout;
wire b1,b2,b3;
assign diff = a^b^bin;
assign b1 = ~a&b;
assign b2 = a^b;
assign b3 = b2&bin;
assign bout = b1|b3;
endmodule
