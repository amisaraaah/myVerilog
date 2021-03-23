module top_design (clk,rst,seven_sec_p1,seven_sec_p2,seven_min_p1,seven_min_p2,seven_hr_p1,seven_hr_p2);
input clk,rst;
output [6:0] seven_sec_p1,seven_sec_p2,seven_min_p1,seven_min_p2,seven_hr_p1,seven_hr_p2;
wire [2:0] seconds_p1;
wire [3:0] seconds_p2;
wire [2:0] minutes_p1;
wire [3:0] minutes_p2;
wire [1:0] hours_p1;
wire [3:0] hours_p2;
digital_clock DESIGN (.master_clk(clk),.reset(rst),.seconds_p1(seconds_p1),.seconds_p2(seconds_p2),
		.minutes_p1(minutes_p1),.minutes_p2(minutes_p2),.hours_p1(hours_p1),.hours_p2(hours_p2));
seven_seq_display DISPLAY(.seconds_p1(seconds_p1),.seconds_p2(seconds_p2),.minutes_p1(minutes_p1),.minutes_p2(minutes_p2),.hours_p1(hours_p1),.hours_p2(hours_p2),
	.seven_sec_p1(seven_sec_p1),.seven_sec_p2(seven_sec_p2),.seven_min_p1(seven_min_p1),.seven_min_p2(seven_min_p2),.seven_hr_p1(seven_hr_p1),.seven_hr_p2(seven_hr_p2));
endmodule
