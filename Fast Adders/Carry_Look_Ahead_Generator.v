module Carry_Look_Ahead_Generator
#(parameter N = 4)
(
input [N-1:0] inp1, inp2,
input Cin,
output [N:0] Cout 
);

wire [N-1:0] P;
wire [N-1:0] G;

assign P = (inp1 ^ inp2);
assign G = inp1 & inp2;
assign Cout[0] = Cin;

generate 
    genvar k;
        for(k = 0; k < N ; k = k +1)
        begin 
        assign Cout[k+1] = G[k] | (P[k] & Cout[k]);
        end
endgenerate

endmodule
