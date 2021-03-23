module testDemux1x16();
reg i;
reg [3:0]s;
wire [15:0]y;
//demux1x16 demux1 (.i(i),.s(s),.y(y));
demux1x16_df demux2 (.i(i),.s(s),.y(y));
integer n;
initial 
n = 6;
initial 
begin
i = 1'b1;
s = 3'b0;
repeat (5)
begin
#5 s = $random(n)%5'b10000;
end
end
initial
begin
$display("Output y[15] to y[0]");
$monitor ($time," select line is '%b' output is %b",s,y);
end
endmodule
