module counter (input clk, reset, output reg [2:0] count );

    always @(posedge clk, posedge reset) begin
        if(reset == 1 || count == 3)
            count <= 0;
        else
            count <= count + 1;
    end

endmodule
