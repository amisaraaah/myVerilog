module stage2(x0r,x0i,x1r,x1i,x2r,x2i,x3r,x3i,x4r,x4i,x5r,x5i,x6r,x6i,x7r,x7i,p,b,dbar,r,d,t,f,hbar,v,h);

input [31:0] p,b,dbar,r,d,t,f,hbar,v,h;
output reg[31:0] x0r,x0i,x1r,x1i,x2r,x2i,x3r,x3i,x4r,x4i,x5r,x5i,x6r,x6i,x7r,x7i;
reg [31:0] temp1,temp2,temp3,temp4,temp5;

always@(*)
begin

temp1=fmul(f); //0.707F
temp2=comp(temp1);// -0.707F
temp3=fmul(h); //=0.707H
temp4=fmul(hbar); //= -0.707H

x0r=fpaddsub(p,t);
x0i=0;

temp5=fpaddsub(b,temp1); //B+0.7F
x1r=fpaddsub(temp5,temp4);//B+0.7F+07.Hbar
temp5=fpaddsub(dbar,temp2);//Dbar-0.7F 
x1i=fpaddsub(temp5,temp4);//Dbar-0.7F+0.7Hbar

x2r=r; //r
x2i=comp(v); //-v

temp5=fpaddsub(b,temp2);//B-0.707f
x3r=fpaddsub(temp5,temp3);//B-0.707f+0.707H
temp5=fpaddsub(d,temp2);// d-0.707f
x3i=fpaddsub(temp5,temp3);//d-0.707f+0.707h

temp5=comp(t);
x4r=fpaddsub(p,t);
x4i=0;

x5r=x3r;
x5i=comp(x3i);

x6r=x2r;
x6i=comp(x2i);

x7r=x1r;
x7i=comp(x1i);
end

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



endmodule
