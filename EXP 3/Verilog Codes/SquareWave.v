module SquareWave(clk, rst, squareWave);
	input clk, rst;
	output reg [7:0] squareWave =  8'b1111_1111;

	reg [7:0] count_out = 8'b0;

	always @(posedge clk) begin
		if (rst) 
			squareWave = 8'b1111_1111;
		else if (count_out % 8'd128 == 8'd0) 
			squareWave = ~squareWave;
	end

	always @(posedge clk) begin
		if (rst) 
			count_out = 8'b0;
		else 
			count_out = count_out + 1;
	end

endmodule
