module mealy_fsm(reset,clk,in_seq,out_seq);
input reset;
input clk;
input in_seq;
output out_seq;
reg out_seq;
reg in_seq_reg;
parameter SIZE = 2;
parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10;
reg [SIZE-1:0] state;
reg [SIZE-1:0] next_state; 
always @ (posedge clk)
begin : REG_INPUT
	if (reset == 1'b1)
	  in_seq_reg <= 1'b0;
	else
	  in_seq_reg <= in_seq;
end
always @ (state or in_seq_reg )
begin : FSM_COMBO
	next_state = 2'b00;
	if (reset == 1'b1)
	  out_seq <= 1'b0;
	else begin
	  case(state)
	   S0 : if (in_seq_reg == 1'b0) begin
		 next_state = S0;
		 out_seq <= 1'b0;
		end
		else begin
		  next_state = S1;
		  out_seq <= 1'b0;
		end
	   S1 : if (in_seq_reg == 1'b0) begin
		  next_state = S2;
		  out_seq <= 1'b0;
		end
		else begin
		  next_state = S1;
		  out_seq <= 1'b0;
		end
	   S2 : if (in_seq_reg == 1'b0) begin
		  next_state = S0;
		  out_seq <= 1'b0;
		end
		else begin
		  next_state = S1;
		  out_seq <= 1'b1;
		end
	   default : begin
		  next_state = S0;
		  out_seq <= 1'b0;
		end
	   endcase
	end //else end
end // end always
always @ (posedge clk)
begin : FSM_SEQ
	if (reset == 1'b1)
	  state <= S0;
	else
	  state <=  next_state;
end
endmodule
