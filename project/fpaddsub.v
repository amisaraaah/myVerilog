module fpaddsub(c,a,b);
input[31:0] a,b;//inputs
output reg [31:0] c;//output
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
always@(a or b)
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

c={sign_c,exp_c,mant_c[23:1]};
//$display("Sign=%b",sign_c);
//$display ("exponent=%b",exp_c);
//$display ("mantissa_c=%b",mant_c);
end

endmodule
