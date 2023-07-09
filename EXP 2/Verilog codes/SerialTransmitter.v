`timescale 1ns/1ns

module SerialTransmitter(clk, rst, clkPB, serIn, seg0, seg1, serOut, serOutValid);
        input clk, rst, clkPB, serIn;
        output [6:0] seg0, seg1;
        output serOut, serOutValid;

        wire clkEn;
        wire [3:0] countOut;

        OnePulser onePulser (.clk(clk), .rst(rst), .longPulse(clkPB), .singlePulse(clkEn));
        SequenceDetector sequenceDetector (.clk(clk), .rst(rst), .serIn(serIn), .clkEn(clkEn),
                                           .countOut(countOut), .serOut(serOut), .serOutValid(serOutValid));
        SSD ssd (.dataIn(countOut), .seg0(seg0), .seg1(seg1));


endmodule
