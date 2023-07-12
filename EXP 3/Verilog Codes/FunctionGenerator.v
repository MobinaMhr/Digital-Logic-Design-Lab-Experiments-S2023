module FunctionGenerator(clk, SW, AnalogWave);
	
	input clk;
	input [9:0] SW;
	output AnalogWave;

	wire lowFreqClk;
	wire [7:0] DigitalWave, DigitalWaveAmp;
	FrequencySelector FS(.clk(clk), .rst(SW[0]), .ld(SW[0]), .parIn(SW[4:2]), .clkOut(lowFreqClk));
	WaveformGenerator WG(.clk(lowFreqClk), .rst(SW[0]), .waveSelector(SW[9:7]), .dataOut(DigitalWave));
	AmplitudeSelector AS(.dataIn(DigitalWave), .selector(SW[6:5]), .dataOut(DigitalWaveAmp));
	PWM pwm(.clk(clk), .rst(SW[0]), .data(DigitalWaveAmp), .PWM_out(AnalogWave));

endmodule
