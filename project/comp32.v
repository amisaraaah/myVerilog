module comp32(p0,p1,p2,sapp);
input p0,p1,p2;
output wire [2:0]sapp;
assign sapp = (p0|(p1&p2))+(p1|p2);
endmodule
