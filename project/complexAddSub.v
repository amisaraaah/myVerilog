module complexAddSub(x,y,ctrl,out);
input [15:0] x,y;
input ctrl;
output reg[15:0] out;
always @ (x,y,ctrl) begin
  if (ctrl) begin
      out = {(x[15:8]+y[15:8]),(x[7:0]+y[7:0])};
  end
  else begin
      out = {(x[15:8]-y[15:8]),(x[7:0]-y[7:0])};
  end
end
endmodule
