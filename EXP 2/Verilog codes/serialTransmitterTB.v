`timescale 1ns/1ns

module SerialTransmitterTB();
        reg clk, rst, clkPB, serIn;
        wire [6:0] seg0, seg1; 
        wire serOut, serOutValid;
        SerialTransmitter CUT(.clk(clk), .rst(rst), .clkPB(clkPB), .serIn(serIn),
                              .seg0(seg0), .seg1(seg1), .serOut(serOut), .serOutValid(serOutValid));

        always #5 clk = ~clk;

        initial begin
                {clk, rst, serIn, clkPB} = 4'b0;
                #2 rst = 1'b1;
                #2 clkPB = 1'b1;
                #10 rst = 1'b0;

                #85 clkPB = 1'b0;
                #7 serIn = 1'b1;
                #2 clkPB = 1'b1;

                #85 clkPB = 1'b0;
                #17 serIn = 1'b0;
                #2 clkPB = 1'b1;

                #85 clkPB = 1'b0;
                #10 serIn = 1'b1;
                #2 clkPB = 1'b1;

                #85 clkPB = 1'b0;
                #20 serIn = 1'b0;
                #2 clkPB = 1'b1;

                #85 clkPB = 1'b0;
                #10 serIn = 1'b1;
                #2 clkPB = 1'b1;

                #85 clkPB = 1'b0;
                #10 serIn = 1'b0;
                #2 clkPB = 1'b1;

                #85 clkPB = 1'b0;
                #10 serIn = 1'b1;
                #2 clkPB = 1'b1;

                #85 clkPB = 1'b0;
                #10 serIn = 1'b0;
                #2 clkPB = 1'b1;

                #85 clkPB = 1'b0;
                #10 serIn = 1'b1;

                repeat (10) begin 
                        #17 clkPB = 1'b1;
                        #85 clkPB = 1'b0; 
                end
                #200 $stop;
        end

endmodule