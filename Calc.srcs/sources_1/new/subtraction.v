module subtraction(input[3:0] a, b, c, d, output[6:0] out_subtract1, out_subtract2, output reg[6:0] out_subtract3);

wire[7:0] num1 = a + (c*10), num2 = b + (d*10);
reg[7:0] out ,out2, out3;
reg[3:0] d1, d2, d3;

always @(*) begin

if(num2 > num1) begin
out = num2 - num1;
d1 = out % 10;
out2 = out / 10;
d2 = out2 % 10;
out_subtract3 <= 7'b1111_110;
end

else begin
out = num1 - num2;
d1 = out % 10;
out2 = out / 10;
d2 = out2 % 10;
out_subtract3 <= 7'b1111_111;
end
end

BCD subtracting1(d1, out_subtract1);
BCD subtracting2(d2, out_subtract2);

endmodule