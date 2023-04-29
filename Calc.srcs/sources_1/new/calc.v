module calc(input U1, U2, T1, T2, plus, minus, multiply, divide, original, clk, rst, output reg[6:0] out, output reg [3:0] leds, output reg dot);

wire synchro_U1out, synchro_U2out, synchro_T1out, synchro_T2out, debounce_U1out, debounce_U2out, debounce_T1out, debounce_T2out,
     newU1, newU2, newT1, newT2,
     clk_out;
     
wire [2:0] count;

wire [6:0] o1, o2, o3, o4;
reg [3:0] active;

clockDivider #(50000) newClock (clk, rst, clk_out);

synchron synchro_U1 (clk, U1, synchro_U1out);
synchron synchro_U2 (clk, U2, synchro_U2out);
synchron synchro_T1 (clk, T1, synchro_T1out);
synchron synchro_T2 (clk, T2, synchro_T2out);

debouncer debounce_U1 (clk, synchro_U1out, debounce_U1out);
debouncer debounce_U2 (clk, synchro_U2out, debounce_U2out);
debouncer debounce_T1 (clk, synchro_T1out, debounce_T1out);
debouncer debounce_T2 (clk, synchro_T2out, debounce_T2out);

edgedec edgU1 (clk, rst, debounce_U1out, newU1);
edgedec edgU2 (clk, rst, debounce_U2out, newU2);
edgedec edgT1 (clk, rst, debounce_T1out, newT1);
edgedec edgT2 (clk, rst, debounce_T2out, newT2);

counter c (clk_out, rst, count);

reg [3:0] A=0,B=0,C=0,D=0;

BCD b1(A, o1);
BCD b3(B, o3);
BCD b2(C, o2); 
BCD b4(D, o4);

always @(posedge clk or posedge rst) begin
if (rst) begin
A<=0; B<=0; C<=0; D<=0;
end

else begin
     if(newU1)
        if(A == 9)
            A <= 0;
        else
            A<=A+1;
     else if(newU2)
        if(B == 9)
            B <= 0;
        else
            B<=B+1;
     else if(newT1)
        if(C == 9)
            C <= 0;
        else
            C<=C+1;    
     else if (newT2)
        if(D == 9)
            D <= 0;
        else
            D<=D+1;
     else begin
        A<=A; B<=B; C<=C; D<=D;      
     end
end
end

wire[6:0] out_add1, out_add2, out_add3;
addition adding(A, B, C, D, out_add1, out_add2, out_add3);
wire[6:0] out_subtract1, out_subtract2, out_subtract3;
subtraction subtracting(A, B, C, D, out_subtract1, out_subtract2, out_subtract3);
wire[6:0] out_multiply1, out_multiply2, out_multiply3, out_multiply4;
multiplication multiplying(A, B, C, D, out_multiply1, out_multiply2, out_multiply3, out_multiply4);
wire[6:0] out_divide1, out_divide2;
division dividing(A, B, C, D, out_divide1, out_divide2);

always @(posedge clk or posedge rst)
begin
if (rst == 1)begin
out <= 7'b0000_001; leds <= 4'b0000; dot <= 1;
end

else begin

if (original) begin
if(count == 0) begin
        out <= o1;
        dot <= 0;
        leds <= 4'b1011;
    end
else if(count == 1) begin
        out <= o2;
        dot <= 1;
        leds <= 4'b0111;
        end
else if(count == 2) begin
        out <= o3;
        dot <= 1;
        leds <= 4'b1110;
        end
else begin
        out <= o4;
        dot <= 1;
        leds <= 4'b1101;
        end
end    

else if (plus) begin
if(count == 0) begin
        out <= out_add1;
        dot <= 1;
        leds <= 4'b1110;
    end
else if(count == 1) begin
        out <= out_add2;
        dot <= 1;
        leds <= 4'b1101;
        end
else if(count == 2) begin
        out <= out_add3;
        dot <= 1;
        leds <= 4'b1011;
        end
else begin
        out <= 7'b1111111;
        dot <= 1;
        leds <= 4'b0111;
        end
end

else if (minus) begin
if(count == 0) begin
        out <= out_subtract1;
        dot <= 1;
        leds <= 4'b1110;
    end
else if(count == 1) begin
        out <= out_subtract2;
        dot <= 1;
        leds <= 4'b1101;
        end
else if(count == 2) begin
        out <= out_subtract3;
        dot <= 1;
        leds <= 4'b1011;
        end
else begin
        out <= 7'b1111111;
        dot <= 1;
        leds <= 4'b0111;
        end
end

else if (multiply) begin
if(count == 0) begin
        out <= out_multiply1;
        dot <= 1;
        leds <= 4'b1110;
    end
else if(count == 1) begin
        out <= out_multiply2;
        dot <= 1;
        leds <= 4'b1101;
        end
else if(count == 2) begin
        out <= out_multiply3;
        dot <= 1;
        leds <= 4'b1011;
        end
else begin
        out <= out_multiply4;
        dot <= 1;
        leds <= 4'b0111;
        end
end

else if (divide) begin
if(count == 0) begin
        out <= out_divide1;
        dot <= 1;
        leds <= 4'b1110;
    end
else if(count == 1) begin
        out <= out_divide2;
        dot <= 1;
        leds <= 4'b1101;
        end
else if(count == 2) begin
        out <= 7'b1111111;
        dot <= 1;
        leds <= 4'b1011;
        end
else begin
        out <= 7'b1111111;
        dot <= 1;
        leds <= 4'b0111;
        end
end

else begin
if(count == 0) begin
        out <= o1;
        dot <= 0;
        leds <= 4'b1011;
    end
else if(count == 1) begin
        out <= o2;
        dot <= 1;
        leds <= 4'b0111;
        end
else if(count == 2) begin
        out <= o3;
        dot <= 1;
        leds <= 4'b1110;
        end
else begin
        out <= o4;
        dot <= 1;
        leds <= 4'b1101;
        end
end    
end
end
endmodule