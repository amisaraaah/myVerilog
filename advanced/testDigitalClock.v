`timescale 1ms/1ms
module testDigitalClock();
reg clk;
reg reset;
wire [13:0]secCode,minCode,hrsCode;
digitalClock uut (.clk(clk),.reset(reset),.secCode(secCode),.minCode(minCode),.hrsCode(hrsCode));  
initial begin
clk <= 0;
reset <= 1;
$timeformat(0,0,"s");
end
always #500 clk = ~clk;  //Every 0.5 sec toggle the clock.
initial begin
// Wait 100 ns for global reset to finish
#1 reset = 0;  
#100 $stop;
end
initial begin
$monitor("%t hrs: %b %b min: %b %b sec: %b %b",$time,hrsCode[13:7],hrsCode[6:0],
		minCode[13:7],minCode[6:0],secCode[13:7],secCode[6:0]);
end  
endmodule
