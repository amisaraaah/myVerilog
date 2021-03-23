`timescale 1ms/10us
module testT;
reg clk,rst,t;
wire q,qbar;
tFlip tff (.clk(clk),.rst(rst),.t(t),.q(q),.qbar(qbar));
integer i;
reg [2:0] dly;
always #5 clk = ~clk;
initial begin
$timeformat(-3,2,"ms",16);
{rst, clk, t} <= 0;
$monitor ("T = %t  rst = %0b t = %b q = %b qbar = %b", $time, rst, t, q, qbar);
repeat(2) @(posedge clk);
rst <= 1;
for (i = 0; i < 8; i = i+1) begin
dly = $random;
#(dly) t <= $random;
end
#20 $stop;
end
endmodule
