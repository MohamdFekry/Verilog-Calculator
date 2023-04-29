module addition(input[3:0] a, b, c, d, output[6:0] out_add1, out_add2, out_add3);

wire[7:0] out = (a + (c*10)) + (b + (d*10)); wire[7:0] out2, out3;
wire[3:0] d1, d2, d3;


assign d1 = out % 10;
assign out2 = out / 10;
assign d2 = out2 % 10;
assign out3 = out2 / 10;
assign d3 = out3 % 10;

BCD adding1(d1, out_add1);
BCD adding2(d2, out_add2);
BCD adding3(d3, out_add3);

endmodule