module mux4x1_testbench();
wire Y,Y_df;
reg I3,I2,I1,I0;
reg S0, S1;
mux4x1_df mux4x1(.y(Y),.i3(I3),.i2(I2),.i1(I1),.i0(I0),.s0(S0),.s1(S1));
mux4x1_df mux4x1_df(.y(Y_df),.i3(I3),.i2(I2),.i1(I1),.i0(I0),.s0(S0),.s1(S1));
initial
begin

I3=1'b0;
I2=1'b0;
I1=1'b0;
I0=1'b0;
S0=1'b0;
S1=1'b0;
#500 $stop;
end
always #160 S1=~S1;
always #80 S0=~S0;
always #40 I3=~I3;
always #20 I2=~I2;
always #10 I1=~I1;
always #5 I0=~I0; 
endmodule
