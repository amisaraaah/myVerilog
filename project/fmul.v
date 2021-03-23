module fmul(result,num1);
input [31:0] num1;
reg [31:0] num2;
reg [47:0]temp;
reg sgn_out;
reg [7:0]exp_res;
reg [23:0]multiplier,multiplicand;
output reg [31:0] result;
integer i,a;
reg[5:0]count;

always@(num1)
begin
count=0;
temp=48'b0;
num2=32'b0_01111110_01101001111110111110100;//0.707
//num1=32'b0_10000100_00010000000000000000000;//67
//$display("num1=%b",num1);
//$display("num2=%b",num2);

//BINARY MULTIPLICATION OF MANTISSA
multiplier={1'b1,num1[22:0]};
multiplicand={1'b1,num2[22:0]};
//$display("multiplier=%b",multiplier);
//$display("multiplicand=%b",multiplicand);


for(i=0; i<24; i=i+1)
          if( multiplier[i] == 1'b1 ) temp = temp + ( multiplicand << i );
  
//$display("multiplier result %b",temp[47:22]);

if(temp[22]==1) temp={temp[47:23],1'b1,22'b0};
else temp={temp[47:23],1'b0,22'b0};
//$display("temp = %b",temp);

a=temp[47];

for(i=0; i< 24; i=i+1)
begin
case(a)
0:begin
temp=temp<<1;
//$display("shift1=%b",temp);
a=temp[47];
count=count+1;
//$display("a=%d",a);
//$display("count=%d",count);
end

1:begin
temp=temp<<1;
a=2;
if(count==0) count=2;
//$display("shift2=%b",temp);
//$display("a=%d",a);
end
default:a=2;
endcase
//$display("a=%b temp=%b",a,temp);
end



//$display("i=%d",i);
//$display("temp=%d",i);

//EXPONENT ADDITION:
//$display("exp1=%d",num1[30:23]);
//$display("exp2=%d",num2[30:23]);

 exp_res=num1[30:23]+num2[30:23]-127+count-1;
//$display("Exponent=%b",exp_res);

//signbit calculation:
sgn_out=num1[31]^num2[31];
result={sgn_out,exp_res,temp[47:25]} ;   
//$display("$result=%b",result);

end

endmodule
