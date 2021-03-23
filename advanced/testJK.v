`timescale 1ms/100us
module testJK();
reg clk,j,k;
wire q,qbar;
jkFlip jk1 (.clk(clk),.j(j),.k(k),.q(q),.qbar(qbar));
initial begin
clk = 1'b0;
$timeformat(-3,2,"ms",16);
end
always #10 clk = ~clk;
initial begin
#20 {j,k} <= 2'b01;
#40 {j,k} <= 2'b10;
#60 {j,k} <= 2'b11;
#80 {j,k} <= 2'b00;
#100 $stop;
end
initial begin
$monitor ("%t j=%0d k=%0d q=%0d qbar = %b",$time, j, k, q, qbar);
end
endmodule
