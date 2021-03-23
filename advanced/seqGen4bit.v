module seqGen4bit (clk,rst_n,A,w,x,y,z);
input clk,A,rst_n;
output reg w,x,y,z;
parameter S0=0,S1=1,S2=2,S3=3,S4=4,S5=5,S6=6,S7=7;
parameter C0=4'b1000,C1=4'b1100,C2=4'b0100,C3=4'b0110,C4=4'b0010,C5=4'b0011,C6=4'b0001,C7=4'b1001;
reg [2:0] state, next_state;
always @ (posedge clk) begin  // always block for sync f/f
  if (!rst_n) 
    state <= A ? S7 : S0;
  else
    state <= next_state;
end //end always
always @ (A or state) begin
if(!A) begin // A = 0
 case(state) 
	 S0: next_state <= S1;
	 S1: next_state <= S2;
	 S2: next_state <= S3;
	 S3: next_state <= S4;
	 S4: next_state <= S5;
	 S5: next_state <= S6;
 	 S6: next_state <= S7;
	 S7: next_state <= S0;
	 default: next_state <= S0;
 endcase
end // end if
else begin // A = 1
 case(state) 
	 S0: next_state <= S7;
	 S1: next_state <= S0;
	 S2: next_state <= S1;
	 S3: next_state <= S2;
	 S5: next_state <= S3;
 	 S6: next_state <= S5;
	 S7: next_state <= S6;
	 default: next_state <= S7;
 endcase
end //end else
end //end of always block
// output logic
always @ (state) begin
	case(state) 
	 S0: {w,x,y,z} = C0;
	 S1: {w,x,y,z} = C1;
	 S2: {w,x,y,z} = C2;
	 S3: {w,x,y,z} = C3;
	 S4: {w,x,y,z} = C4;
	 S5: {w,x,y,z} = C5;
 	 S6: {w,x,y,z} = C6;
	 S7: {w,x,y,z} = C7;
	 default: begin
	 end
endcase
end
endmodule

