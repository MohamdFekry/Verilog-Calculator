module division(input[3:0] a, b, c, d, output[6:0] out_divide1, out_divide2);

wire[7:0] out = (a + (c*10)) / (b + (d*10)); wire[7:0] out2;
wire[3:0] d1, d2;


assign d1 = out % 10;
assign out2 = out / 10;
assign d2 = out2 % 10;


BCD division1(d1, out_divide1);
BCD division2(d2, out_divide2);

endmodule