module comp42(sapp,z0,z1,z2,z3);
input z0,z1,z2,z3;
output wire [2:0]sapp;
assign sapp = ((z0&z2)|z1|z3)+((z1&z3)|z0|z2);
endmodule
