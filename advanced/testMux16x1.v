module testMux16x1();
reg [15:0]i;
reg [3:0]s;
wire y;
//mux16x1 tmux (.i(i),.s(s),.y(y));
mux16x1df tmux (.i(i),.s(s),.y(y));
integer k;
initial
begin
i = 16'b1011_0011_1001_1100;
$display("\t\tinput = %b",i);
$monitor($time," selectline = %b  - output = %b",s,y);
for(k=0;k<16;k=k+1)
begin
#10 s = k;
end
end
endmodule

