module mux2x1_testbench();
wire Y,Y_df;
reg I1,I0;
reg S;
mux2x1 mux2x1(.y(Y),.i1(I1),.i0(I0),.s(S));
mux2x1_df mux2x1_df(.y(Y_df),.i1(I1),.i0(I0),.s(S));
initial
begin
I1=1'b0;
I0=1'b0;
S=1'b0;
#500 $stop;
end
initial
begin
$monitor($time,"i1 = %b i0 = %b s = %b ydf = %b y = %b",I1,I0,S,Y_df,Y);
end
always #20 S=~S;
always #10 I1=~I1;
always #5 I0=~I0; 
endmodule
