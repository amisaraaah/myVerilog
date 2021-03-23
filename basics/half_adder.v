module half_adder(a,b,s,c);
input a,b;
output wire s,c;
xor(s,a,b);
and(c,a,b);
endmodule