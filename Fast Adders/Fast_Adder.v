module Fast_Adder
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
assign inp1 = Inp1;
assign inp2 = Inp2;
 
Carry_Look_Ahead_Generator #(.N(N)) CLAG
(
.inp1(inp1),
.inp2(inp2),
.Cin(Cin),
.Cout(c)
);

generate
    genvar k;
        for(k = 0; k < N; k = k + 1)
        begin : FA
             Full_Adder FA(
            .inp1(inp1[k]),
            .inp2(inp2[k]),
            .cin(c[k]),
            .cout(),
            .sum(sum[k])
            ); 
        end
endgenerate

assign Cout = c[N]; 
assign Result = sum;

endmodule
