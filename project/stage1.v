module stage1(x0,x4,x2,x6, y0r,y0i,y1r,y1i,y2r,y2i,y3r,y3i);

input [31:0] x0,x4,x2,x6;
output reg[31:0] y0r,y1r,y2r,y3r,y0i,y1i,y2i,y3i;
reg [31:0] A,B,C,D,x4bar,x6bar,Cbar,Dbar;

//always $monitor("%b",x0);
always@(x0 or x4 or x2 or x6) 
begin
//initial
//begin
//x0=32'b01000000111000000000000000000000;
//x4=32'b01000001010100000000000000000000;
//x2=32'b01000001001100000000000000000000;
//x6=32'b01000001011100000000000000000000;

x4bar=comp(x4); //c1(x4bar,x4);
//$display("x4bar=%b",x4bar);
x6bar=comp(x6);
//$display("x4bar=%b",x6bar);

A=fpaddsub(x0,x4); //A=x0+x4
//$display("A=%b",A);

B=fpaddsub(x0,x4bar);//B=x0-x4
//$display("B=%b",B);
C=fpaddsub (x2,x6);//C=x2+x6
//$display("C=%b",C);
D=fpaddsub (x2,x6bar);//D=x2-x6
//$display("D=%b",D);

Cbar=comp (C);
Dbar=comp (D);
y0r=fpaddsub(A,C);//Y0r=A+C;
y0i=0;//Y0i=0;
y1r=B; //y1r=B
y1i=Dbar;//y1i=-D
y2r=fpaddsub(A,Cbar);//yr2=A-C
//$display("y2r=%b",y2r);
y2i=0;//y2i=0
y3r=B;//y3r=B
y3i=D; //y3i=D
//temp=fmul(x0);
end
function [31:0]fmul;

input [31:0] num1;
reg [31:0] num2;
reg [47:0]temp;
reg sgn_out;
reg [7:0]exp_res;
reg [23:0]multiplier,multiplicand;
//output reg [31:0] result;
integer i,a;
reg[5:0]count;
begin:mul
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
fmul={sgn_out,exp_res,temp[47:25]} ;   
//$display("$result=%b",result);
end

endfunction

function [31:0]fpaddsub;

input[31:0] a,b;//inputs
reg [31:0] c;//output
reg [7:0] exp_a,exp_b;//exp of a and b
reg signed [7:0] exp_diff;//d
reg [7:0] exp_c;
reg [23:0] mant_a,mant_b;//mantissa of a and b
reg [23:0] mant_c; // 24 bits inorder to check underflow and overflow
reg sign_a,sign_b,sign_c,carry; //sign bits
integer i,count;
reg[1:0] z;
//step 1
//initialization 
begin:add
carry=0;
count=0;
c=32'b0;
//a=32'b11000001110100000000000000000000;//-26
//b=32'b01000001101000000000000000000000;//20


//$display("a=%b b=%b",a,b);

exp_a = a[30:23];
exp_b = b[30:23];

//$display("exp_a=%b exp_b=%b",exp_a,exp_b);
sign_a = a[31];
sign_b = b[31];
mant_a = {1'b1,a[22:0]};
mant_b = {1'b1,b[22:0]};

//$display("mant_a=%b mant_b=%b",mant_a,mant_b);


//step 2 checking diff
exp_diff =exp_a - exp_b;
//$display("exp_diff=%d",exp_diff);
	if(exp_diff <0)//'b' has a greater exp
	begin
//        $display("a<b");
        mant_a = mant_a >>(-1*exp_diff);
	exp_c = exp_b;
	 
//        $display("mant_a=%b",mant_a);
//        $display("sign_c=%b exp_c=%b",sign_c,exp_c);
        end
	else
	begin
//       $display("a>=b");
	mant_b = mant_b >> exp_diff; //Shifting smaller exponent b's mantissa by 'd'
	exp_c = exp_a;
	
//        $display("mant_b=%b",mant_b);
//       $display("sign_c=%b exp_c=%b",sign_c,exp_c);

        end

// performing operation based on sign bit

if(sign_a^sign_b)
begin

//$display("%b",sign_a^sign_b);
if(exp_diff>=0)
begin 
if(mant_a>mant_b)
begin mant_c=mant_a-mant_b;end 
else begin mant_c=mant_b-mant_a; end 
end

else 
begin
if(mant_a>mant_b)begin mant_c=mant_a-mant_b;end 
else begin mant_c=mant_b-mant_a; end 
end

//$display("substracted result c=%b",mant_c);

if(exp_diff>0) sign_c=sign_a;
else if(exp_diff==0) begin sign_c=(mant_a>mant_b)?sign_a:sign_b; end
else sign_c=sign_b;
end

else
begin
{carry,mant_c} = mant_a + mant_b;
if(carry==1) begin exp_c=exp_c+1;mant_c={carry,mant_c[23:1]}; end


if(exp_diff>0) sign_c=sign_a;
else if(exp_diff==0) begin sign_c=(mant_a>mant_b)?sign_a:sign_b; end
else sign_c=sign_b;

end

//$display("mant_a=%b",mant_a);
//$display("mant_b=%b",mant_b);
//$display("cary=%b",carry);
//$display("mant_c=%b",mant_c);

//normalization
//z=mant_c[24];

//if(z == 1'b1) //overflow
//begin
//mant_c = mant_c >> 1;
//exp_c = exp_c + 1'b1;
//end
//else 
//begin
//end
z=mant_c[23];
for(i=0; i< 24; i=i+1)
begin
case(z)
2'b00:begin
mant_c=mant_c<<1;
z=mant_c[23];
count=count+1;
end
2'b01:begin
mant_c=mant_c<<1;
z=2'b10;
count=count+1;
end
default:z=2'b10;
endcase
//$display("z=%b count=%d mant_c=%b",z,count,mant_c);
end
count=count-1;
exp_c=exp_c-count;

fpaddsub={sign_c,exp_c,mant_c[23:1]};
//$display("Sign=%b",sign_c);
//$display ("exponent=%b",exp_c);
//$display ("mantissa_c=%b",mant_c);
end
endfunction

function [31:0]comp;
input [31:0]c;
begin comp={~c[31],c[30:0]}; end
endfunction

endmodule
