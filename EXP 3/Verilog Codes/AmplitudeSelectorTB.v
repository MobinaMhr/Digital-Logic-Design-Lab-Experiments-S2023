`timescale 1ns/1ns

module AmplitudeSelectorTB();
	reg [7:0] dataIn;
	reg [1:0] selector;
	wire [7:0] dataOut;

	AmplitudeSelector UUT(.dataIn(dataIn), .selector(selector), .dataOut(dataOut));
		
	initial begin 
		dataIn = 8'd56;
		selector = 2'b00;
		#100 selector = 2'b01;
		#200 dataIn = 8'd128;
		#100 selector = 2'b10;
		#200 selector = 2'b11;
		#500 $stop;
	end
		
endmodule
