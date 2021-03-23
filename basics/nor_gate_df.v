module nor_gate_df(a,b,y);
input a,b;
output wire y;
assign y = ~(a|b);
endmodule
