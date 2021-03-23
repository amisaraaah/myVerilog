module convcomp32(s,p2,p1,p0);
output wire [2:0]s;
input p2,p1,p0;
wire w1,w2,w3,w4;
assign w1 = p0&p1&p2;
assign w2 = p1&p0;
assign w3 = w2|p2;
assign w4= p0|p1;
assign s = w1+w3+w4;
endmodule

