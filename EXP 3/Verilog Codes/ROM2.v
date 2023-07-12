module ROM3(clk, address, dOut);
    input clk;
    input [7:0] address;
    output reg [7:0] dOut;
    (* romstyle = "M4K" *)(* ram_init_file = "sine.mif" *) reg [7:0] rom [255:0];
    always @(posedge clk) begin
        dOut = rom[address];
    end
endmodule
