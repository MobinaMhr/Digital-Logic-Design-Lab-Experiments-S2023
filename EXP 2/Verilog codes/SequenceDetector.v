`define S0 3'b000
`define S1 3'b001
`define S2 3'b010
`define S3 3'b011
`define S4 3'b100
`define S5 3'b101
`define S6 3'b110

module SequenceDetector(clk, rst, serIn, clkEn, countOut, serOut, serOutValid);
        input clk, rst, serIn, clkEn;
        output [3:0] countOut;
        output serOut, serOutValid;
        
        reg serOutValid;
        reg rstCnt, incCnt;
        reg [2:0] ps, ns;
        reg [3:0] countOut;
        
        wire co;

        always @(ps, co, serIn) begin
                ns = `S0;
                case (ps)
                        `S0 : ns = serIn ? `S1 : `S0; 
                        `S1 : ns = serIn ? `S2 : `S0;
                        `S2 : ns = serIn ? `S2 : `S3;
                        `S3 : ns = serIn ? `S4 : `S0;
                        `S4 : ns = serIn ? `S2 : `S5;
                        `S5 : ns = serIn ? `S6 : `S0;
                        `S6 : ns = co    ? `S0 : `S6;
                        default: ns = `S0;
                endcase
        end

        always @(ps) begin
                {rstCnt, incCnt, serOutValid} = 3'b0;
                case (ps)
                        `S5 : rstCnt = 1'b1;
                        `S6 : {incCnt, serOutValid} = 2'b11;
                        default: {rstCnt, incCnt, serOutValid} = 3'b0;
                endcase
        end

        

        always @(posedge clk, posedge rst) begin
                if (rst) 
                        ps <= `S0;
                else if (clkEn) 
                        ps <= ns;
        end

        always @(posedge clk, posedge rst) begin
                if (rst) 
                        countOut = 4'b0;

                else if (clkEn) begin 
                        if (rstCnt) 
                                countOut = 4'b0110;
                        else if (incCnt) 
                                countOut = countOut + 1;
                end
        end

        assign co = &countOut;
	assign serOut = serIn;
endmodule
