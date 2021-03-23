module testMux8x1();
reg [7:0]i;
reg [2:0]s;
wire y;
mux8x1 mux1 (.i(i),.s(s),.y(y));
//mux8x1_df mux2 (.i(i),.s(s),.y(y));
integer k;
initial 
begin
i = 8'b1011_0011;
$display("\t\tinput = %b",i);
//$monitor($time," selectline = %b  - output = %b",s,y);
for(k=0;k<8;k=k+1)
begin
#10 s = k;
$display($time," selectline = %b  - output = %b",s,y);
end
end
endmodule
