module full_adder(a,b,cin,sum,cout);
input a,b,cin;
output wire sum,cout;
wire c1,c2,c3;
xor(sum,a,b,cin);
and(c1,a,b);
and(c2,b,cin);
and(c3,a,cin);
or(cout,c1,c2,c3);
endmodule
