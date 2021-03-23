module fpaddsub_tst();
reg [31:0]a,b;
wire [31:0]c;

fpaddsub f1(.a(a),.b(b),.c(c));

initial 
begin
a=32'b11000010011100000000000000000000;
b=32'b01000010000011000000000000000000;
end

initial 
#100 $stop;

initial
$monitor($time,"a=%b b=%b c=%b ",a,b,c);

endmodule