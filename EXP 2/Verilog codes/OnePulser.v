`timescale 1ns/1ns

module OnePulser(clk, rst, longPulse, singlePulse);
        input clk, rst, longPulse;
        output singlePulse;
        reg singlePulse;
        reg generated;

        always @(posedge clk, posedge rst) begin
                if (rst) begin
                        singlePulse = 1'b0;
                        generated = 1'b0;
                end

                else begin
                        if (singlePulse == 1'b1) begin
                                singlePulse = 1'b0;
                        end

                        else if (~longPulse && ~generated) begin
                                singlePulse = 1'b1;
                                generated = 1'b1;
                        end
                        
                        if (longPulse && generated) begin
                                generated = 1'b0;
                        end
                end
        end

endmodule
