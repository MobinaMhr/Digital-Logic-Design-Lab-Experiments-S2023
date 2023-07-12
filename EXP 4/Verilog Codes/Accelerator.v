module Accelerator(clk, rst, wrStart, ui, vi,  done, wrData, wrReq);
    input clk, wrStart, rst;
    input [1:0] ui;
    input [4:0] vi;
    output done, wrReq;
    output [20:0] wrData;

  
    wire co, ld, engStart, uiRegLd, shEn, engDone;
    ControlerWrapper cntrllerWrapper(.clk(clk), .rst(rst), .start(wrStart), .engDone(engDone),
				    .done(done), .wrReq(wrReq), .shEn(shEn), .ld(ld), .engStart(engStart), .uiRegLd(uiRegLd));
    DataPathWrapper dPthWrapper (.clk(clk), .rst(rst), .ld(ld), .start(engStart), .uiRegLd(uiRegLd), .shEn(shEn),
					.ui(ui), .fracInput(vi), .done(engDone), .wrData(wrData));
endmodule
