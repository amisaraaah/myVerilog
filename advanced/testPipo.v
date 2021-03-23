`timescale 1ms/100us
module testPipo ();
reg clk,rst,p3,p2,p1,p0;
wire q0,q1,q2,q3;
pipo sreg3 (.clk(clk),.rst(rst),.p3(p3),.p2(p2),.p1(p1),.p0(p0),.q0(q0),.q1(q1),.q2(q2),.q3(q3));
initial begin
clk = 1'b1;
rst = 1'b1;
$timeformat(-3,2,"ms",16);
end
always #5 clk = ~clk;
initial begin
#10 rst= 1'b0; {p3,p2,p1,p0}=4'b1100;
#10 {p3,p2,p1,p0}=4'b1001;
#10 {p3,p2,p1,p0}=4'b1101;
#10 rst = 1'b1;
#10 {p3,p2,p1,p0}=4'b1111;
#5 $stop;
end
initial begin
$monitor ("%t clk=%b rst=%b in=%b%b%b%b out= %b%b%b%b",$time,clk,rst,p3,p2,p1,p0,q3,q2,q1,q0);
end
endmodule
