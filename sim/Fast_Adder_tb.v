module Fast_Adder_tb();

parameter N = 10;
reg [N-1:0] Inp1, Inp2;
reg Cin;
wire [N-1:0] Result;
wire Cout;

Fast_Adder
#(.N(N))
uut(
.Inp1(Inp1),
.Inp2(Inp2),
.Cin(Cin),
.Result(Result),
.Cout(Cout)
);

initial
begin
Inp1 = 250;
Inp2 = 400;
Cin = 1'b0;

#100
Inp1 = 750;
Inp2 = 300;
Cin = 1'b0;

#100 
Inp1 = 250;
Inp2 = 400;
Cin = 1'b1;
#100
$stop; 
end

initial
begin
$monitor("%d + %d = %d",Inp1,Inp2,Result,$time);
end

endmodule
