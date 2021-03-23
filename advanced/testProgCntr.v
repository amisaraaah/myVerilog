module testProgCntr();
reg [15:0]PC;
reg BRANCH,RESET;
reg [7:0]OFFSET;
wire [15:0]NEXT_PC;

progCntr c (.PC(PC),.BRANCH(BRANCH),.RESET(RESET),.OFFSET(OFFSET),.NEXT_PC(NEXT_PC));
integer k;
integer l;
integer i;
initial
begin
OFFSET = 8'b11111111_11101110;
PC = 16'b00001000_11001111_10101100_01101100;
BRANCH = 1'b0;
RESET = 1'b0;
end
initial
begin
for(i=0;i<4;i=i+1)
#10 {BRANCH,RESET}=i;
end
initial
begin
$monitor($time,"PC = %d, OFFSET = %d, BRANCH = %d RESET = %d NEXT_PC = %d",PC,OFFSET,BRANCH,RESET,NEXT_PC);
end
initial
#200 $stop;
//initial
//begin
//for(k=65536;k>0;k=k-1)
//begin
//#5 PC = k;
//for(l=256;l>0;l=l-1)
//begin
//#5 OFFSET = l;
//end
//end
//end
endmodule
