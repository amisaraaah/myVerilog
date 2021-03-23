module mul_binary(a,b,c);
input [3:0] a,b; 
output wire [7:0] c;
wire [3:0] t0,t1,t2,t3;
wire [2:0] c0,c1,c2,c3,c4,c5,c6;
wire [2:0] tc2,tc3,tc4,tc5;
wire [1:0] cy1,cy2,cy3,cy4,cy5;

//assign a = 4'b1111;
//assign b = 4'b1111;

assign t0[0] = a[0] * b[0];
assign t0[1] = a[1] * b[0];
assign t0[2] = a[2] * b[0];
assign t0[3] = a[3] * b[0];

assign t1[0] = a[0] * b[1];
assign t1[1] = a[1] * b[1];
assign t1[2] = a[2] * b[1];
assign t1[3] = a[3] * b[1];

assign t2[0] = a[0] * b[2];
assign t2[1] = a[1] * b[2];
assign t2[2] = a[2] * b[2];
assign t2[3] = a[3] * b[2];

assign t3[0] = a[0] * b[3];
assign t3[1] = a[1] * b[3];
assign t3[2] = a[2] * b[3];
assign t3[3] = a[3] * b[3];

assign c0 = t0[0];

assign c1 = t0[1] + t1[0]; // possibility : 000 or 010
assign cy1 = c1[1]?2'b01:2'b00; // c1[1] == 0 or 1

//third column
convcomp32 a1(.s(c2),.p2(t0[2]),.p1(t1[1]),.p0(t2[0])); //possibility : 100 or 011 or 010 or 001 or 000
assign tc2 = c2 + cy1;
assign cy2 = tc2[2]?(tc2[1] ? 2'b11 : 2'b10):(tc2[1] ? 2'b01 : 2'b00);

//fourth column
convComp42v1 ab(.z0(t0[3]),.z1(t1[2]),.z2(t2[1]),.z3(t3[0]),.sum(c3)); //possibility : 110 or 101 or 100 or 011 or 010 or 001 or 000
assign tc3 = c3 + cy2;
assign cy3 = tc3[2]?(tc3[1] ? 2'b11 : 2'b10):(tc3[1] ? 2'b01 : 2'b00);

//fifth column
convcomp32 b1(.s(c4),.p2(t1[3]),.p1(t2[2]),.p0(t3[1]));//possibility : 110 or 101 or 100 or 011 or 010 or 001 or 000
assign tc4 = c4 + cy3;
assign cy4 = tc4[2]?(tc4[1] ? 2'b11 : 2'b10):(tc4[1] ? 2'b01 : 2'b00);

//sixth column
assign c5 = t2[3] + t3[2]; // possibility : 101 or 100 or 011 or 010 or 001 or 000
assign tc5 = c5 + cy4;
assign cy5 = tc5[2]?(tc5[1] ? 2'b11 : 2'b10):(tc5[1] ? 2'b01 : 2'b00);

//seventh column
assign c6 = t3[3] + cy5; //possibility : 011 or 010 or 000

assign c = {c6,tc5[0],tc4[0],tc3[0],tc2[0],c1[0],c0[0]};

initial
begin
$monitor("c = %b cy1 = %b cy2 = %b cy3 = %b cy4 = %b cy5 = %b c6 = %b c5 = %b c4 = %b c3 = %b c2 = %b c1 = %b c0 = %b t3 = %b t2 = %b t1 = %b t0 = %b",c,cy1,cy2,cy3,cy4,cy5,c6,c5,c4,c3,c2,c1,c0,t3,t2,t1,t0);
#100 $stop;
end
endmodule

