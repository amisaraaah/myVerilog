`timescale 1ms/100us
module testSeqDetector;
reg clk,x,rst;
wire z;
seqDetector SD (.clk(clk),.x(x),.z(z),.rst(rst));
always #5 clk = ~clk;
initial begin
$timeformat(-3,2,"ms",16);
//$dumpfile("seqz.vcd");
//$dumpvars(0,testSeqDetector);
clk = 1'b0;
$monitor("%t x = %b z = %b",$time, x,z);
end
initial begin
#2 x = 0; #10 x = 0; #10 x = 1; #10 x = 1; 
#10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0;
#10 x = 1; #10 x = 1; #10 x = 1; #10 x = 0; 
#10 x = 1;
end
endmodule
