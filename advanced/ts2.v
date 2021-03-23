module ts2;
reg clk,rst;
wire[3:0]count;
counterup c1(count,clk,rst);
initial
begin
clk = 1'b0;
rst = 1'b1;
#20 rst = 1'b0;
#200 $stop;
end
//count=4'b1000;
always #2 clk=~clk;
initial 
$monitor($time,"rst=%b,count=%b,clk=%b",rst,count,clk);
endmodule
