module amiFat (clk,rst_n,A,B,N,R);
input clk,rst_n,A,B;
output reg N,R;
parameter X = 2'b00, Y = 2'b01, Z = 2'b10;
reg [2:0] state,next_state;
always @ (posedge clk) begin  // always block for sync f/f
  if (!rst_n) 
    state <= X;
  else
    state <= next_state;
end //end always
always @(state or A or B) begin // always block for next_state logic
 case(state)
   X: begin
        if (A == 1'b0) 
            next_state = Z;
        else
            next_state = Y;
   end
   Y: begin
        if (B == 1'b0) 
            next_state = Y;
        else
            next_state = 1;
   end
   Z : begin 
        if (A == 1'b0) 
            next_state = X;
        else
            next_state = Y;
   end
  endcase
end // end always
always @ (*) begin  // always block for output logic
if (!rst_n) begin
  N = 1'b0;
  R = 1'b0;
end
else begin
  case(state)
    X: begin
        if (A == 1'b0) begin
            N = 1'b0;
	    R = 1'b0;
	end
        else begin
            N = 1'b0;
	    R = 1'b1;
	end
    end
   Y: begin
        if (B == 1'b0) begin
            N = 1'b0;
	    R = 1'b1;
	end
        else begin
            N = 1'b1;
	    R = 1'b0;
	end
    end
   Z: begin
        if (A == 1'b0) begin
            N = 1'b1;
	    R = 1'b0;
	end
        else begin
            N = 1'b0;
	    R = 1'b1;
	end
    end
  endcase
end // else end
end  // always end
endmodule

