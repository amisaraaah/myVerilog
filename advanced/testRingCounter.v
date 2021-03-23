module testRingCounter();
parameter N = 7;
reg clk,init;
wire [N:0] count;
ringCounter rc1 (.clk(clk),.init(init),.count(count));
always #10 clk = ~clk;

initial begin
clk = 0;
init = 1;
#20 init = 0;
#150 init = 1;
#250 $stop;
end
initial begin
$monitor ($time, " %b %b", init,count);
end
endmodule
