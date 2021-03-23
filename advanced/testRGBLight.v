`timescale 1ms/100us
module testRGBLight;
reg clk;
wire [2:0] light;
RGBLight L (.clk(clk),.light(light));
always #5 clk = ~clk;
initial begin
$timeformat(-3,2,"ms",16);
clk = 1'b0;
#100 $stop;
end
initial begin
$dumpfile("lightz.vcd");
$dumpvars(0,testRGBLight);
$monitor("%t Light = %b",$time, light);
end
endmodule
