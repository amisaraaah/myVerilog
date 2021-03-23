module mcomp63(p0,p1,p2,p3,p4,p5,w2,w1,w0);
input p0,p1,p2,p3,p4,p5;
output wire w2,w1,w0;

assign w2 = (p0&p1)|p2|p3;
assign w1 = (p2&p3)|p4|p5;
assign w0 = (p4&p5)|p0|p1;
endmodule
