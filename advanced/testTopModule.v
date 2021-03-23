module testTopModule();
reg clk,rst;
wire [6:0] seven_sec_p1,seven_sec_p2,seven_min_p1,seven_min_p2,seven_hr_p1,seven_hr_p2;

top_design DUT (.clk(clk),.rst(rst),.seven_sec_p1(seven_sec_p1),.seven_sec_p2(seven_sec_p2),
	.seven_min_p1(seven_min_p1),.seven_min_p2(seven_min_p2),.seven_hr_p1(seven_hr_p1),.seven_hr_p2(seven_hr_p2));
initial clk = 0;
always
#20 clk = ~clk;
initial begin
rst = 1;
#50;
rst = 0;
end
initial
$monitor("seven_sec_p1 %b \t seven_sec_p2 %b \t seven_min_p1 %b \t seven_min_p2 %b \t seven_hr_p1 %b \t seven_hr_p2 %b ",seven_sec_p1,seven_sec_p2,seven_min_p1,seven_min_p2,seven_hr_p1,seven_hr_p2);
endmodule
