`timescale 1ns / 1ps

module Extended(
    input [15:0]original,
    input ExtSel,
    output reg [31:0]ext_num
);
    integer i;
    always @(original or ExtSel)
    begin
        if(ExtSel == 0)
        begin
            for(i = 16; i < 32; i = i + 1)
                ext_num[i] = 0;
            ext_num[15:0] = original;
        end
        else 
        begin
            for(i = 16; i < 32; i = i + 1)
                ext_num[i] = original[15];
            ext_num[15:0] = original;
        end
    end
endmodule
