`timescale 10ns/10ps
module test_digital_clock;
reg master_clk;
reg reset;
wire [2:0] seconds_p1;
wire [3:0] seconds_p2;
wire [2:0] minutes_p1;
wire [3:0] minutes_p2;
wire [1:0] hours_p1;
wire [3:0] hours_p2;
digital_clock dut ( .master_clk(master_clk),.reset(reset),.seconds_p1(seconds_p1),.seconds_p2(seconds_p2),
	.minutes_p1(minutes_p1),.minutes_p2(minutes_p2),.hours_p1(hours_p1),.hours_p2(hours_p2) );
initial master_clk = 0;
always
#20
master_clk = ~master_clk;
initial begin
reset = 1;
#50;
reset = 0;
end
initial
$monitor("hr:%0d%0d \t min:%0d%0d sec:%0d%0d",hours_p1,hours_p2,minutes_p1,minutes_p2,seconds_p1,seconds_p2);
endmodule
