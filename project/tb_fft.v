module tb_fft();
reg [31:0] x0,x1,x2,x3,x4,x5,x6,x7;
reg [2:0] s;
wire [31:0] real_out,img_out;
reg clk,rst;

fft f1(rst,s,x0,x1,x2,x3,x4,x5,x6,x7,real_out,img_out,clk);

always #5 clk=~clk;
initial
begin
clk=1'b0;
rst=1'b1;
x0=32'b01000000111000000000000000000000;//7
x4=32'b01000001010100000000000000000000;//13
x2=32'b01000001001100000000000000000000;//11
x6=32'b01000001011100000000000000000000;//15
x1=32'b01000000111000000000000000000000;//7
x5=32'b01000001010100000000000000000000;//13
x3=32'b01000001001100000000000000000000;//11
x7=32'b01000001011100000000000000000000;//15
end

initial 
begin
#10;
rst=1'b0;
#15;
s=3'b000;
#10;
s=3'b001;
#10;
s=3'b010;
#10;
s=3'b011;
#10;
s=3'b100;
#10;
s=3'b101;
#10;
s=3'b110;
#10;
s=3'b111;
end

initial $monitor("s=%b X%dr=%b X%di=%b",s,s,real_out,s,img_out);

endmodule
