module ha_hs_testbench();
reg A,B;
wire SUM,CARR,DIFF,BORR;
half_adder ha1(.a(A),.b(B),.s(SUM),.c(CARR));
half_subtr hs1(.x(A),.y(B),.d(DIFF),.b(BORR));
initial
begin
A=1'b0;
B=1'b0;
#100;
A=1'b0;
B=1'b1;
#100;
A=1'b1;
B=1'b0;
#100;
A=1'b1;
B=1'b1;
end 
endmodule
