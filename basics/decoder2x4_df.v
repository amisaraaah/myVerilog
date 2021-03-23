module decoder2x4_df(a,e,q);
input e;
input [1:0]a;
output wire [3:0]q;
assign q[0] = e&~a[1]&~a[0];
assign q[1] = e&~a[1]&a[0];
assign q[2] = e&a[1]&~a[0];
assign q[3] = e&a[1]&a[0];
endmodule
