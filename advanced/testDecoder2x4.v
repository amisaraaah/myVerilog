module testDecoder2x4();
reg e;
reg [1:0]a;
wire [3:0]q;
//decoder3x8 dec1(.d(d),.y(y));
//decoder2x4_df dec2(.a(a),.e(e),.q(q));
decoder2x4Beh dec3(.a(a),.e(e),.q(q));
integer k;
initial
begin
 {e,a} = 3'b0;
 for(k=0;k<16;k=k+1)
 begin
  #10 {e,a} = k;
 end
end
initial 
$monitor($time," enable %b input code = %b   output q3 %b q2 %b q1 %b q0 %b",e,a,q[3],q[2],q[1],q[0]);
initial
#120 $stop;
endmodule
