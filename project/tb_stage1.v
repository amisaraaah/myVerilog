module tb_stage1();

reg [31:0] x0,x4,x2,x6;
wire [31:0] y0r,y1r,y2r,y3r,y0i,y1i,y2i,y3i;

stage1 s1(x0,x4,x2,x6, y0r,y0i,y1r,y1i,y2r,y2i,y3r,y3i);

initial 
begin
x0=32'b01000000111000000000000000000000;
x4=32'b01000001010100000000000000000000;
x2=32'b01000001001100000000000000000000;
x6=32'b01000001011100000000000000000000;
end

initial $monitor ("y0r=%b,y0i=%b,\ny1r=%b,y1i=%b,\ny2r=%b,y2i=%b,\ny3r=%b,y3i=%b\n",y0r,y0i,y1r,y1i,y2r,y2i,y3r,y3i);

endmodule
