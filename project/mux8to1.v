module mux8to1(X0r,X0i,X1r,X1i,X2r,X2i,X3r,X3i,X4r,X4i,X5r,X5i,X6r,X6i,X7r,X7i,real_out,img_out,s,clk);
input clk;
input[2:0]s;
input [31:0] X0r,X0i,X1r,X1i,X2r,X2i,X3r,X3i,X4r,X4i,X5r,X5i,X6r,X6i,X7r,X7i;
reg [63:0]out;
output [31:0]real_out,img_out;


always@(posedge clk)
begin
case(s)
3'b000:out={X0r,X0i};
3'b001:out={X1r,X1i};
3'b010:out={X2r,X2i};
3'b011:out={X3r,X3i};
3'b100:out={X4r,X4i};
3'b101:out={X5r,X5i};
3'b110:out={X6r,X6i};
3'b111:out={X7r,X7i};
endcase
end
assign real_out=out[63:32];
assign img_out=out[31:0];

endmodule
