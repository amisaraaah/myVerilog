module labfat(clk,rst,req_0,req_1,gnt_0,gnt_1);
input clk,rst,req_0,req_1;
output reg gnt_0,gnt_1;
parameter s0=2'b00,s1=2'b01,s2=2'b10;
reg [1:0]ps,ns;
always @(posedge clk) begin
	if(!rst) ps<=s0;
	else ps<=ns;
end
always @(ps,req_0,req_1) begin
	ns=s0;
	gnt_0=1'b0;
	gnt_1=1'b0;
case(ps)
	s0: // State in reset
	if(req_0==1 && req_1==0) begin  // req_0 sets gnt_0
	 ns=s1;
	 gnt_0=1'b1;
	 gnt_1=1'b0;
	end
	else if(req_0==1 && req_1==1) begin  // both req sets gnt_0 cuz higher priority
	 ns=s1;
	 gnt_0=1'b1;
	 gnt_1=1'b0;
	end
	else if(req_0==0 && req_1==1) begin // req_1 sets gnt_1
	 ns=s2;
	 gnt_0=1'b0;
	 gnt_1=1'b1;
	end
	else begin // default reset
	 ns=s0;
	 gnt_0=1'b0;
	 gnt_1=1'b0;
	end
	s1:  // state in gnt_0
	if(req_0==0 && req_1==1) begin  // same logic
	 ns=s2;
	 gnt_0=1'b0;
	 gnt_1=1'b1;
	end
	else if(req_0==1 && req_1==1) begin // same logic
	 ns=s1;
	 gnt_0=1'b1;
	 gnt_1=1'b0;
	end
	else if(req_0==1&& req_1==0) begin //same logic
	 ns=s1;
	 gnt_0=1'b1;
	 gnt_1=1'b0;
	end
	else begin  // reset
	 ns=s0;
	 gnt_0=1'b0;
	 gnt_1=1'b0;
	end
	s2:  // state in gnt_1
	if(req_0==1 && req_1==0) begin  //same logic
	 ns=s1;
	 gnt_0=1'b1;
	 gnt_1=1'b0;
	end
	else if(req_0==1 && req_1==1) begin  //same logic
	 ns=s1;
	 gnt_0=1'b1;
	 gnt_1=1'b0;
	end
	else if(req_0==0&& req_1==1) begin  // same logic
	 ns=s2;
	 gnt_0=1'b1;
	 gnt_1=1'b0;
	end
	else begin //reset
	 ns=s0;
	 gnt_0=1'b0;
	 gnt_1=1'b0;
	end
	endcase
end //end always block
endmodule
