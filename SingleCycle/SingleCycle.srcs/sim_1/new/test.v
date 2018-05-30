`timescale 1ns / 1ps

module test();
    reg CLK;
    reg Reset;
     wire [31:0] nowIns;
     wire [31:0] nextAddr;
     wire [31:0] aluRe;
       wire [31:0] writeData;
       wire [31:0] readData1;
       wire [31:0] readData2;
      
       wire [31:0] RAMDataOut;
       wire [2:0] aluOp;
    
       
    Main uut(
    .CLK(CLK),
    .Reset(Reset),
       .nowIns(nowIns), 
         .nextAddr(nextAddr), 
         .aluRe(aluRe), 
         .writeData(writeData), 
         .readData1(readData1), 
         .readData2(readData2), 
         .RAMDataOut(RAMDataOut), 
         .aluOp(aluOp) 
         );
         
        always #50 CLK = ~CLK; // 周期为 10ns
          initial begin
          CLK = 0;
          Reset = 0;
          #100 Reset = 1; // 从 100ns 开始仿真输出
          end
endmodule
