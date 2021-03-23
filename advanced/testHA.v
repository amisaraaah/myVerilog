module testHA();
reg A,B;
wire SUM,CARR;
//half_adder ha1(.a(A),.b(B),.s(SUM),.c(CARR));
half_adder_df ha2(.a(A),.b(B),.s(SUM),.c(CARR));
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
$monitor ($time,"  AB = %b%b SUM= %b CARRY = %b",A,B,SUM,CARR);
end
endmodule
