module full_subtr(a,b,bin,diff,bout);
input a,b,bin;
output wire diff,bout;
wire b1,b2,b3,na;
not(na,a);
xor(diff,a,b,bin);
and(b1,na,b);
xnor(b2,a,b);
and(b3,b2,bin);
or(bout,b1,b3);
endmodule
