module tb_fmul ();

reg [31:0] num1;
wire [31:0] result;

fmul f1(result,num1);

initial 
begin
#5 num1=32'b01000010000101000000000000000000;
#5 num1=32'b11000001110110000000000000000000;


end

initial $monitor($time," %b",result);
endmodule
