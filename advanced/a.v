module ripple (A,B,cin, cout, sum); 
input [7:0] A,B; 
input cin; 
output reg cout; 
output reg [7:0] sum; 
reg [8:0] c;
integer i; 
always @(*) begin 
c[0] = cin; 
for( i =0 ; i<8; i = i +1) 
onebit_adder(A[i], B[i] , c[i],sum[i], c[ i+1]); 
cout = c[8]; 
end 
task onebit_adder; 
input A,B,C; 
output s , cout; 
begin 
{cout,s} = A+B+C; 
end 
endtask 
endmodule
