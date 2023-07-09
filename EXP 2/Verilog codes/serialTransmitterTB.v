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
                #200 clkPB = 1'b1;
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
                #17 clkPB = 1'b1;
                #85 clkPB = 1'b0;
                #17 clkPB = 1'b1;
                #85 clkPB = 1'b0;
                #17 clkPB = 1'b1;
                #85 clkPB = 1'b0;
                #17 clkPB = 1'b1;
                #85 clkPB = 1'b0;
                #17 clkPB = 1'b1;
                #85 clkPB = 1'b0;
                #17 clkPB = 1'b1;
                #85 clkPB = 1'b0;
                #17 clkPB = 1'b1;
                #85 clkPB = 1'b0;
                #17 clkPB = 1'b1;
                #85 clkPB = 1'b0;


                #200 $stop;
        end

endmodule



        // initial begin
        //         {clk, rst, serIn, clkPB} = 4'b0;
        //         #2 rst = 1'b1;
        //         #2 clkPB = 1'b1;//on1
        //         #10 rst = 1'b0;
        //         #100 clkPB = 1'b0;//off1
        //         #7 serIn = 1'b1;////////////////////////////////////////////////
        //         #2 clkPB = 1'b1;//on2
        //         #100 clkPB = 1'b0;//off2
        //         #200 clkPB = 1'b1;//on3
        //         #100 clkPB = 1'b0;//off3
        //         #17 serIn = 1'b0;////////////////////////////////////////////////
        //         #2 clkPB = 1'b1;//on4
        //         #100 clkPB = 1'b0;//off4
        //         #10 serIn = 1'b1;////////////////////////////////////////////////
        //         #2 clkPB = 1'b1;//on5
        //         #100 clkPB = 1'b0;//off5
        //         #20 serIn = 1'b0;////////////////////////////////////////////////
        //         #2 clkPB = 1'b1;//on6
        //         #100 clkPB = 1'b0;//off6
        //         #10 serIn = 1'b1;////////////////////////////////////////////////
        //         #2 clkPB = 1'b1;//on7
        //         #100 clkPB = 1'b0;//off7
        //         #10 serIn = 1'b0;////////////////////////////////////////////////
        //         #2 clkPB = 1'b1;//on8
        //         #100 clkPB = 1'b0;//off8
        //         #10 serIn = 1'b1;////////////////////////////////////////////////
        //         #2 clkPB = 1'b1;//on9
        //         #100 clkPB = 1'b0;//off9
        //         #10 serIn = 1'b0;////////////////////////////////////////////////
        //         #2 clkPB = 1'b1;//on10
        //         #100 clkPB = 1'b0;//off10
        //         #10 serIn = 1'b1;////////////////////////////////////////////////
        //         #2 clkPB = 1'b1;//on11
        //         #100 clkPB = 1'b0;//off11
        //         #200 $stop;
        // end