module fafs_testbench();
wire SUM,COUT;
reg A,B,CIN;
full_adder fa1(.a(A),.b(B),.cin(CIN),.sum(SUM),.cout(COUT));
initial
begin
A=1'b0;
B=1'b0;
CIN=1'b0;
end
always #20 CIN=~CIN;
always #10 B=~B;
always #5 A=~A; 
endmodule
