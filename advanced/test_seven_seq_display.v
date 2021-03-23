module seven_seq_display_tb ();
reg [2:0] seconds_p1;
reg [3:0] seconds_p2;
reg [2:0] minutes_p1;
reg [3:0] minutes_p2;
reg [1:0] hours_p1 ;
reg [3:0] hours_p2;
wire [6:0] seven_sec_p1,seven_sec_p2,seven_min_p1,seven_min_p2,seven_hr_p1,seven_hr_p2;
integer i ;
seven_seq_display DUT (seconds_p1,seconds_p2,minutes_p1,minutes_p2,hours_p1,hours_p2,seven_sec_p1,seven_sec_p2,seven_min_p1,seven_min_p2,seven_hr_p1,seven_hr_p2);
initial
begin
for( i=0;i<15;i=i+1)
begin
seconds_p1=i;
seconds_p2=i;
minutes_p1=i;
minutes_p2=i;
hours_p1=i;
hours_p2=i;
#5;
end
end
initial
#100 $stop;
endmodule
