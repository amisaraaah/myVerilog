module encoder (in, out);
input [7:0] in;
output [2:0] out;
reg [2:0] out;
always @(in)
begin
en(in,out);
end
task en;
input [7:0] x;
reg [2:0] y;
output [2:0] en;
begin
y[2]=x[4]|x[5]|x[6]|x[7];
y[1]=x[2]|x[3]|x[6]|x[7];
y[0]=x[1]|x[3]|x[5]|x[7];
en= {y[2],y[1],y[0]};
end
endtask
endmodule
