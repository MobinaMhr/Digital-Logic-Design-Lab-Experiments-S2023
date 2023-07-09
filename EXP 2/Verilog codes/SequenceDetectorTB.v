`timescale 1ns/1ns

module SequenceDetectorTB();
        reg clk, rst, serIn, clkEn;
        wire [3:0] countOut;
        wire serOut, serOutValid;
        
        SequenceDetector CUT (.clk(clk), .rst(rst), .serIn(serIn), .clkEn(clkEn), .countOut(countOut), .serOut(serOut), .serOutValid(serOutValid));

        always #5 clk = ~clk;

        initial begin
                repeat (100) #5 clkEn = ~clkEn;
        end

        initial begin
                {clk, rst, serIn, clkEn} = 4'b0;
                #2 rst = 1'b1;
                #10 rst = 1'b0;
                #7 serIn = 1'b1;
                #17 serIn = 1'b0;
                #10 serIn = 1'b1;
                #20 serIn = 1'b0;
                #10 serIn = 1'b1;
                #10 serIn = 1'b0;
                #10 serIn = 1'b1;
                #10 serIn = 1'b0;
                #10 serIn = 1'b1;
                #200 $stop;
        end
endmodule