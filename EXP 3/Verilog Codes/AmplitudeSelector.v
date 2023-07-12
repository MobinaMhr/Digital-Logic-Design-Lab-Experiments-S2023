module AmplitudeSelector(dataIn, selector, dataOut);
	input [7:0] dataIn;
	input [1:0] selector;
	output reg [7:0] dataOut;
	always @(dataIn, selector) begin
		dataOut = dataIn;
		case(selector)
			2'b00: dataOut = dataIn;
			2'b01: dataOut = dataIn >> 1;
			2'b10: dataOut = dataIn >> 2;
			2'b11: dataOut = dataIn >> 3;
			default: dataOut = dataIn;
		endcase
	end
endmodule 
