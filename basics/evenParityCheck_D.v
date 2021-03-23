module evenParityCheck_D(p,b,e);
input p;
input [2:0]b;
output wire e;
assign e = p^b[0]^b[1]^b[2];
endmodule
