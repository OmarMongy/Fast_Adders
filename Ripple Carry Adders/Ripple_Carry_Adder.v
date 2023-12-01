module Ripple_Carry_Adder
 #(parameter N = 4)
 (
 input [N-1:0] Inp1, Inp2,
 input Cin,
 output [N-1:0] Result,
 output Cout
 );
 wire [N-1:0] inp1, inp2;
 wire cin;
 wire [N-1:0] sum;
 wire [N:0] c;
 wire cout; 
 assign c[0] = Cin;
  
 generate
     genvar k;
         for(k = 0; k < N; k = k + 1)
         begin : FA
              Full_Adder FA(
             .inp1(Inp1[k]),
             .inp2(Inp2[k]),
             .cin(c[k]),
             .cout(c[k+1]),
             .sum(sum[k])
             ); 
         end
 endgenerate
 
 assign Result = sum;
 assign Cout = c[N];
 endmodule
