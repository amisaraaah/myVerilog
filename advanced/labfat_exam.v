module labfat_exam (clk,rst_n,req_0,req_1,gnt_0,gnt_1);

input clk,rst_n,req_0,req_1;
output reg gnt_0,gnt_1;

parameter S0=2'b00,S1=2'b01,S2=2'b10,S3=2'b11;

reg [2:0] state,next_state;

always @ (posedge clk) begin  // always block for sync f/f
  if (!rst_n) 
    state <= S0;
  else
    state <= next_state;
end

always @(state or req_0 or req_1) begin // always block for next_state logic
 case(state)
   S0: begin
        if (req_0 == 1'b1 && req_1 == 1'b0) 
            next_state = S1;
        else if (req_0 == 1'b0 && req_1 == 1'b1) 
            next_state= S2;
        else if (req_0 == 1'b1 && req_1 == 1'b1)
            next_state = S3;
        else
            next_state = S0;
   end
   S1: begin
        if (req_0 == 1'b1 && req_1 == 1'b0) 
            next_state = S1;
        else if (req_0 == 1'b0 && req_1 == 1'b1) 
            next_state= S2;
        else if (req_0 == 1'b1 && req_1 == 1'b1)
            next_state = S3;
        else
            next_state = S0;
   end
   S2 : begin 
        if (req_0 == 1'b1 && req_1 == 1'b0) 
            next_state = S1;
        else if (req_0 == 1'b0 && req_1 == 1'b1) 
            next_state= S2;
        else if (req_0 == 1'b1 && req_1 == 1'b1)
            next_state = S3;
        else
            next_state = S0;
   end
    S3: begin
        if (req_0 == 1'b1 && req_1 == 1'b0) 
            next_state = S1;
        else if (req_0 == 1'b0 && req_1 == 1'b1) 
            next_state= S2;
        else if (req_0 == 1'b1 && req_1 == 1'b1)
            next_state = S3;
        else
            next_state = S0;
    end
  endcase
end

always @ (*) begin  // always block for output logic
if (!rst_n) begin
  gnt_0 = 1'b0;
  gnt_1 = 1'b0;
end
else begin
  case(state)
    S0: begin
        gnt_0 = 1'b0;
        gnt_1 = 1'b0;
    end
   S1: begin
        gnt_0 = 1'b1;
        gnt_1 = 1'b0;
    end
   S2: begin
        gnt_0 = 1'b0;
        gnt_1 = 1'b1;
    end
   S3: begin
        gnt_0 = 1'b1;
        gnt_1 = 1'b0;
    end
  endcase
end // else end
end  // always end
endmodule
