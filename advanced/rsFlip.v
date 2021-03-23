module rsFlip(clk,r,s,q,qbar);
input clk,r,s;
output reg q;
output wire qbar;
assign qbar = ~q;
always @ (negedge clk) begin
     case ({r,s})
         2'b00 : q <= q;
         2'b01 : q <= 1'b1;
         2'b10 : q <= 1'b0;
         default : q <= 1'bx;
     endcase
end
endmodule
