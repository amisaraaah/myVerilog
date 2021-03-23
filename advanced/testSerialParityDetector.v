//`timescale 1ms/100us
module testSerialParityDetector;
reg clk,x;
wire z;
serialParityDetector SPD (.clk(clk),.x(x),.z(z));
always #5 clk = ~clk;
initial begin
//$timeformat(-3,2,"ms",16);
$dumpfile("parityz.vcd");
$dumpvars(0,testSerialParityDetector);
clk = 1'b0;
$monitor("%t x = %b z = %b",$time, x,z);
end
initial begin
#2 x = 0; #10 x = 1; #10 x = 1; #10 x = 1; 
#10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0;
#10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0;
end
endmodule
