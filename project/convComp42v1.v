module convComp42v1(sum,z0,z1,z2,z3);
input [3:0]z0,z1,z2,z3;
output wire [4:0] sum;
assign sum = ((z0&z1&(z2|z3))+(z2&z3&(z0|z1)))+(((z0&z1)|z2|z3)+((z2&z3)|z0|z1));
endmodule
