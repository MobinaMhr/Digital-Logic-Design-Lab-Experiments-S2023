module DDS(clk, rst, romSinWave);
	input clk, rst;
	output romSinWave;
	reg [7:0] counter = 8'b0;

	always @(posedge clk) begin
		if (rst) begin
			counter = 8'b0;
		end
		else begin
			counter = counter + 1;
		end
	end
	
	assign romSinWave = counter;
endmodule
