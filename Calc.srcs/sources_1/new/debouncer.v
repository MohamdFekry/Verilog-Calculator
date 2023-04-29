module debouncer(clk, in, out);

input clk, in;
output out;

reg Q0, Q1, Q2;

always @(posedge clk) begin

Q0 <= in;
Q1 <= Q0;
Q2 <= Q1;

end

assign out = (Q0 & Q1 & Q2);

endmodule
