module multiplication(input[3:0] a, b, c, d, output[6:0] out_multiply1, out_multiply2, out_multiply3, out_multiply4);

wire[13:0] out = (a + (c*10)) * (b + (d*10)); wire[13:0] out2, out3, out4;
wire[3:0] d1, d2, d3, d4;


assign d1 = out % 10;
assign out2 = out / 10;
assign d2 = out2 % 10;
assign out3 = out2 / 10;
assign d3 = out3 % 10;
assign out4 = out3 / 10;
assign d4 = out4 % 10;

BCD multiplying1(d1, out_multiply1);
BCD multiplying2(d2, out_multiply2);
BCD multiplying3(d3, out_multiply3);
BCD multiplying4(d4, out_multiply4);

endmodule