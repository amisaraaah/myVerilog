
module tb_stage2();
reg [31:0] p,b,d,r,t,f,h,v;
wire [31:0] x0r,x0i,x1r,x1i,x2r,x2i,x3r,x3i,x4r,x4i,x5r,x5i,x6r,x6i,x7r,x7i;

stage2 s2(x0r,x0i,x1r,x1i,x2r,x2i,x3r,x3i,x4r,x4i,x5r,x5i,x6r,x6i,x7r,x7i,p,b,d,r,t,f,h,v);

initial
begin
p=3;
b=4;
d=23;
r=18;
t=5;
f=2;
h=12;
v=13;

$monitor("y0r=%b y0i=%b \n y1r=%b y1i=%b \n y2r=%b y2i=%b \n y3r=%b y3i=%b\n y4r=%b y4i=%b \n y5r=%b y5i=%b \n y6r=%b y6i=%b \n y7r=%b y7i=%b\n ",x0r,x0i,x1r,x1i,x2r,x2i,x3r,x3i,x4r,x4i,x5r,x5i,x6r,x6i,x7r,x7i);

//$monitor("y4r=%b y4i=%b",y4r,y4i);
//$monitor("y5r=%b y5i=%b",y5r,y5i);
//$monitor("y6r=%b y6i=%b",y6r,y6i);
//$monitor("y7r=%b y7i=%b",y7r,y7i);

end
endmodule
