module testMux4x1();
wire Y;
reg I3,I2,I1,I0;
reg S0, S1;
//mux4x1 mux4x1(.y(Y),.i3(I3),.i2(I2),.i1(I1),.i0(I0),.s0(S0),.s1(S1));
mux4x1_df mux4x1_df(.y(Y),.i3(I3),.i2(I2),.i1(I1),.i0(I0),.s0(S0),.s1(S1));
integer k;
initial
begin
{I3,I2,I1,I0}=4'b1101;
{S1,S0}=2'b0;
end
initial 
begin
for(k=0;k<4;k=k+1)
begin
#50 {S1, S0} = k;
end
end
initial
begin
$display("Input i3 i2 i1 i0 %b%b%b%b",I3,I2,I1,I0);
$monitor($time, " s1s0 = %b%b output = %b",S1,S0,Y);
end
endmodule
