module mcomp32(p0,p1,p2,w0,w1);
input p0,p1,p2;
output wire w0,w1;
assign w0 = (p0|(p1&p2));
assign w1 = (p1|p2);
endmodule

