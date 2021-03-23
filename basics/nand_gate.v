module nand_gate(a,b,y);
input a,b;
output wire y;
nand(y,a,b);
endmodule
