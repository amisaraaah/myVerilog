module testGates();
reg A,B;
wire Y_not,Y_and,Y_or,Y_xor,Y_nand,Y_nor,Y_xnor;
not_gate_df not1(.a(A),.y(Y_not));
and_gate_df and1(.a(A),.b(B),.y(Y_and));
or_gate_df or1(.a(A),.b(B),.y(Y_or));
xor_gate_df xor1(.a(A),.b(B),.y(Y_xor));
nand_gate_df nand1(.a(A),.b(B),.y(Y_nand));
nor_gate_df nor1(.a(A),.b(B),.y(Y_nor));
xnor_gate_df xnor1(.a(A),.b(B),.y(Y_xnor));
integer k;
initial
begin
{A,B} = 2'b0;
for(k=0;k<4;k=k+1)
begin
#5{A,B} = k;
end
end 
initial
begin
$monitor ($time,"  AB = %b%b, AND = %b OR = %b NAND = %b NOR = %b XOR = %b XNOR = %b",A,B,Y_not,Y_and,Y_or,Y_nand,Y_nor,Y_xor,Y_xnor);
end
endmodule
