module decoder2x4Beh(a,e,q);
input e;
input [1:0]a;
output reg [3:0]q;
integer int_a,i;
//always @(a) int_a = a;
always @* begin
   if(e) begin
      for(i=0;i<4;i=i+1) begin
	 if(a==i)begin
         //if(int_a==i)begin
            q[i] = 1'b1;
         end
         else q[i] = 1'b0;
      end
   end
   else 
     q=4'b0;
end
endmodule
