module mul_binary_6_6(a,b,c);
input [5:0] a,b; 
output wire [11:0] c;
wire [5:0] t0,t1,t2,t3,t4,t5;
wire [3:0] c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10;//1000 might come
wire [3:0] tc2,tc3,tc4,tc5,tc6,tc7,tc8;
wire [2:0] cy1,cy2,cy3,cy4,cy5,cy6,cy7,cy8,cy9;//100 might come

assign a = 6'b111111;
assign b = 6'b111111;

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

assign c0 = t0[0];

assign c1 = t0[1] + t1[0]; // possibility : 000 or 010
assign cy1 = c1[1]?3'b001:3'b000; // c1[1] == 0 or 1

//third column
convcomp32 a1(.s(c2),.p2(t0[2]),.p1(t1[1]),.p0(t2[0])); //possibility : 0100 or 011 or 010 or 001 or 000
assign tc2 = c2 + cy1;
assign cy2 = tc2[2]?(tc2[1] ? 3'b011 : 3'b010):(tc2[1] ? 3'b001 : 3'b000); //max carry : 010

//fourth column
convComp42v1 ab(.z0(t0[3]),.z1(t1[2]),.z2(t2[1]),.z3(t3[0]),.sum(c3)); //possibility : 0110 or 0101 or 0100 or 0011 or 0010 or 0001 or 0000
assign tc3 = c3 + cy2;
assign cy3 = tc3[2]?(tc3[1] ? 3'b011 : 3'b010):(tc3[1] ? 3'b001 : 3'b000); //max carry = 011

//fifth column
convcomp53 b1(.s(c4),.p4(t0[4]),.p3(t1[3]),.p2(t2[2]),.p1(t3[1]),.p0(t4[0]) );//possibility : 1000 or 0110 or 101 or 100 or 011 or 010 or 001 or 000
assign tc4 = c4 + cy3;
assign cy4 = tc4[3]?(tc4[2] ? (tc4[1] ? 3'b111 : 3'b110):(tc4[1] ? 3'b101 : 3'b100)) : (tc4[2] ? (tc4[1] ? 3'b011 : 3'b010):(tc4[1] ? 3'b001 : 3'b000)) ; //max carry = 100

//sixth column
convcomp63 d(.s(c5),.p5(t0[5]),.p4(t1[4]),.p3(t2[3]),.p2(t3[2]),.p1(t4[1]),.p0(t5[0])); // possibility : 1010 or 1001 or 1000 or 0111 or 0110 or 0101 or 100 or 011 or 010 or 001 or 000
assign tc5 = c5 + cy4;
assign cy5 = tc5[3]?(tc5[2] ? (tc5[1] ? 3'b111 : 3'b110):(tc5[1] ? 3'b101 : 3'b100)) : (tc5[2] ? (tc5[1] ? 3'b011 : 3'b010):(tc5[1] ? 3'b001 : 3'b000)) ; //max carry = 101

//seventh column
convcomp53 b2(.s(c6),.p4(t1[5]),.p3(t2[4]),.p2(t3[3]),.p1(t4[2]),.p0(t5[1]) );//possibility : 1010 or 1001 or 1000 or 0110 or 101 or 100 or 011 or 010 or 001 or 000
assign tc6 = c6 + cy5;
assign cy6 = tc6[3]?(tc6[2] ? (tc6[1] ? 3'b111 : 3'b110):(tc6[1] ? 3'b101 : 3'b100)) : (tc6[2] ? (tc6[1] ? 3'b011 : 3'b010):(tc6[1] ? 3'b001 : 3'b000)) ; //max carry = 101

//eight column
convComp42v1 ac(.z0(t2[5]),.z1(t3[4]),.z2(t4[3]),.z3(t5[2]),.sum(c7)); //possibility : 1001 or 1000 or 0111 or 0110 or 0101 or 0100 or 0011 or 0010 or 0001 or 0000
assign tc7 = c7 + cy6;
assign cy7 = tc7[3]?(tc7[2] ? (tc7[1] ? 3'b111 : 3'b110):(tc7[1] ? 3'b101 : 3'b100)) : (tc7[2] ? (tc7[1] ? 3'b011 : 3'b010):(tc7[1] ? 3'b001 : 3'b000)) ; //max carry = 100

//ninth column
convcomp32 a9(.s(c8),.p2(t3[5]),.p1(t4[4]),.p0(t5[3]) ); //possibility : 0111 or 0110 or 0101 or 0100 or 011 or 010 or 001 or 000
assign tc8 = c8 + cy7;
assign cy8 = tc8[2]?(tc8[1] ? 3'b011 : 3'b010):(tc8[1] ? 3'b001 : 3'b000); //max carry : 011

//tenth column
assign c9 = t4[5] + t5[4]+ cy8; // possibility : 0101 or 0100 or 0011 or 0010 or 0001 or 0000
assign cy9 = c9[2]?(c9[1] ? 3'b011 : 3'b010):(c9[1] ? 3'b001 : 3'b000); //max carry : 010

//eleventh column
assign c10 = t5[5] + cy9; // poss : 0011 or 0010 or 0001 or 0000

assign c = {c10[1],c10[0],c9[0],tc8[0],tc7[0],tc6[0],tc5[0],tc4[0],tc3[0],tc2[0],c1[0],c0[0]};

initial
begin
$monitor("c = %b cy1 = %b cy2 = %b cy3 = %b cy4 = %b cy5 = %b cy6 = %b cy7 = %b cy8 = %b cy9 = %b c10 = %b c9 = %b c8 = %b c7 = %b c6 = %b c5 = %b c4 = %b c3 = %b c2 = %b c1 = %b c0 = %b t5 = %b t4 = %b t3 = %b t2 = %b t1 = %b t0 = %b",c,cy1,cy2,cy3,cy4,cy5,cy6,cy7,cy8,cy9,c10,c9,c8,c7,c6,c5,c4,c3,c2,c1,c0,t5,t4,t3,t2,t1,t0);
#100 $stop;
end
endmodule



