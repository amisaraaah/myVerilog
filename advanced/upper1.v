module upper1(u_in1,u_in2,u_out1,u_out2);
input u_in1,u_in2;
output u_out1,u_out2;
lower1 U1 (.in1(u_in1),.in2(u_in2),.out1(u_out1));
endmodule

