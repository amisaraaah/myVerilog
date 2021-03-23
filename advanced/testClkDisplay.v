module testClkDisplay();
reg clk,reset;
wire [13:0]secCode,minCode,hrsCode;

clkDisplay uut (.clk(clk),.reset(reset),.secCode(secCode),.minCode(minCode),.hrsCode(hrsCode));
//clock gen
always #5 clk = ~clk; 
//initialization
initial begin
clk <= 0;
reset <= 1;
end
initial begin
#5 reset <= 1'b0;
#200 $stop;
end
initial begin
$monitor("hrs: %b %b min: %b %b sec: %b %b",hrsCode[13:7],hrsCode[6:0],
		minCode[13:7],minCode[6:0],secCode[13:7],secCode[6:0]);
end
endmodule
