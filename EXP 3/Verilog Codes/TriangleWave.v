`timescale 1ns/1ns

module TriangleWave(clk, rst, TriangleWave);
	input clk, rst;
	output reg [7:0] TriangleWave =  8'd0;

	reg [7:0] count_out = 8'b0;

	always @(posedge clk) begin

		if (rst) begin
			TriangleWave = 8'd0;
		end

		else if (count_out > 8'd128) begin
			TriangleWave = 8'd128 - (count_out - 8'd128);
		end

		else begin
			TriangleWave = count_out;
		end
	end

	always @(posedge clk) begin

		if (rst) begin
			count_out = 8'b0;
		end

		else begin
			count_out = count_out + 1;
		end
	end

endmodule
