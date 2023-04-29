module edgedec(clk, rst, level, tick);

input clk, rst, level;
output tick;
reg [1:0] state, nextstate;

parameter [1:0] zero=2'b00, edg_tick=2'b01, one=2'b10; // States Encoding



// Next state generation
always @ (level or state)
    case (state)
        zero    : if (level) nextstate = edg_tick;
           else nextstate = zero;
        edg_tick: if (level) nextstate = one;
           else nextstate = zero;
        one     : if (level) nextstate = one;
           else nextstate = zero;
    endcase

// Update state FF's with the triggering edge of the clock
always @ (posedge clk or posedge rst) begin
if(rst)
state <= zero;
else
state <= nextstate;
end

assign tick = (state == edg_tick); // output generation //Moore

endmodule