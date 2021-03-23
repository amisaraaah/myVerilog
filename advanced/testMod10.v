`timescale 1ms/100us
module testMod10();
reg clk,rst,sin;
wire sout;
wire [7:0] count;
integer i;
mod10Counter sreg (.clk(clk),.rst(rst),.sin(sin),.sout(sout),.count(count));
initial begin
rst = 1'b1;
clk = 1'b1;
$timeformat(-3,2,"ms",16);
end
always #5 clk = ~clk;
initial begin
#10 rst = 1'b0; sin = 1'b1;
#10 sin = 1'b0;
#10 sin = 1'b1;
#10 sin = 1'b0;
#10 sin = 1'b1; 
for (i=0;i<3;i=i+1) begin
#10 sin = 1'b1;
#10 sin = 1'b0;
#10 sin = 1'b1;
#10 sin = 1'b0;
end
#10 sin = 1'b1;
#40 rst = 1'b1;
#10 $stop;
end
initial begin
$monitor("%t  rst- %b sin- %b count- %d",$time,rst,sin,count);
end
endmodule
