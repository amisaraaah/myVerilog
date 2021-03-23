module convcomp53(s,p4,p3,p2,p1,p0);
output wire [3:0]s;
input p4,p3,p2,p1,p0;

assign s = (((p0&p1)&(p1|p3))+ ((p0&p1)|p2|p3)) + ((p0|p1) + (p2&p3&p4) + ((p2&p3)|p4) ) ;

endmodule

