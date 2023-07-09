`timescale 1ns/1ns

module NineBitCounter(clk, rst, ldEn, parIn, cOut, parOut);
	input clk, rst, ldEn;
	input [8:0] parIn;
	output cOut;
	output [8:0] parOut;
	reg [8:0] parOut; 
	reg cOut;
	always @(posedge clk, posedge rst) begin
		if(rst) begin
			parOut = 9'b0;
		end
		else if (ldEn) begin
			parOut = parIn;
			cOut = 1'b0;
		end
		else begin
			{cOut, parOut} = parOut + 1;
		end
	end
endmodule