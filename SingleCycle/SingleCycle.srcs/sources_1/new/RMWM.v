`timescale 1ns / 1ps

module RMWM(
    input clk,
    input [31:0] address,
    input [31:0] writeData, 
    input nRD, 
    input nWR, 
    output [31:0] Dataout
);
    reg [7:0] ram [0:60]; 

    assign Dataout[7:0] = (nRD == 1) ? ram[address + 3] : 8'bz; 
    assign Dataout[15:8] = (nRD == 1) ? ram[address + 2] : 8'bz;
    assign Dataout[23:16] = (nRD == 1) ? ram[address + 1] : 8'bz;
    assign Dataout[31:24] = (nRD == 1) ? ram[address ] : 8'bz;

    always@ (negedge clk) 
    begin 
        if(nWR == 1) 
        begin
            ram[address] <= writeData[31:24];
            ram[address + 1] <= writeData[23:16];
            ram[address + 2] <= writeData[15:8];
            ram[address + 3] <= writeData[7:0];
        end
    end
endmodule
