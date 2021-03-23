`timescale 1ps/100fs
module testDetect00or11;
reg clk,rst_n,w;
wire z;
detect00or11 f1(.clk(clk),.rst_n(rst_n),.w(w),.z(z));
initial begin
   clk=1'b1;
   w=1'b0;
   rst_n = 1'b0;
end
always
   #5 clk = ~clk;
initial begin
#2 w = 1'b0; rst_n=1'b1; 
#10 w = 1'b1; #10 w = 1'b0; #10 w = 1'b0; 
#10 w = 1'b1; #10 w = 1'b1; #10 w = 1'b1; 
#10 w = 1'b1; #10 w = 1'b0; #10 w = 1'b0; 
#10 $stop;
end
initial $timeformat(-12,2,"ps");
initial begin
  $monitor ("Time = %t w = %b, z = %b",$time,w,z);
end
endmodule
