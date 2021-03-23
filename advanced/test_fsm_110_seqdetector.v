module test_fsm_110_seqdetector();
reg clk,rst_n,data_in;
wire out;
// Module Instantiation
fsm_110_moore_seqdetector fsm_110_seqdetector_init (.clk(clk),.rst_n(rst_n),.data_in(data_in),.out(out));
// Initialization
initial begin
    clk = 1'b0;
    rst_n = 1'b0;
    #12;
    rst_n = 1'b1;
end
// Clock generation
always begin
    #5 clk = ~clk;
end
// Random input generation
always begin
    //input test
    #10 data_in = $random;
end
// Logic Verification / Monitoring
initial begin
    $monitor($time, "clk=%b,data_in = %b, out = %b" ,clk,data_in,out);
end
endmodule
