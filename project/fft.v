module fft(rst,s,x0,x1,x2,x3,x4,x5,x6,x7,real_out,img_out,clk);
input rst;
reg [31:0] q[7:0];
input [31:0] x0,x1,x2,x3,x4,x5,x6,x7;
input [2:0] s;
input clk;
output[31:0] real_out,img_out;
wire [31:0] ins[7:0];

wire [31:0] X0r,X0i,X1r,X1i,X2r,X2i,X3r,X3i,X4r,X4i,X5r,X5i,X6r,X6i,X7r,X7i;
wire [31:0] pr,pi,qr,qi,rr,ri,sr,si,tr,ti,ur,ui,vr,vi,wr,wi;
assign ins[0]=q[0],ins[1]=q[1],ins[2]=q[2],ins[3]=q[3],ins[4]=q[4],ins[5]=q[5],ins[6]=q[6],ins[7]=q[7];
stage1 s1(.x0(ins[0]),.x4(ins[4]),.x2(ins[2]),.x6(ins[6]),.y0r(pr),.y0i(pi),.y1r(qr),.y1i(qi),.y2r(rr),.y2i(ri),.y3r(sr),.y3i(si));
stage1 s2(.x0(ins[1]),.x4(ins[5]),.x2(ins[3]),.x6(ins[7]),.y0r(tr),.y0i(ti),.y1r(ur),.y1i(ui),.y2r(vr),.y2i(vi),.y3r(wr),.y3i(wi));
stage2 st2(X0r,X0i,X1r,X1i,X2r,X2i,X3r,X3i,X4r,X4i,X5r,X5i,X6r,X6i,X7r,X7i,pr,qr,qi,rr,si,tr,ur,ui,vr,wi);
mux8to1 m1(X0r,X0i,X1r,X1i,X2r,X2i,X3r,X3i,X4r,X4i,X5r,X5i,X6r,X6i,X7r,X7i,real_out,img_out,s,clk);
always @(posedge clk)
begin
if(rst) 
begin
q[0]<=32'b0;
q[1]<=32'b0;
q[2]<=32'b0;
q[3]<=32'b0;
q[4]<=32'b0;
q[5]<=32'b0;
q[6]<=32'b0;
q[7]<=32'b0;
end
else
begin
q[0]<=x0;
q[1]<=x1;
q[2]<=x2;
q[3]<=x3;
q[4]<=x4;
q[5]<=x5;
q[6]<=x6;
q[7]<=x7;
end
end
endmodule
