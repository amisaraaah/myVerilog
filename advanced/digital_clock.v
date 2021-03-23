module digital_clock (master_clk,reset,seconds_p1,seconds_p2,minutes_p1,minutes_p2,hours_p1,hours_p2);
input master_clk;
input reset;
output reg [2:0] seconds_p1;
output reg [3:0] seconds_p2;
output reg [2:0] minutes_p1;
output reg [3:0] minutes_p2;
output reg [1:0] hours_p1;
output reg [3:0] hours_p2;
always @(posedge master_clk ) begin
if(reset == 1'b1)
begin
seconds_p1 = 0;
seconds_p2=0;
minutes_p1 = 0;
minutes_p2=0;
hours_p1 = 0;
hours_p2=0;
end
else begin
if(master_clk == 1'b1)
begin
seconds_p2 = seconds_p2 + 1;
if(seconds_p2==4'd10)
begin
seconds_p1=seconds_p1+1;
seconds_p2=4'd0;
end
if(seconds_p1==3'd6)
begin
seconds_p1=3'd0;
minutes_p2 = minutes_p2 + 1;
end
if(minutes_p2==4'd10)
begin
minutes_p2=4'd0;
minutes_p1=minutes_p1+1;
end
if(minutes_p1==3'd6)
begin
minutes_p1=4'd0;
hours_p2=hours_p2+1;
end
if(hours_p2==4'd10)
begin
hours_p2=4'd0;
hours_p1=hours_p1+1;
end
if(hours_p1==2'd2 && hours_p2 ==4'd4)
begin
hours_p1=2'd0;
hours_p2=4'd0;
end
end
end
end
endmodule
