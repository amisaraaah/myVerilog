module testFA();
reg A,B,CIN;
wire SUM,COUT;
//full_adder fa1(.a(A),.b(B),.cin(CIN),.sum(SUM),.cout(COUT));
full_adder_df fa2(.a(A),.b(B),.cin(CIN),.sum(SUM),.cout(COUT));
integer k;
initial
begin
{A,B,CIN} = 3'b0;
for(k=0;k<8;k=k+1)
begin
#5{A,B,CIN} = k;
end
end
initial
begin
$monitor ($time,"  A B Cin = %b%b%b SUM= %b CARRY = %b",A,B,CIN,SUM,COUT);
end
endmodule
