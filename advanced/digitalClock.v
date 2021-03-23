module digitalClock(clk,reset,secCode,minCode,hrsCode);
input clk;  
input reset;
output wire [13:0]secCode,minCode,hrsCode;
reg [5:0] seconds;
reg [5:0] minutes;
reg [4:0] hours; 
always @(posedge(clk) or posedge(reset))begin
if(reset == 1'b1) begin 
seconds = 0;
minutes = 0;
hours = 0; 
end
else if(clk == 1'b1) begin  //at the beginning of each second
seconds = seconds + 1; 
if(seconds == 60) begin //check for max value of sec
	seconds = 0;  
	minutes = minutes + 1; 
	if(minutes == 60) begin //check for max value of min
		minutes = 0; 
		hours = hours + 1;
		if(hours ==  24) begin  //check for max value of hours
			hours = 0;
		end 
	end
end     
end //else if block
end //always block
sevenSegment seg1 (.number({1'b0,hours}),.segments(hrsCode));
sevenSegment seg2 (.number(minutes),.segments(minCode));
sevenSegment seg3 (.number(seconds),.segments(secCode));
endmodule
