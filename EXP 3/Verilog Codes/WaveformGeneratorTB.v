`timescale 1ns/1ns

module WaveformGenratorTB();
	reg clk = 1'b0, rst=1'b0;
	reg [2:0] sel;
	wire Wave;
	
	WaveformGenerator UUT(.clk(clk), .rst(rst), .waveSelector(sel), .dataOut(Wave));
	always #10 clk = ~clk;

	initial begin 
		clk = 1'b0;
		rst = 1'b0;
		sel = 3'b000;
		#10000 sel = 3'b001;
		#10000 sel = 3'b010;

		#10000 $stop;
	
	end


endmodule

	
