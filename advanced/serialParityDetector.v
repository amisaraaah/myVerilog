module serialParityDetector(clk,x,z); //output is 1 when odd 1's detected
input x,clk;
output reg z;
reg eoState;
parameter EVEN = 0, ODD = 1;
always @ (posedge clk)
  case (eoState) 
	EVEN: eoState <= x ? ODD : EVEN;
	ODD: eoState <= x ? EVEN : ODD;
	default: eoState <= EVEN;
  endcase
always @ (eoState)
  case (eoState)
	EVEN: z = 0;
	ODD: z = 1;
  endcase
endmodule
