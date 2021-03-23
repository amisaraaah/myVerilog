`timescale 1ms/100us
module testSipo ();
reg clk,rst,sin;
wire q3,q2,q1,q0;
sipo sreg2 (.clk(clk),.rst(rst),.q3(q3),.q2(q2),.q1(q1),.q0(q0),.sin(sin));
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

#10 sin = 1'b0;
#10 sin = 1'b1;
#10 sin = 1'b1;
#10 sin = 1'b0;
#10 rst = 1'b1;
#5 $stop;
end
initial begin
$monitor ("%t rst=%b sin = %b Q = %b%b%b%b", $time,rst,sin,q3,q2,q1,q0);
end
endmodule
