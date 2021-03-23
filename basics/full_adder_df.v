module full_adder_df(a,b,cin,sum,cout);
input a,b,cin;
output wire sum,cout;
assign sum = a^b^cin;
assign cout = (a&b) | (b&cin) | (a&cin);
endmodule
