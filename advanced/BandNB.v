module BandNB();
reg a;
reg b;
//blocking statement
initial begin
#4 a=1'b0;
#4 a=1'bz;
#4 a=1'b1;
#4 a=1'b0;
#4 a=1'b1;
end
//non blocking statement
initial begin
b<= #4 1'b0;
b<= #8 1'bz;
b<= #12 1'b1;
b<= #16 1'b0;
b<= #20 1'b1;
end
endmodule
