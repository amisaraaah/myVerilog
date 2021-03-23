`timescale 1ms/100us
module testD();
reg clk,rst,din;
wire dout;
dFlip d1 (.clk(clk),.rst(rst),.din(din),.dout(dout));
initial begin
rst <= 1'b1;
din <= 1'b1;
clk <= 1'b0;
$timeformat(-3,2,"ms",16);
end
always #10 clk = ~clk;
initial begin
#20 rst = 1'b0;
#10 din = 1'b0;
#20 rst = 1'b0;
#10 din = 1'b1;
#10 rst = 1'b1;
end
initial begin
$monitor(" T = %t clk %b rst %b din %b dout %b", $time,clk,rst,din,dout);
end
initial begin
#80 $stop;
end
endmodule
