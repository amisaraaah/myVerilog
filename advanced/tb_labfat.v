`timescale 1s/100ms
module tb_labfat();
reg clk,rst,req_0=0,req_1=0;
wire gnt_0,gnt_1;
labfat t1(.clk(clk),.rst(rst),.req_0(req_0),.req_1(req_1),.gnt_0(gnt_0),.gnt_1(gnt_1));
always #5 clk=~clk;
initial
begin
clk=1'b1;
rst=1'b0;
#5 rst=1'b1;
end
initial
begin
#10 req_0=1'b1;req_1=1'b0;
#10 req_0=1'b1;req_1=1'b1;
#10 req_0=1'b0;req_1=1'b1;
#10 req_0=1'b1;req_1=1'b0;
#10 req_0=1'b1;req_1=1'b1;
#10 req_0=1'b1;req_1=1'b0;
#10 req_0=1'b1;req_1=1'b1;
end
initial
begin
$timeformat(0,2,"s",5);
end
initial
$monitor($time,"At time t=%t clk=%b ,req_0=%b,req_1=%b,gnt_0=%b,gnt_1=%b ",$realtime,clk,req_0,req_1,gnt_0,gnt_1);
endmodule
