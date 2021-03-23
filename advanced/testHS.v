module testHS();
reg A,B;
wire DIFF,BORR;
//half_subtr hs1(.x(A),.y(B),.d(DIFF),.b(BORR));
half_subtr_df hs2(.x(A),.y(B),.d(DIFF),.b(BORR));
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
$monitor ($time,"  AB = %b%b Difference= %b Borrow = %b",A,B,DIFF,BORR);
end
endmodule
