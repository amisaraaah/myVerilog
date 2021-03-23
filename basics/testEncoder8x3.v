module testEncoder8x3();
reg [7:0]d;
wire [2:0]y;
//encoder8x3 en1 (.d(d),.y(y));
encoder8x3_df en2 (.d(d),.y(y));
integer info;
initial 
begin
info = $fopen("logfile.txt");
end
initial 
begin
#10 d = 8'b0000_0001;
#10 d = 8'b0000_0010;
#10 d = 8'b0000_0100;
#10 d = 8'b0000_1000;
#10 d = 8'b0001_0000;
#10 d = 8'b0010_0000;
#10 d = 8'b0100_0000;
#10 d = 8'b1000_0000;
end
initial
begin
$fmonitor (info,$time, " input: %b  - output: %b",d,y );
$fclose(info);
#500 $stop;
end
endmodule

