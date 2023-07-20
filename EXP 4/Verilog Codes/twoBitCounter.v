module twoBitCounter(clk, rst, cntEn, co);
    input clk, rst, cntEn;
    output co;
    reg [1:0] counter;

    always @(posedge clk, posedge rst) begin
        if (rst) 
            counter = 2'b0;
        else if(cntEn) 
            counter = counter + 1;
    end

    assign co = &counter;
endmodule
