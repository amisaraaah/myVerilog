module fsm_110_moore_seqdetector(clk,rst_n,data_in,out);
input clk,rst_n,data_in;
output reg out;

parameter S0 = 2'b00,S1 = 2'b01,S2 = 2'b10,S3 = 2'b11;

reg [1:0] state,next_state;

always @(posedge clk) begin
    if(!rst_n) state <= S0;
    else state <= next_state;
end
always @(state or data_in) begin
    case(state)
        S0: next_state = data_in ? S1:S0;
        S1: next_state = data_in ? S2:S0;
        S2: next_state = data_in ? S1:S3;
        S3: next_state = data_in ? S1:S0;
    endcase
end
always @(state) begin
    case (state)
        S0: out = 0;
        S1: out = 0;
        S2: out = 0;
        S3: out = 1; 
    endcase
end
endmodule
