module progCntr(PC,BRANCH,RESET,OFFSET,NEXT_PC);
input [15:0]PC;
input BRANCH,RESET;
input [7:0]OFFSET;
output wire [15:0]NEXT_PC;
wire [15:0]w0,w1,w2;
assign w0=PC+OFFSET;
assign w1=PC+1'b1;
assign w2 = BRANCH ? w1 : w0;
assign NEXT_PC = RESET ? 16'b0 : w2;
endmodule

