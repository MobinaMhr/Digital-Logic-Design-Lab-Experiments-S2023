module SSDTB();
        reg [3:0] dataIn;
        wire [6:0] seg0, seg1;
        SSD CUT(.dataIn(dataIn), .seg0(seg0), .seg1(seg1));
        initial begin
                dataIn = 4'd0;
                #37 dataIn = 4'd5;
                #42 dataIn = 4'd7;
                #53 dataIn = 4'd14;
                #101 $stop;
        end

endmodule
