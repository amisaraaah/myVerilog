module test_fsm_11_seqdetector();
reg clk,rst_n,w;
wire z;
reg [3:0] sequence;
integer k;
// Module Instantiation
fsm_11_seqdetector d2 (.clk(clk),.rst_n(rst_n),.w(w),.z(z));
// Initialization
initial
begin
clk = 1'b0;
rst_n = 1'b0;
#5 rst_n = 1'b1;
sequence = 4'b1011;
end
// Clock generation
always
begin
#5 clk =~ clk;
end
initial begin
#2 w = 1'b0; rst_n=1'b1; 
#10 w = 1'b0; #10 w = 1'b1; #10 w = 1'b0; 
#10 w = 1'b1; #10 w = 1'b1; #10 w = 1'b0; 
#10 w = 1'b1; #10 w = 1'b1; #10 w = 1'b0; 
#10 w = 1'b1; #10 w = 1'b1; 
#10 $stop;
end
// Logic Verification / Monitoring
initial
begin
    $monitor($time, "clk=%b,w = %b, z = %b" ,clk,w,z);
end
endmodule
