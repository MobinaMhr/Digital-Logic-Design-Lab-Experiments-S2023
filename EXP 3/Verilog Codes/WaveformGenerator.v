`define SIN_0 16'd0
`define COS_0 16'd30000
`define OFFSET 8'd127

module WaveformGenerator(clk, rst, waveSelector, dataOut, romIn);
	input clk, rst;
	input [2:0] waveSelector;
	input [7:0] romIn;
	output reg [7:0] dataOut;
	

	wire [7:0] reciprocalWave, squareWave, triangleWave, 
			   sinWave, fullRectifiedWave, halfRectifiedWave;

	ReciprocalWave      Reciprocal(.clk(clk), .rst(rst), .ReciprocalWave(reciprocalWave));
	SquareWave          Square(.clk(clk), .rst(rst), .squareWave(squareWave));
	TriangleWave        Triangle(.clk(clk), .rst(rst), .TriangleWave(triangleWave));
	SinandRectifiedWave Sin(.clk(clk), .rst(rst), .sinWave(sinWave), 
							.fullRectifiedWave(fullRectifiedWave), .halfRectifiedWave(halfRectifiedWave));

	always @(waveSelector, reciprocalWave, squareWave, triangleWave, 
			 sinWave, fullRectifiedWave, halfRectifiedWave) begin
		dataOut = 8'b0;
		case(waveSelector)
			3'b000 : dataOut = reciprocalWave;
			3'b001 : dataOut = squareWave;
			3'b010 : dataOut = triangleWave;
			3'b011 : dataOut = sinWave;
			3'b100 : dataOut = fullRectifiedWave;
			3'b101 : dataOut = halfRectifiedWave;
			3'b110 : dataOut = romIn;
			default: dataOut = 8'b0;
		endcase
	end
endmodule
		
	
