`timescale 1ms/100us
module testSeqGen4bit;
reg clk,A,rst_n;
wire w,x,y,z;
seqGen4bit SG (.clk(clk),.rst_n(rst_n),.A(A),.w(w),.x(x),.y(y),.z(z));
initial begin
   clk=1'b0;
   rst_n=1'b0;
   $timeformat(-3,2,"ms",16);
end
always #5 clk = ~clk;
initial begin
   $monitor("%t A = %b   w x y z = %b %b %b %b",$time,A,w,x,y,z);
end
initial begin
#2 rst_n=1'b1; A = 1'b0; 
#100 rst_n=1'b0; 
#5 A = 1'b1; rst_n=1'b1; 
#100 $stop;
end
endmodule
