`timescale 1ns/1ns

module PWM_TB();
	reg clk, rst;
	reg [7:0] data;
	wire PWM_out;

	PWM UUT(.clk(clk), .rst(rst), .data(data), .PWM_out(PWM_out));

	always #1 clk = ~clk;

	initial begin
		clk = 1'b0;
		rst = 1'b0;
		data = 8'b0;
		#1000 data = 8'd20;
		#2000 data = 8'd255;
		#2000 data = 8'b0;
		#3000 data = 8'd200;
		#2000 rst = 1'b1;
		#100 rst = 1'b0;
		#2000 $stop;
	end
endmodule
