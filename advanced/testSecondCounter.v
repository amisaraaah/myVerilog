`timescale 1ms/100us
module testSecondCounter();
reg clk;
reg reset;
wire [5:0]sec;
secondCounter uut(.clk(clk),.reset(reset),.sec(sec));
initial begin
clk = 1'b0;
reset = 1'b1;
forever #5 clk = ~clk;
end
initial begin
reset = 1'b0;
#500000000 $stop;
end
initial
$monitor("%t %d ",$time,sec);
endmodule
