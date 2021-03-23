module testDemux1x8();
reg i;
reg [2:0]s;
wire [7:0]y;
//demux1x8 demux1 (.i(i),.s(s),.y(y));
demux1x8_df demux2 (.i(i),.s(s),.y(y));
integer k;
initial 
begin
i = 1'b1;
for(k=0;k<8;k=k+1)
begin
#10 s = k;
end
end
initial
begin
$display ("The input is '%b'\n",i);
$display ("y[7] y[6] y[5] y[4] y[3] y[2] y[1] y[0]\n");
$monitor ($time," select line is '%b' %b%b%b%b%b%b%b%b",s,y[7],y[6],y[5],y[4],y[3],y[2],y[1],y[0]);
end
initial
begin
#30 $monitoroff;
#20 $monitoron;
end
endmodule

