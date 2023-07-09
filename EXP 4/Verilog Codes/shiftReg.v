`timescale 1ns/1ns
module shiftReg(clk, shEn, ld, rst, dataIn, dataOut);
    input clk, shEn, ld, rst;
    input [15:0] dataIn;
    output [15:0] dataOut;
    reg [15:0] data;
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            data = 16'b0;
        end
        else if (ld) begin
            data = dataIn;
        end
        else if (shEn) begin
            data = data << 1;
        end
    end
    assign dataOut = data;
endmodule