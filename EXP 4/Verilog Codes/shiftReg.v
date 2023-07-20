module shiftReg(clk, shEn, ld, rst, dataIn, dataOut);
    input clk, shEn, ld, rst;
    input [15:0] dataIn;
    output [15:0] dataOut;
    reg [15:0] data;
    
    always @(posedge clk, posedge rst) begin
        if (rst) 
            data = 16'b0;
        else if (ld) 
            data = dataIn;
        else if (shEn) 
            data = data << 1;
    end

    assign dataOut = data;

endmodule