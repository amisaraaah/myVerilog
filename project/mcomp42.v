module mcomp42(w0,w1,z0,z1,z2,z3);
input z0,z1,z2,z3;
output wire w0,w1;




assign w0 = (z0&z2)|z1|z3;
assign w1 = (z1&z3)|z0|z2;


endmodule
