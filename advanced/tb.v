module tb;
reg [7:0]x;
wire [2:0]y;
//akash uut(x,y);
encoder uut(x,y);
initial
begin
x=8'b10000000;
#10 x=8'b01000000;
#10 x=8'b00100000;
#10 x=8'b00010000;
#10 x=8'b00001000;
#10 x=8'b00001000;
#10 x=8'b00000100;
#10 x=8'b00000010;
#10 x=8'b00000001;
end
initial
begin
$monitor ($time,"THE VALUE IS x=%b y=%b", x,y);
#400 $stop;
end
endmodule
