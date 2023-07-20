module TriangleWave(clk, rst, TriangleWave);
	input clk, rst;
	output reg [7:0] TriangleWave =  8'd0;

	reg [7:0] count_out = 8'b0;

	always @(posedge clk) begin
		if (rst) 
			TriangleWave = 8'd0;
		else if (count_out > 8'd128) 
			TriangleWave = 8'd128 - (count_out - 8'd128);
		else 
			TriangleWave = count_out;
	end

	always @(posedge clk) begin
		if (rst) 
			count_out = 8'b0;
		else 
			count_out = count_out + 1;
	end

endmodule
