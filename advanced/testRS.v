`timescale 1ms/100us
module testRS();
reg clk,r,s;
wire q,qbar;
rsFlip rs1 (.clk(clk),.r(r),.s(s),.q(q),.qbar(qbar));
always #10 clk = ~clk;
initial begin
clk = 1'b0; 
$timeformat(-3,2,"ms",16);
end
initial begin
#20 {r,s} = 2'b01;
#20 {r,s} = 2'b10;
#20 {r,s} = 2'b00;
#20 {r,s} = 2'b11;
#20 $stop;
end
initial begin
$monitor ($time," r=%0d s=%0d q=%0d qbar = %b", r, s, q, qbar);
end
endmodule
