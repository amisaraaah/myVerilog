module half_subtr(x,y,d,b);
input x,y;
output wire d,b;
wire nx;
not(nx,x);
xor(d,x,y);
and(b,nx,y);
endmodule
