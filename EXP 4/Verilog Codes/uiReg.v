module uiReg(clk, uiRegLd, ui, uiOut);
    input clk, uiRegLd;
    input [1:0] ui;
    output [1:0] uiOut;
    reg [1:0] data;

    always @(posedge clk) begin
        if (uiRegLd) begin
            data = ui;
        end
    end

    assign uiOut = data;

endmodule
