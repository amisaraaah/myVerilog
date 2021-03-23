module approx_mult_6_6_two_step(a,b,c);
input [5:0] a,b; 
output wire [11:0] c;
wire [5:0] t0,t1,t2,t3,t4,t5;
wire [1:0]sum2,sum3;
wire [2:0]sum4,sum5;
wire sum0f,sum1f,sum2f,sum3f;
wire [1:0]sum4f,sum5f,sum6f,sum7f,sum8f,sum9f,sum10f;
wire cy4,cy5,cy6,cy7,cy8,cy9,cy10; //used for final reduction
wire [1:0]sum42,sum52;
wire sum61,sum62,cy61,cy62,sum71,sum72,cy71,cy72,sum81,sum82,cy81,cy82,sum92,cy92;

//test inputs
//assign a = 6'b000001;
//assign b = 6'b000111;

//PARTIAL PRODUCT GENERATION
assign t0[0] = a[0] * b[0];
assign t0[1] = a[1] * b[0];
assign t0[2] = a[2] * b[0];
assign t0[3] = a[3] * b[0];
assign t0[4] = a[4] * b[0];
assign t0[5] = a[5] * b[0];

assign t1[0] = a[0] * b[1];
assign t1[1] = a[1] * b[1];
assign t1[2] = a[2] * b[1];
assign t1[3] = a[3] * b[1];
assign t1[4] = a[4] * b[1];
assign t1[5] = a[5] * b[1];

assign t2[0] = a[0] * b[2];
assign t2[1] = a[1] * b[2];
assign t2[2] = a[2] * b[2];
assign t2[3] = a[3] * b[2];
assign t2[4] = a[4] * b[2];
assign t2[5] = a[5] * b[2];

assign t3[0] = a[0] * b[3];
assign t3[1] = a[1] * b[3];
assign t3[2] = a[2] * b[3];
assign t3[3] = a[3] * b[3];
assign t3[4] = a[4] * b[3];
assign t3[5] = a[5] * b[3];

assign t4[0] = a[0] * b[4];
assign t4[1] = a[1] * b[4];
assign t4[2] = a[2] * b[4];
assign t4[3] = a[3] * b[4];
assign t4[4] = a[4] * b[4];
assign t4[5] = a[5] * b[4];

assign t5[0] = a[0] * b[5];
assign t5[1] = a[1] * b[5];
assign t5[2] = a[2] * b[5];
assign t5[3] = a[3] * b[5];
assign t5[4] = a[4] * b[5];
assign t5[5] = a[5] * b[5];

//FIRST REDUCTION 
comp21 a1(.sapp(sum1f),.p0(t0[1]),.p1(t1[0]));
comp32 a2(.sapp(sum2),.p2(t0[2]),.p1(t1[1]),.p0(t2[0])); 
comp42 a3(.z0(t0[3]),.z1(t1[2]),.z2(t2[1]),.z3(t3[0]),.sapp(sum3));
comp53 a4(.sapp(sum4),.p4(t0[4]),.p3(t1[3]),.p2(t2[2]),.p1(t3[1]),.p0(t4[0]) );
comp63 a5(.sapp(sum5),.p5(t0[5]),.p4(t1[4]),.p3(t2[3]),.p2(t3[2]),.p1(t4[1]),.p0(t5[0])); 

FA f1(.sout(sum61),.cout(cy61),.a(t1[5]),.b(t2[4]),.cin(t3[3]) );
FA f2(.sout(sum71),.cout(cy71),.a(t2[5]),.b(t3[4]),.cin(t4[3]) );
FA f3(.sout(sum81),.cout(cy81),.a(t3[5]),.b(t4[4]),.cin(t5[3]) );


//SECOND REDUCTION
comp21 b1(.sapp(sum2f),.p0(sum2[1]),.p1(sum2[0]));
comp21 b2(.sapp(sum3f),.p0(sum3[1]),.p1(sum3[0]));
comp32 b3(.sapp(sum42),.p2(sum4[2]),.p1(sum4[1]),.p0(sum4[0]) ); 
comp32 b4(.sapp(sum52),.p2(sum5[2]),.p1(sum5[1]),.p0(sum5[0]) );
FA f4(.sout(sum62),.cout(cy62),.a(sum61),.b(t4[2]),.cin(t5[1]) ); //seventh column
FA f5(.sout(sum72),.cout(cy72),.a(sum71),.b(cy61),.cin(t5[2]) ); //eight
HA h6(.s(sum82),.c(cy82),.a(sum81),.b(cy71)); //ninth
FA f7(.sout(sum92),.cout(cy92),.a(cy81),.b(t4[5]),.cin(t5[4])); //tenth

//THIRD REDUCTION
assign sum0f = t0[0];
assign sum4f = sum42[1] + sum42[0]; 
assign cy4 = sum4f[1]?1'b1:1'b0; 

assign sum5f = sum52[1] + sum52[0] + cy4; // max value : 3
assign cy5 = sum5f[1]?1'b1:1'b0; 

assign sum6f = sum62 + cy5; // max value : 2 (1+1)
assign cy6 = sum6f[1]?1'b1:1'b0; 

assign sum7f = sum72 + cy62 + cy6; // max value : 3
assign cy7 = sum7f[1]?1'b1:1'b0; 

assign sum8f = sum82 + cy72 + cy7; // max value : 3
assign cy8 = sum8f[1]?1'b1:1'b0; 

assign sum9f = sum92 + cy82 + cy8; // max value : 3
assign cy9 = sum9f[1]?1'b1:1'b0; 

assign sum10f = t5[5] + cy92; 


assign c = {sum10f,sum9f[0],sum8f[0],sum7f[0],sum6f[0],sum5f[0],sum4f[0],sum3f,sum2f,sum1f,sum0f};

//testbench
//initial begin
//$monitor("c =%b c = %d sum10f = %b sum9f = %b sum8f = %b sum7f = %b sum5f = %b sum4f = %b sum3f = %b sum2f = %b sum1f = %b sum0f = %b sum2= %b sum3 = %b sum4 = %b sum5 = %b ",c,c,sum10f,sum9f,sum8f,sum7f,sum6f,sum5f,sum4f,sum3f,sum2f,sum1f,sum0f,sum2,sum3,sum4,sum5);
//#100 $stop;
//end 
endmodule
