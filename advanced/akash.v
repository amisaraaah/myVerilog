module akash (in, out);
input [7:0] in;
output [2:0] out;
reg [2:0] out;
always @(in)
begin
out = en(in);
end

function [2:0] en;
input [7:0] x;
reg [2:0] y;

begin
y[2]=x[4]|x[5]|x[6]|x[7];
y[1]=x[2]|x[3]|x[6]|x[7];
y[0]=x[1]|x[3]|x[5]|x[7];
en = {y[2],y[1],y[0]};
end
endfunction
endmodule
