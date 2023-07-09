`timescale 1ns/1ns

module SquareWave(clk, rst, squareWave);
	input clk, rst;
	output reg [7:0] squareWave =  8'b1111_1111;

	reg [7:0] count_out = 8'b0;

	always @(posedge clk) begin

		if (rst) begin
			squareWave = 8'b1111_1111;
		end

		else if (count_out % 8'd128 == 8'd0) begin
			squareWave = ~squareWave;
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
