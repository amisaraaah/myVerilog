module seven_seq_display(seconds_p1,seconds_p2,minutes_p1,minutes_p2,hours_p1,hours_p2,
seven_sec_p1,seven_sec_p2,seven_min_p1,seven_min_p2,seven_hr_p1,seven_hr_p2);
input [2:0] seconds_p1;
input [3:0] seconds_p2;
input [2:0] minutes_p1;
input [3:0] minutes_p2;
input [1:0] hours_p1 ;
input [3:0] hours_p2;
output reg [6:0] seven_sec_p1,seven_sec_p2,seven_min_p1,seven_min_p2,seven_hr_p1,seven_hr_p2;
always @ (*)
begin
case (seconds_p1)
3'b000 : seven_sec_p1 = 7'b0000001 ;
3'b001 : seven_sec_p1 = 7'b1001111 ;
3'b010 : seven_sec_p1 = 7'b0010010 ;
3'b011 : seven_sec_p1 = 7'b0000110 ;
3'b100 : seven_sec_p1 = 7'b1001100 ;
3'b101 : seven_sec_p1 = 7'b0100100 ;
3'b110 : seven_sec_p1 = 7'b0100000 ;
3'b111 : seven_sec_p1 = 7'b0001111 ;
default : seven_sec_p1 = 7'b0000000 ;
endcase
end
always @ (*)
begin
case (seconds_p2)
4'b0000 : seven_sec_p2 = 7'b0000001 ;
4'b0001 : seven_sec_p2 = 7'b1001111 ;
4'b0010 : seven_sec_p2 = 7'b0010010 ;
4'b0011 : seven_sec_p2 = 7'b0000110 ;
4'b0100 : seven_sec_p2 = 7'b1001100 ;
4'b0101 : seven_sec_p2 = 7'b0100100 ;
4'b0110 : seven_sec_p2 = 7'b0100000 ;
4'b0111 : seven_sec_p2 = 7'b0001111 ;
4'b1000 : seven_sec_p2 = 7'b0000000 ;
4'b1001 : seven_sec_p2 = 7'b0000100 ;
default : seven_sec_p2 = 7'b0000000 ;
endcase
end
always @ (*)
begin
case (minutes_p1)
3'b000 : seven_min_p1 = 7'b0000001 ;
3'b001 : seven_min_p1 = 7'b1001111 ;
3'b010 : seven_min_p1 = 7'b0010010 ;
3'b011 : seven_min_p1 = 7'b0000110 ;
3'b100 : seven_min_p1 = 7'b1001100 ;
3'b101 : seven_min_p1 = 7'b0100100 ;
3'b110 : seven_min_p1 = 7'b0100000 ;
3'b111 : seven_min_p1 = 7'b0001111 ;
default : seven_min_p1 = 7'b0000000 ;
endcase
end
always @ (*)
begin
case(minutes_p2)
4'b0000 : seven_min_p2 = 7'b0000001 ;
4'b0001 : seven_min_p2 = 7'b1001111 ;
4'b0010 : seven_min_p2 = 7'b0010010 ;
4'b0011 : seven_min_p2 = 7'b0000110 ;
4'b0100 : seven_min_p2 = 7'b1001100 ;
4'b0101 : seven_min_p2 = 7'b0100100 ;
4'b0110 : seven_min_p2 = 7'b0100000 ;
4'b0111 : seven_min_p2 = 7'b0001111 ;
4'b1000 : seven_min_p2 = 7'b0000000 ;
4'b1001 : seven_min_p2 = 7'b0000100 ;
default : seven_min_p2 = 7'b0000000 ;
endcase
end
always @ (*)
begin
case (hours_p1)
2'b00 : seven_hr_p1 = 7'b0000001 ;
2'b01 : seven_hr_p1 = 7'b1001111 ;
2'b10 : seven_hr_p1 = 7'b0010010 ;
2'b11 : seven_hr_p1 = 7'b0000110 ;
default : seven_hr_p1 = 7'b0000000 ;
endcase
end
always @ (*)
begin
case (hours_p2)
4'b0000 : seven_hr_p2 = 7'b0000001 ;
4'b0001 : seven_hr_p2 = 7'b1001111 ;
4'b0010 : seven_hr_p2 = 7'b0010010 ;
4'b0011 : seven_hr_p2 = 7'b0000110 ;
4'b0100 : seven_hr_p2 = 7'b1001100 ;
4'b0101 : seven_hr_p2 = 7'b0100100 ;
4'b0110 : seven_hr_p2 = 7'b0100000 ;
4'b0111 : seven_hr_p2 = 7'b0001111 ;
4'b1000 : seven_hr_p2 = 7'b0000000 ;
4'b1001 : seven_hr_p2 = 7'b0000100 ;
default : seven_hr_p2 = 7'b0000000 ;
endcase
end
endmodule
