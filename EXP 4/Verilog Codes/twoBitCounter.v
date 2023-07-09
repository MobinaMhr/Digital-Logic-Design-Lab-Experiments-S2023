`timescale 1ns/1ns
module twoBitCounter(clk, rst, cntEn, co);
    input clk, rst, cntEn;
    output co;
    reg [1:0] counter;
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            counter = 2'b0;
        end
        else if(cntEn) begin
            counter = counter + 1;
        end

    end
    assign co = &counter;
endmodule
