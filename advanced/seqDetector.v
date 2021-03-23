module seqDetector(x,clk,rst,z); //detects overlapping 0110 
input x,clk,rst;
output reg z;
parameter S0=2'b00,S1=2'b01,S2=2'b10,S3=2'b11;
reg [1:0] ps,ns;
always @ (posedge clk) begin
	if(rst)
	  ps <= S0;
	else 
	  ps <= ns;
end
always @ (ps,x) begin
case(ps)
	S0: begin
	  z = 0;
	  ns = x ? S0 : S1;
	end
	S1: begin
	  z = 0;
	  ns = x ? S2 : S1;
	end
	S2: begin
	  z = 0;
	  ns = x ? S3 : S1;
	end
	S3: begin
	  z = x ? 0 : 1;
	  ns = x ? S0 : S1;
	end
endcase
end
endmodule
