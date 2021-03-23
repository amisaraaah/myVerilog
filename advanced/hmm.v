module hmm(clk,a,c);
input a,clk;
output c;
reg q1,b,c;
always @ (posedge clk)
begin
q1<=a;
b<=q1;
c<=b;
end
endmodule