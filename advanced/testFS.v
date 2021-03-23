module testFS();
reg A,B,BIN;
wire DIFF,BORR;
//full_subtr hs2(.a(A),.b(B),.bin(BIN),.d(DIFF),.b(BORR));
full_subtr_df hs2(.a(A),.b(B),.bin(BIN),.diff(DIFF),.bout(BORR));
integer k;
initial
begin
{A,B,BIN} = 3'b0;
for(k=0;k<8;k=k+1)
begin
#5{A,B,BIN} = k;
end
end
initial
begin
$monitor ($time,"  A B Bin = %b%b%b Difference= %b Bout = %b",A,B,BIN,DIFF,BORR);
end
endmodule
