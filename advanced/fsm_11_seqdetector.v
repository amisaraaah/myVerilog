module fsm_11_seqdetector(clk,rst_n,w,z);
input clk,rst_n,w;
output reg z;
parameter A = 2'b00;
parameter B = 2'b01;

reg [1:0] state,next_state;

always @(posedge clk)
begin 
  if(!rst_n)
  state <= A;
  else
  state <= next_state;
  end
  
always @(state or w)
begin
   case(state)
   A:next_state = w ? B:A;
   B:next_state = w ? B:A;
   default:next_state = A;
    endcase
end

always @(posedge clk)
begin
   if(!rst_n)
   z<=0;
   else
   begin
   case(state)
   A:z = w ? 0:0;
   B:z = w ? 0:1;
   default: z =0;
   endcase
   end
end
endmodule
