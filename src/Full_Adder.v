module Full_Adder(
input inp1, inp2, cin,
output sum, cout
);
assign sum = inp1 ^ inp2 ^ cin;
assign cout = (inp1&inp2) | (inp2&cin) | (inp1&cin); 

endmodule
