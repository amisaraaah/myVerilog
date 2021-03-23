`timescale 1ms/100us
module testFmul();
reg[31:0] num1;
wire[31:0] result;

fmul uut (.result(result),.num1(num1));

initial begin
$timeformat(-3,2,"ms",16);
// floating point representation of 5
num1 = 32'b0_10000001_01000000000000000000000;
// floating point representation of -45
#10 num1 = 32'b1_10000100_01101000000000000000000;
// floating point representation of 1.22
#10 num1 = 32'b0_01111111_00111000010100011110110;
// floating point representation of -0.32
#10 num1 = 32'b1_01111101_01000111101011100001010;
#200 $stop;
end
// results after floating point multiplication
// 5*0.707 = 3.535 (0_10000000_11000100011110101110001)
// -45*0.707 = -31.815 (1_10000011_11111101000010100011111)
// 1.22*0.707 = 0.86254007 (0_01111110_10111001100111101101101)
// -0.32*0.707 = -0.22624 (1_01111100_11001111010101101110101)
initial begin
$monitor ("%0t input \n sign = %b exponent = %b significant = 1.%b \noutput = input * 0.707 \n sign = %b exponent = %b significant = 1.%b \n",
		$time,num1[31],num1[30:23],num1[22:0],result[31],result[30:23],result[22:0]);
end
endmodule
