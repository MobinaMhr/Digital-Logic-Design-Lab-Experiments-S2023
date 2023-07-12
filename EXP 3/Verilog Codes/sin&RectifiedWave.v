`define SIN_0 16'd0
`define COS_0 16'd30000
`define OFFSET 8'd127

module SinandRectifiedWave(clk, rst, sinWave, fullRectifiedWave, halfRectifiedWave);
	input clk, rst;
	output reg [7:0] sinWave 	       = `SIN_0,
					 fullRectifiedWave = `SIN_0,
					 halfRectifiedWave = `SIN_0;

	reg [15:0] sin_out = `SIN_0, cos_out = `COS_0, 
			   fullRectified = `SIN_0, halfRectified = `SIN_0;
	reg [7:0] sin_out_offset, cos_out_offset ;
	reg [7:0] count_out = 8'b0;
	
	always @(posedge clk) begin
		if (rst) begin 
			sin_out = `SIN_0;
			cos_out = `COS_0;
			fullRectified = `SIN_0;
			halfRectified = `SIN_0;
		end
		else begin
			sin_out = sin_out + {{6{cos_out[15]}}, cos_out[15:6]}; 
			cos_out = cos_out - {{6{sin_out[15]}}, sin_out[15:6]};
			fullRectified = (sin_out[15]) ? -sin_out : sin_out;
			halfRectified = (sin_out[15]) ? 16'b0 : sin_out;
		end

		sin_out_offset = sin_out[15:8] + `OFFSET;
		cos_out_offset = cos_out[15:8] + `OFFSET;
		sinWave = sin_out_offset;
		fullRectifiedWave = fullRectified[15:8];
		halfRectifiedWave = halfRectified[15:8];
	end	

	always @(posedge clk) begin
		if (rst) 
			count_out = 8'b0;
		else 
			count_out = count_out + 1;
	end
	
endmodule
		
	
