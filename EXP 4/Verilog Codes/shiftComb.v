`timescale 1ns/1ns
module shiftComb(shiftNumb, dataIn, dataOut);
    input [1:0] shiftNumb;
    input [17:0] dataIn;
    output [20:0] dataOut;
    assign dataOut = {3'b0, dataIn} << shiftNumb;
endmodule
