module testEvenParityChecker();
reg [2:0]b;
reg p;
wire e;
evenParityChecker_S epc1 (.p(p),.b(b),.e(e));
integer k;
initial
begin
$monitor($time,"  %b %b  -  %b", p,b,e);
{p,b} = 4'b0;
for(k=0;k<16;k=k+1)
#5 {p,b} = k;
#100 $finish;
end
endmodule
