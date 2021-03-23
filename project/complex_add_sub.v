module complex_add_sub(x0,x4,x2,x6, y0r ,y1r,y2r,y3r);
input signed[7:0] x0,x4,x2,x6;
output reg signed [16:0] y0r,y1r,y2r,y3r;
reg signed[7:0] A,B,C,D;
always @(x0,x4,x2,x6)
begin
A=x0+x4;
B=x0-x4;
C=x2+x6;
D=x2-x6;
/*8 bit real part,1 bit for deciding operation, 8 bit imag part*/
y0r={(A+C),1'b0,8'b0}; 
y1r={B,1'b0,D};
y2r={(A-C),1'b0,8'b0};
y3r={B,1'b1,D};
end
endmodule