`timescale 1ns/1ns
module exponentialTB();
	reg clk, rst, start;
	reg [15:0] x;
	wire done;
	wire [1:0] intpart;
	wire [15:0] fracpart;
	exponential cut(.clk(clk), .rst(rst), .start(start), .x(x), .done(done), .intpart(intpart), .fracpart(fracpart));
	always #5 clk = ~clk;
	initial begin 
		clk = 1'b0;
		rst = 1'b0;
		start = 1'b0;
		x = 16'b0;
		#9 start = 1'b1;
		#90 start = 1'b0;
		#1000 x = 16'b1110_1101_0011_1100;
		#9 start = 1'b1;
		#50 start = 1'b0;
		#500 x = 16'b0110_0000_0000_0000;
		#9 start = 1'b1;
		#50 start = 1'b0;
		#10000 $stop;
	end
	
endmodule


