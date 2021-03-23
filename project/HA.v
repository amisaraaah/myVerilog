module HA(s,c,a,b);
input   a;
input   b;
output wire  s,c;
assign s = a^b;
assign c = a*b;
endmodule
