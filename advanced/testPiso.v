`timescale 1ms/100us
module testPiso ();
reg clk,rst,p3,p2,p1,p0;
wire sout;
piso sreg4 (.clk(clk),.rst(rst),.p3(p3),.p2(p2),.p1(p1),.p0(p0),.sout(sout));
initial begin
clk = 1'b1;
rst = 1'b1;
$timeformat(-3,2,"ms",16);
end
always #5 clk=~clk;
initial begin
{p3,p2,p1,p0}=4'b1101;
#10 rst = 1'b0;
#50 $stop;
end
initial begin
$monitor("%t rst=%b in=%b%b%b%b out=%b",$time,rst,p3,p2,p1,p0,sout);
end
endmodule

