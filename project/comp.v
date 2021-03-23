module comp (y,i);
input [31:0]i;
output [31:0]y;
wire temp;
assign temp=~i[31];
assign y[31:0]={temp,i[30:0]};
endmodule