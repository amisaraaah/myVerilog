module lower1(in1,in2,out1,out2);
input in1,in2;
output out1,out2;
assign out1 = in1&in2;
assign out2 = in1|in2;
endmodule
