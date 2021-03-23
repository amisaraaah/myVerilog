`timescale 1ms/100us
module secondCounter(clk,reset,sec);
input clk;
input reset;
output reg [5:0]sec;
reg [32:0] count;
reg clr_count;
always@(posedge clk) begin
if(reset || clr_count) 	count <= #1 0;
else count <= #1 count+1;
end
always@* 
if (count == 33'd5_999_999_999) begin
clr_count <= 1'b1;
sec <= sec+5'b1;
end
endmodule
