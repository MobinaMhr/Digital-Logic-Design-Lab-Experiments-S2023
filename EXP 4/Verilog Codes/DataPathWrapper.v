`timescale 1ns/1ns

module DataPathWrapper(clk, rst, ld, start, uiRegLd, shEn, ui, fracInput, done, wrData);
    input clk, rst, ld, start, uiRegLd, shEn;
    input [4:0] fracInput;
    input [1:0] ui;
    output done;
    output [20:0] wrData;
    wire [1:0] uiOut, intpart;
    wire [15:0] engX, fracPart;

    shiftReg shftRg (.clk(clk), .shEn(shEn), .ld(ld), .rst(rst), .dataIn({3'b0, fracInput, 8'b0}), .dataOut(engX));
    shiftComb shftCmb (.shiftNumb(uiOut), .dataIn({intpart, fracPart}), .dataOut(wrData));
    uiReg uRg (.clk(clk), .uiRegLd(uiRegLd), .ui(ui), .uiOut(uiOut));
    exponential exp (.clk(clk), .rst(rst), .start(start), .x(engX), .done(done), .intpart(intpart), .fracpart(fracPart));

endmodule