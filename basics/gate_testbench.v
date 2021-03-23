module gate_testbench();
reg A,B;
wire Y_not,Y_and,Y_or,Y_xor,Y_nand,Y_nor,Y_xnor;
not_gate not1(.a(A),.y(Y_not));
and_gate and1(.a(A),.b(B),.y(Y_and));
or_gate or1(.a(A),.b(B),.y(Y_or));
xor_gate xor1(.a(A),.b(B),.y(Y_xor));
nand_gate nand1(.a(A),.b(B),.y(Y_nand));
nor_gate nor1(.a(A),.b(B),.y(Y_nor));
xnor_gate xnor1(.a(A),.b(B),.y(Y_xnor));
initial
begin
A=1'b0;
B=1'b0;
#100;
A=1'b0;
B=1'b1;
#100;
A=1'b1;
B=1'b0;
#100;
A=1'b1;
B=1'b1;
end 
initial
begin
$monitor ($time,"A = %b B = %b, Not A = %b AND = %b OR = %b NAND = %b NOR = %b XOR = %b XNOR = %b",A,B,Y_not,Y_and,Y_or,Y_xor,Y_nand,Y_nor,Y_xnor);
end
endmodule
