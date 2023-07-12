module PWM(clk, rst, data, PWM_out);
	input clk, rst;
	input [7:0] data;
	output reg PWM_out;

	reg [7:0] pulse_width = 8'b0;

	always @(posedge clk) begin
		if (rst) 
			pulse_width = 8'b0;

		else begin
			if (pulse_width == 8'b0) 
				PWM_out = 1'b1;
			else if (pulse_width == data)
				PWM_out = 1'b0;
			pulse_width = pulse_width + 1;
		end
	end
endmodule  
