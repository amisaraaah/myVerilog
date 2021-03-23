module testDecoder3x8();
reg [2:0]y;
wire [7:0]d;
//decoder3x8 dec1(.d(d),.y(y));
decoder3x8_df dec2(.d(d),.y(y));
integer k;
initial
begin
$monitor($time," input = %b   - output = %b",y,d);
for(k=0;k<8;k=k+1)
begin
#10 y = k;
end

end
endmodule
