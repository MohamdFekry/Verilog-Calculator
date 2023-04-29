module synchron(clk, in, out);

input clk, in;
output out;
reg Q, Q2;

always @(posedge clk) begin

Q <= in;
Q2 <= Q;

end

assign out = Q2;



endmodule
