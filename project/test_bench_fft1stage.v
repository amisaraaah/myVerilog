module test_bench_fft1stage();
reg signed[15:0]x0,x4,x2,x6;
wire signed[16:0]y0r,y1r,y2r,y3r;

complex_add_sub fft1(.x0(x0),.x4(x4),.x2(x2),.x6(x6),.y0r(y0r),.y1r(y1r),.y2r(y2r),.y3r(y3r));

initial begin
x0=1;
x4=5;
x2=3;
x6=7;
end
initial begin
$monitor($time," y0=%0d+j(%0d) y1=%0d+j(%0d) y2=%0d-j(%0d) y3=%0d-j(%0d)",$signed(y0r[16:9]),$signed(y0r[7:0]),$signed(y1r[16:9]),$signed(y1r[7:0]),$signed(y2r[16:9]),$signed(y2r[7:0]),$signed(y3r[16:9]),$signed(y3r[7:0]));
end
endmodule 

