module detect00or11 (w,z,clk,rst_n);
input rst_n,clk,w;
output reg z;
parameter s0=3'b000, s1=3'b001, s2=3'b010, s3=3'b011, s4=3'b100;
reg [2:0]ps,ns;
always @(posedge clk) begin
  if(!rst_n) ps<=s0;
  else ps<=ns;
end
always @(ps,w)
  case(ps)
	s0: begin
	  ns= w?s3:s1;
	  z= w?0:0;
	end
	s1: begin
	  ns= w?s3:s2;
	  z=w?0:1;
	end
	s2: begin
	  ns= w?s3:s2;
	  z=w?0:1;
	end
	s3: begin
	  ns= w?s4:s1;
	  z= w?1:0;
	end
	s4: begin
	  ns= w?s4:s1;
	  z= w?1:0;
	end
  endcase
endmodule
