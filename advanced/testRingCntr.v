`timescale 1ms/100us
module testRingCntr();
reg clk,rst;
wire q7,q6,q5,q4,q3,q2,q1,q0;
ringCntr rc1 (.clk(clk),.rst(rst),.q7(q7),.q6(q6),.q5(q5),.q4(q4),.q3(q3),.q2(q2),.q1(q1),.q0(q0));
always #5 clk = ~clk;
initial begin
$timeformat(-3,2,"ms",16);
rst = 1'b1;
clk = 1'b1;
end
initial begin
#20 rst = 1'b0;
#100 rst = 1'b1;
#200 $stop;
end
initial 
$monitor ("T = %t reset = %b count = %b%b%b%b%b%b%b%b",$time,rst,q7,q6,q5,q4,q3,q2,q1,q0);
endmodule
