module fft8pt(p,q,r,s,t,u,v,w,x0,x1,x2,x3,x4,x5,x6,x7);
input signed [15:0] p,q,r,s,t,u,v,w;
output reg signed [15:0] x0,x1,x2,x3,x4,x5,x6,x7;
always @ (*) begin 
x0[15:8] <= p + t ;
x0[7:0] <= 8'b0;
x1[15:8] <= q + (0.707*u);
x1[7:0] <= u/0.707;
x2[15:8] <= r ;
x2[7:0] <= v;
x3[15:8] <= s - (0.707*w);
x3[7:0] <= w/0.707;
x4[15:8] <= p - r;
x4[7:0] <= 8'b0;
x5[15:8] <= p - (0.707*u);
x5[7:0] <= - u/0.707;
x6[15:8] <= r;
x6[7:0] <= -v;
x7[15:8] <= s + (0.707*w);
x7[7:0] <= - w/0.707;
end
endmodule
