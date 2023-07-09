`timescale 1ns/1ns

module FrequencySelector(clk, rst, ld, parIn, clkOut);
	input clk, rst, ld;
	input [2:0] parIn;
	output clkOut;
	wire carryOut;
	NineBitCounter counter(.clk(clk), .rst(rst), .ldEn(ld || carryOut),
				 .parIn({parIn, 6'b0}), .cOut(carryOut));
	assign clkOut = carryOut;
endmodule


