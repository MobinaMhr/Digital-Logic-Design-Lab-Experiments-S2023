module ReciprocalWave(clk, rst, ReciprocalWave);
	input clk, rst;
	output reg [7:0] ReciprocalWave =  8'd0;

	reg [7:0] count_out = 8'b0;

	always @(posedge clk) 
		if (rst) 
			ReciprocalWave = 8'b0;
		else if (count_out == 8'b0) 
			ReciprocalWave = 8'b0;
		else 
			ReciprocalWave = 8'd255 / (8'd255 - count_out + 8'd1);
	end

	always @(posedge clk) begin 
		if (rst) 
			count_out = 8'b0;
		else 
			count_out = count_out + 1;
	end

endmodule
