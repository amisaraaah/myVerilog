`timescale 1ms/100us
module testSiso();
reg clk,rst,sin;
wire sout;
siso sreg (.clk(clk),.rst(rst),.sin(sin),.sout(sout));
initial begin
rst = 1'b1;
clk = 1'b1;
$timeformat(-3,2,"ms",16);
end
always #5 clk = ~clk;
initial begin
#10 rst = 1'b0; sin = 1'b1;
#10 sin = 1'b1;
#10 sin = 1'b0;
#10 sin = 1'b1;
#10 sin = 1'b1;
#40 rst = 1'b1;
#10 $stop;
end
initial begin
$monitor("%t  rst- %b sin- %b sout- %b",$time,rst,sin,sout);
end
endmodule
