`timescale 1ns/1ns

module OnePUlserTB();
        reg clk, rst, longPulse;
        wire singlePulse;

        OnePulser UUT (.clk(clk), .rst(rst), .longPulse(longPulse), .singlePulse(singlePulse));
        
        always #5 clk = ~clk;

        initial begin
                {clk, rst, longPulse} = 3'b0;
                #2 rst = 1'b1;
                #2 longPulse = 1'b1;
                #12 rst = 1'b0;
                #200 longPulse = 1'b0;
                #400 longPulse = 1'b1;
                #40 longPulse = 1'b0;
                #30 $stop;
        end

endmodule