module testDemux1x4();
reg i;
reg [1:0]s;
wire [3:0]y;
//demux1x4 demux1 (.i(i),.s(s),.y(y));
demux1x4_df demux2 (.i(i),.s(s),.y(y));
integer k;
initial 
begin
i = 1'b1;
//$display("\t\tinput = %b",i);
//$monitor($time," selectline = %b  - output = %b",s,y);
for(k=0;k<4;k=k+1)
begin
#10 s = k;
end
end
initial
#35 $strobe ($time," The input is '%b', select line is '%b' y3 = %b y2 = %b y1 = %b y0 = %b",i,s,y[3],y[2],y[1],y[0]);
endmodule
