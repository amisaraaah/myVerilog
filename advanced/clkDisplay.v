module clkDisplay(clk,reset,secCode,minCode,hrsCode);
input clk,reset;
output wire [13:0]secCode,minCode,hrsCode;
reg [5:0] seconds;
reg [5:0] minutes;
reg [4:0] hours; 
//digitalClock dclk (.clk(clk),.reset(reset),.seconds(seconds),.minutes(minutes),.hours(hours));
//sevenSegment seg1 (.number({1'b0,hours}),.segments(hrsCode));
//sevenSegment seg2 (.number(minutes),.segments(minCode));
//sevenSegment seg3 (.number(seconds),.segments(secCode));
endmodule
