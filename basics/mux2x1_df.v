module mux2x1_df(i0,i1,s,y);
input i0,i1,s;
output wire y;
assign y = s?i1:i0;
endmodule
