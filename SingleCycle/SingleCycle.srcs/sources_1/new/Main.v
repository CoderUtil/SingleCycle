`timescale 1ns / 1ps

`include "ALU.v"
`include "ControlUnit.v"
`include "DataSelect_2choices_5bits.v"
`include "DataSelect_2choices_32bits.v"
`include "DataSelect_3choices_32bits.v"
`include "Extended.v"
`include "PC.v"
`include "PCAddFour.v"
`include "PCAddIm.v"
`include "PCAddj.v"
`include "RegFile.v"
`include "RMWM.v"
`include "RW.v"

module Main(
    input CLK,
    input Reset,
    input [1:0] button,
    output [31:0] nowIns, 
    output [31:0] nextAddr, 
    output [31:0] aluRe, 
    output [31:0] writeData, 
    output [31:0] readData1, 
    output [31:0] readData2, 
    output [31:0] RAMDataOut,
    output [2:0] aluOp
);
    wire [31:0] i_pc, o_pc_1, extendData, choice1, choice2;
    reg [3:0] d;
    wire ExtSel, PCWre, InsMemRW, zero, sign, RegDst, RegWre, ALUSrcA, ALUSrcB, RD, WR, DBDataSrc;
   
    wire [1:0] PCSrc;
    wire [4:0] WriteReg;
    wire [31:0] ALUB, ALUA;

     
    PC PC(CLK, Reset, i_pc, PCWre, nextAddr);
    PCAddFour PCAddFour(nextAddr, o_pc_1);
    PCAddj PCAddj(o_pc_1, nowIns, choice2);
    PCAddIm PCAddIm(o_pc_1, extendData, choice1);
    RW RW(InsMemRW, nextAddr, nowIns);
    ControlUnit ControlUnit(nowIns[31:26], zero, sign, ExtSel, PCWre, InsMemRW, RegDst, RegWre, aluOp, PCSrc, ALUSrcA, ALUSrcB, RD, WR, DBDataSrc);
    RegFile RegFile(CLK, RegWre, nowIns[25:21], nowIns[20:16], WriteReg, writeData, readData1, readData2);
    Extended Extended(nowIns[15:0], ExtSel, extendData);
    DataSelect_2choices_5bits select_1(nowIns[20:16], nowIns[15:11], RegDst, WriteReg);
    DataSelect_2choices_32bits select_2(extendData, readData2, ~ALUSrcB, ALUB);
    DataSelect_2choices_32bits select_3(RAMDataOut, aluRe, ~DBDataSrc, writeData);
    DataSelect_2choices_32bits select_4(readData1, nowIns, ALUSrcA, ALUA);
    DataSelect_3choices_32bits select5(o_pc_1, choice1, choice2, PCSrc, i_pc);
    ALU ALU(ALUA, ALUB, aluOp, aluRe, zero, sign);
    RMWM RMWM(CLK, aluRe, readData2, RD, WR, RAMDataOut);
    
endmodule
