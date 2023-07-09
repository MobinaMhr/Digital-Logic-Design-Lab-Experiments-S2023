-`timescale 1ns/1ns
module ControlerWrapper(clk, rst, start, engDone, done, wrReq, shEn, ld, engStart, uiRegLd);
    input clk, start, rst, engDone;
    output done, wrReq, shEn, ld, engStart, uiRegLd;
    reg done, uiRegLd, ld, engStart, shEn, wrReq;
    
    parameter [2:0] Idle = 3'd0, ldV = 3'd1, eng = 3'd2, calc = 3'd3, shift = 3'd4;
    
    reg [2:0] ps, ns; 
    reg cntEn;
    wire co;

    twoBitCounter twobitcounter(.clk(clk), .rst(rst), .cntEn(cntEn), .co(co));

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            ps = Idle;
        end
        else begin
            ps = ns;
        end
    end

    always @(ps, start, engDone, co) begin
        ns = Idle;
        case(ps)
            Idle: ns = start? ldV : Idle;
            ldV: ns = eng;
            eng: ns = calc;
            calc: ns = engDone ? shift : calc;
            shift: ns = co ? Idle : eng;
            default: ns = Idle;
        endcase
    end
    
    always @(ps) begin
        {done, uiRegLd, ld, engStart, cntEn, shEn, wrReq} = 7'b0;
        case(ps)
            Idle: done = 1'b1;
            ldV: {uiRegLd, ld} = 2'b11;
            eng: engStart = 1'b1;
            calc: ;
            shift: {cntEn, shEn, wrReq} = 3'b111;
            default: {done, uiRegLd, ld, engStart, cntEn, shEn, wrReq} = 7'b0;
        endcase
    end


endmodule

