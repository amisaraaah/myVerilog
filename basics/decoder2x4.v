module decoder2x4(a,e,q);
input e;
input [1:0]a;
output wire [3:0]q;
wire [1:0]na;
not mynot [1:0](na,a);
and(q[0],e,na[1],na[0]);
and(q[1],e,na[1],a[0]);
and(q[2],e,a[1],na[0]);
and(q[3],e,a[1],a[0]);
endmodule
