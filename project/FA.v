module FA(sout,cout,a,b,cin);
output sout,cout;
input a,b,cin;
assign sout =(a^b^cin);
assign cout = ((a&b)|(a&cin)|(b&cin));
endmodule
