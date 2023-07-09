`timescale 1ns/1ns

module ReciprocalWave(clk, rst, ReciprocalWave);
	input clk, rst;
	output reg [7:0] ReciprocalWave =  8'd0;

	reg [7:0] count_out = 8'b0;

	always @(posedge clk) begin

		if (rst) begin
			ReciprocalWave = 8'b0;
		end

		else if (count_out == 8'b0) begin 
			ReciprocalWave = 8'b0;
		end

		else begin
			
			ReciprocalWave = 8'd255 / (8'd255 - count_out + 8'd1);
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
