module RGBLight(clk,light);
input clk;
output reg [2:0] light;
reg [1:0] state;
parameter RED = 3'b100, GREEN = 3'b010, BLUE = 3'b001;
parameter S0 = 0, S1 = 1, S2 = 2;
always @ (posedge clk)
case (state)
	S0: state <= S1;
	S1: state <= S2;
	S2: state <= S0;
	default: state <= S0;
endcase
always @ (state)
case (state)
	S0: light <= RED;
	S1: light <= GREEN;
	S2: light <= BLUE;
	default: light <= RED;
endcase
endmodule 
