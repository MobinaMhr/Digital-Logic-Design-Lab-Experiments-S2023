`timescale 1ns/1ns
module AcceleratorTB();
    reg clk, rst, wrStart;
    reg [1:0] ui;
    reg [4:0] vi;
    wire done, wrReq;
    wire [20:0] wrData;
    Accelerator acceleratr(.clk(clk), .rst(rst), .wrStart(wrStart), .ui(ui), .vi(vi), .done(done), .wrData(wrData), .wrReq(wrReq));
    always #5 clk = ~clk;
    initial begin
        clk = 1'b0;
        rst = 1'b0;
        #7 rst = 1'b1;
        #17 rst = 1'b0;
        wrStart = 1'b0;
        #15 ui = 2'b10;
        vi = 5'b11000;
        #30 wrStart = 1'b1;
        #40 wrStart = 1'b0;
	#1500 ui = 2'b11;
        vi = 5'b00111;
        #30 wrStart = 1'b1;
        #40 wrStart = 1'b0;
        #30000 $stop;
    end
endmodule