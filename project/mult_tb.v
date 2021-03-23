module testMulBinaryApprox();
reg [5:0] a,b;
wire [11:0] c;
approx_mult_6_6_two_step t2(.a(a),.b(b),.c(c));
integer i,j;
initial 
begin
a = 6'b0; b = 6'b0;
$dumpfile("mulFile.vcd");
$dumpvars(0,testMulBinaryApprox);
for (i=0;i<64;i = i+1) begin
   for (j=0;j<64;j=j+1) begin
	#2 a = i; b = j;
   end
end
end
initial begin
$monitor($time,"a = %d b = %d  c = %d ",a,b,c);
#1000000 $stop; 
end
endmodule
