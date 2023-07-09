`timescale 1ns/1ns

module FrequencySelectorTB();
	reg clk, rst, ld;
	reg [2:0] parIn;
	wire clkOut;	

	always #5 clk = ~clk;
	FrequencySelector CUT(.clk(clk), .rst(rst), .ld(ld), .parIn(parIn), .clkOut(clkOut));
	
	initial begin
		clk = 1'b1;
		rst = 1'b0;
		#59 parIn = 3'b111;
		#50 ld = 1'b1;
		#15 ld = 1'b0;
		#130 rst = 1'b1;
		#9 rst = 1'b0;
		#7 parIn = 3'b010;
		#40 ld = 1'b1;
		#40 ld = 1'b0;
		#59100 $stop;
	end
endmodule