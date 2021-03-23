`timescale 1ms/100us
module testArbiter;
reg clk,rst,req_0,req_1;
wire gnt_0,gnt_1;
arbiter A (.clk(clk),.rst(rst),.req_0(req_0),.req_1(req_1),.gnt_0(gnt_0),.gnt_1(gnt_1));
always #5 clk = ~clk;
initial begin
$timeformat(-3,2,"ms",16);
clk = 1'b0;
rst = 1'b1;
#1 rst = 1'b0;
#100 $stop;
end
initial begin
#2 req_0 = 1'b0;req_1 = 1'b0;
#10 req_0 = 1'b1;req_1 = 1'b0;
#10 req_0 = 1'b0;req_1 = 1'b1;
#10 req_0 = 1'b1;req_1 = 1'b1;
end
initial begin
$monitor("%t Req = %b%b Grant = %b%b",$time, req_0,req_1,gnt_0,gnt_1);
end
endmodule