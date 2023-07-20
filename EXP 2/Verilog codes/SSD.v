module SSD(dataIn, seg0);
        input [3:0] dataIn;
        output [6:0] seg0;
        reg [6:0] seg0;

        always @(dataIn) begin
                seg0 = 7'b0;
                case(dataIn)
                        4'd0 : {seg0[6]} = 1'b1;
                        4'd1 : {seg0 [6:3], seg0[0]} = 5'b1_1111;
                        4'd2 : {seg0[5], seg0[2]} = 2'b11;
                        4'd3 : {seg0[5:4]} = 2'b11;
                        4'd4 : {seg0[4:3], seg0[0]} = 3'b111;
                        4'd5 : {seg0[4], seg0[1]} = 2'b11;
                        4'd6 : {seg0[1]} = 1'b1;
                        4'd7 : {seg0[6:3]} = 4'b1111;
                        4'd9 : {seg0[4]} = 1'b1;
                        4'd10: {seg0[3]} = 1'b1;
                        4'd11: {seg0[1:0]} = 2'b11;
                        4'd12: {seg0[2:1], seg0[6]} = 3'b111;
                        4'd13: {seg0[0], seg0[5]} = 2'b11;
                        4'd14: {seg0[2:1]} = 2'b11;
                        4'd15: {seg0[3:1]} = 3'b111;
                        default: seg0 = 7'b0;
                endcase
        end
        
endmodule
