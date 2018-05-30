`timescale 1ns / 1ps

module PC(
    input clk, 
    input reset,
    input [31:0] nextPC,
    input PCWre,
    output reg[31:0] curPC
);
 
    always@ (posedge clk) 
    begin
        // PC初值
        if(reset == 1'b0) 
            curPC <= 0; 
        // 下条指令的地址
        else if (PCWre == 1) 
            curPC <= nextPC;
    end
endmodule
