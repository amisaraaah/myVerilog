`timescale 1s/100ms
module testAmiFat();
reg clk,rst_n,A,B;
wire N,R;
amiFat uut(.clk(clk),.rst_n(rst_n),.A(A),.B(B),.N(N),.R(R));
always #5 clk=~clk;
initial begin
clk=1'b1;
rst_n=1'b0;
#5 rst_n=1'b1;
end
initial begin
#4 A=1'b0;B=1'b1;
#4 A=1'b1;B=1'b0;
#4 A=1'b0;B=1'b0;
#4 A=1'b0;B=1'b1;
#4 A=1'b1;B=1'b0;
#4 A=1'b1;B=1'b1;
#4 A=1'b0;B=1'b0;
#4 A=1'b1;B=1'b1;
#4 A=1'b1;B=1'b1;
#4 A=1'b0;B=1'b1;
#4 A=1'b0;B=1'b1; 
#4 $stop;
end
initial begin
$timeformat(0,2,"s",5);
end
initial
$monitor($time,"At time t= %t clk = %b A = %b B = %b R = %b N = %b ",$realtime,clk,A,B,R,N);
endmodule
