`timescale 1ns/1ns

module FunctionGeneratorTB();
	reg clk, ldFreq;
	reg [9:0] SW;
	wire [7:0] AnalogWave;


	FunctionGenerator functionGenerator(.clk(clk), .SW(SW), .AnalogWave(AnalogWave));

	always #1 clk = ~clk;
	initial begin
		clk = 1'b0;
		SW = 10'b0;
		#20000 SW[4:2] = 3'b111;
		#100 SW[0] = 1'b1;
		#100 SW[0] = 1'b0;
		#40000 SW[9:7] = 3'd1;
		#35000 SW[6:5] = 2'b01;
		#40000 ldFreq = 1'b1;
		#30000 $stop;
	end

	
endmodule
