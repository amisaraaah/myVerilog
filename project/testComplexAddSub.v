module testComplexAddSub();
reg signed [15:0] x,y;
reg ctrl;
wire signed[15:0] out;
complexAddSub uut (.x(x),.y(y),.ctrl(ctrl),.out(out));
initial begin
    x[15:8] <= 4;
    x[7:0] <= 2;
    y[15:8] <= 3;
    y[7:0] <= 6;
end
initial begin
  ctrl = 1'b1;
  #50 ctrl = 1'b0;
  #100 $stop;
end
initial
$monitor ($time, " x= %0d %0di y= %0d %0di sum/diff ctrl = %b , result = %0d %0di ",
	$signed(x[15:8]),$signed(x[7:0]),$signed(y[15:8]),$signed(y[7:0]),ctrl,$signed(out[15:8]),$signed(out[7:0]));
endmodule
