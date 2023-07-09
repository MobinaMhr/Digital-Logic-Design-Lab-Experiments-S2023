`timescale 1ns/ 1ns

module PWM(clk, rst, data, PWM_out);
	input clk, rst;
	input [7:0] data;
	output reg PWM_out;

	reg [7:0] pulse_width = 8'b0;

	always @(posedge clk) begin

		if (rst) begin
			pulse_width = 8'b0;
		end

		else begin

			if (pulse_width == 8'b0) begin
				PWM_out = 1'b1;
			end

			if (pulse_width == data) begin
				PWM_out = 1'b0;
			end

			pulse_width = pulse_width + 1;
		end
	end
endmodule  
